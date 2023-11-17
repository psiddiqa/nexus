import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nedusoft/app/app.router.dart';
import 'package:nedusoft/models/staff_notification_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../Utils/custom_snackbar.dart';
import '../../../core/API/api_service.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../../core/services/needed_utils.dart';
import '../../../main.dart';
import '../../../models/staff/feedback_detail_model.dart';
import '../../../models/staff/notification_detail.dart';

class StaffFeedBackDetailViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();

  FeedbackDetailModel? feedbackDetailModel;
  TextEditingController remark = TextEditingController();
  init(String nId) async {
    setBusy(true);
    await getFeedbackDetail(nId);
    notifyListeners();
    setBusy(false);
  }

  Status? selectStatus;
  List<Status> statusList = [];

  changeStatusValue(Status val) async {
    selectStatus = val;
    notifyListeners();
  }

  navigateToHistoryScreen() async {
    _navigationService.navigateTo(Routes.staffFeedBackHistoryScreen, arguments: StaffFeedBackHistoryScreenArguments(assignId: feedbackDetailModel!.data!.facultyId.toString(), subject: "", dataList: feedbackDetailModel!.list!));
  }

  Future<void> getFeedbackDetail(String id) async {
    try {
      setBusy(true);
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      feedbackDetailModel = await apiService.getFeedbackDetail({"LoginName": _neededVariables.loginModel!.loginName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "EmployeeId": _neededVariables.loginModel!.employeeId, "PersonId": _neededVariables.loginModel!.personId, "Value": id});
      if (feedbackDetailModel != null) {
        statusList.addAll(feedbackDetailModel!.status!);
      }
      changeStatusValue(statusList[0]);
      setBusy(false);
    } catch (e) {
      setBusy(false);
    }
  }

  Future<void> assignmentSumbit(String id) async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      log(_neededVariables.loginModel!.toMap().toString(), name: "data");
      final result = await apiService.addFeedback({
        "input": {
          "LoginId": _neededVariables.loginModel!.loginId,
          "token": _neededVariables.loginModel!.token,
          "password": _neededVariables.pass,
          "LoginName": _neededVariables.loginModel!.fullName,
          "EmployeeId": _neededVariables.loginModel!.employeeId,
          "PersonId": _neededVariables.loginModel!.personId,
          "Value": id,
        },
        "data": {
          "faculty_id": feedbackDetailModel!.data!.facultyId,
          "feedback_id": feedbackDetailModel!.data!.feedbackId,
          "remarks": remark.text,
          "status_id": selectStatus!.value,
          "student_id": feedbackDetailModel!.data!.studentId,
          "base64": file != null ? base64Encode(file!.readAsBytesSync()) : null,
          "file_name": file != null ? baseName : null,
        },
      });

      showCustomSnackbar(msg: "Add FeedBack Successfully", type: SnackbarType.success);
      _navigationService.back();
      _navigationService.replaceWithStaffFeedBack();

      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log(e.toString());
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
