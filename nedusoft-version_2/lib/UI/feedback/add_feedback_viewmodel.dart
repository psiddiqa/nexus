import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:nedusoft/app/app.router.dart';
import 'package:path/path.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../core/API/api_service.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../../core/services/needed_utils.dart';
import '../../Utils/custom_snackbar.dart';
import '../../main.dart';
import '../../models/student/student_staff_model.dart';

class StudentAddFeedbackViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();

  ListElement? selectStaff;
  List<ListElement> staffList = [ListElement(text: "-- SELECT --")];

  TextEditingController feedback = TextEditingController();

  navigateToBack() {
    _navigationService.back();
  }

  navigateToAddScreen() async {
    if (selectStaff!.text != "-- SELECT --") {
      await addFeedback();
    }
  }

  StudentStaffModel? studentStaffModel;

  changeChapterValue(ListElement val) {
    selectStaff = val;
    notifyListeners();
  }

  init() async {
    setBusy(true);
    await getStaff();
    notifyListeners();
    setBusy(false);
  }

  Future<void> getStaff() async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      log(_neededVariables.loginModel!.toMap().toString(), name: "data");
      studentStaffModel = await apiService.studentStaff({
        "LoginName": _neededVariables.loginModel!.fullName,
        "LoginId": _neededVariables.loginModel!.loginId,
        "token": _neededVariables.loginModel!.token,
        "password": _neededVariables.pass,
        "cmpid": _neededVariables.loginModel!.cmpid,
        "brcode": _neededVariables.loginModel!.brcode,
      });
      if (studentStaffModel!.statusFlag == 1) {
        staffList.addAll(studentStaffModel!.list!);
      }
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log(e.toString());
    }
  }

  Future<void> addFeedback() async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      log(_neededVariables.loginModel!.toMap().toString(), name: "data");
      final result = await apiService.addStudentFeedback({
        "input": {
          "LoginName": _neededVariables.loginModel!.fullName,
          "LoginId": _neededVariables.loginModel!.loginId,
          "token": _neededVariables.loginModel!.token,
          "password": _neededVariables.pass,
          "cmpid": _neededVariables.loginModel!.cmpid,
          "brcode": _neededVariables.loginModel!.brcode,
        },
        "data": {
          "faculty_id": selectStaff?.value ?? "",
          "feedback": feedback.text,
          "base64": file != null ? base64Encode(file!.readAsBytesSync()) : null,
          "file_name": file != null ? baseName : null,
        },
      });
      showCustomSnackbar(msg: "Add Feedback", type: SnackbarType.success);
      _navigationService.back();
      _navigationService.replaceWithStudentFeedBack();
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
}
