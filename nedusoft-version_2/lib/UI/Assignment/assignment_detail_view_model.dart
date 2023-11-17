import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';
import 'dart:io';
import 'package:path/path.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../Utils/custom_snackbar.dart';
import '../../../../app/app.router.dart';
import '../../../../core/API/api_service.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../../../core/services/needed_utils.dart';
import '../../../../main.dart';
import '../../../../models/staff/submit_ass_detail_model.dart';
import '../../models/student/student_assignment_detail_model.dart';

class AssigmentdetailViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();

  TextEditingController date = TextEditingController();
  TextEditingController remark = TextEditingController();

  // ClassList? selectStatus;
  // List<ClassList> statusList = [];

  navigateToBack() {
    _navigationService.back();
  }

  navigateToHistoryScreen() async {
    _navigationService.navigateTo(Routes.assignmentHistoryScreen, arguments: AssignmentHistoryScreenArguments(assignId: getSubmittedAssignmentDetailsModel!.data!.assignId!.toString(), subject: getSubmittedAssignmentDetailsModel!.data!.subject!, dataList: getSubmittedAssignmentDetailsModel!.list1!));
  }

  // changeStatusValue(ClassList val) async {
  //   selectStatus = val;
  //   notifyListeners();
  // }

  GetStudentAssignmentDetailsModel? getSubmittedAssignmentDetailsModel;
  String? assignId;

  init(String id) async {
    setBusy(true);
    assignId = id;
    await getAssignmentResult(id);

    notifyListeners();
    setBusy(false);
  }

  Future<void> getAssignmentResult(String val) async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      final result = await apiService.getAssignmentDetail({"LoginName": _neededVariables.loginModel!.fullName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "cmpid": _neededVariables.loginModel!.cmpid, "brcode": _neededVariables.loginModel!.brcode, "Value": val});
      getSubmittedAssignmentDetailsModel = result;
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log(e.toString());
    }
  }

  Future<void> assignmentSumbit() async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      log(_neededVariables.loginModel!.toMap().toString(), name: "data");
      final result = await apiService.submitStudentAssignment({
        "input": {
          "LoginId": _neededVariables.loginModel!.loginId,
          "token": _neededVariables.loginModel!.token,
          "password": _neededVariables.pass,
          "LoginName": _neededVariables.loginModel!.fullName,
          "cmpid": _neededVariables.loginModel!.cmpid,
          "brcode": _neededVariables.loginModel!.brcode,
        },
        "data": {
          "assign_id": assignId!,
          "remarks": remark.text,
          "follow_up_date": date.text,
          "base64": file != null ? base64Encode(file!.readAsBytesSync()) : null,
          "file_name": file != null ? baseName : null,
        },
      });

      showCustomSnackbar(msg: "Add Assignment Successfully", type: SnackbarType.success);

      _navigationService.back();
      _navigationService.replaceWithStudentAssignmentScreen();

      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log(e.toString());
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
}
