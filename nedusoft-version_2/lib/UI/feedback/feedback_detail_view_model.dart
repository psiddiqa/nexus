import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:nedusoft/app/app.router.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../Utils/custom_snackbar.dart';
import '../../../core/API/api_service.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../../core/services/needed_utils.dart';
import '../../../main.dart';
import '../../models/student/student_feedback_detail_model.dart';

class StudentFeedBackDetailViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();

  StudentFeedbackDetail? feedbackDetailModel;

  init(String nId) async {
    setBusy(true);
    await getFeedbackDetail(nId);
    notifyListeners();
    setBusy(false);
  }

  navigateToHistoryScreen() async {
    _navigationService.navigateTo(Routes.feedbackHistoryScreen, arguments: FeedbackHistoryScreenArguments(assignId: feedbackDetailModel!.data!.facultyId!.toString(), subject: "", dataList: feedbackDetailModel!.list!));
  }

  Status? selectStatus;
  List<Status> statusList = [];

  changeStatusValue(Status val) async {
    selectStatus = val;
    notifyListeners();
  }

  Future<void> getFeedbackDetail(String id) async {
    try {
      setBusy(true);
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      feedbackDetailModel = await apiService.getStudentFeedbackDetail({"LoginName": _neededVariables.loginModel!.loginName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "EmployeeId": _neededVariables.loginModel!.employeeId, "PersonId": _neededVariables.loginModel!.personId, "Value": id});
      if (feedbackDetailModel != null) {
        statusList.addAll(feedbackDetailModel!.status!);
      }
      changeStatusValue(statusList[0]);
      setBusy(false);
    } catch (e) {
      setBusy(false);
    }
  }

  File? file;
  String? baseName;

  pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );

    if (result != null) {
      file = File(result.files.single.path!);
      baseName = basename(file!.path);
      notifyListeners();
    } else {
      // User canceled the picker
    }
  }


  Future<File> loadPdfFromNetwork(String url) async {
    setBusy(true);
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;
    setBusy(false);
    return _storeFile(url, bytes);
  }

  Future<File> _storeFile(String url, List<int> bytes) async {
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    if (kDebugMode) {
      print('$file');
    }
    return file;
  }

  void openPdf(File file, String url, String name) {
    _navigationService.navigateTo(Routes.pdfViewer, arguments: PdfViewerArguments(file: file, url: url, fileName: name));
  }
}
