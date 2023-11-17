import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../Utils/Colors.dart';
import '../../../../core/API/api_service.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../../../core/services/needed_utils.dart';
import '../../../../models/getall_section_model.dart';
import '../../../../models/getall_subject_model.dart';
import '../../../../models/staff/exam_mater_model.dart';
import '../../../../models/staff/getStudentClassWise_model.dart';

class StudentWiseReportViewmodel extends BaseViewModel {
  final NavigationService navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();
  GetAllSectionModal? getAllSectionModal;
  GetAllSubjectModal? getAllSubjectModal;
  GetExamMasterModel? examMasterModel;
  GetStudentClassWisePerformanceDataModel? getStudentClassWisePerformanceDataModel;
  Year? selectYearValue;
  Class? selectClassValue;
  SectionList? selectSectionValue;
  List<SectionList> sectionList = [SectionList(text: "All")];
  SubjectList? selectExamMasterValue;
  List<SubjectList> examMasterList = [SubjectList(text: "All")];

  // SubjectList? selectSubjectValue;
  // List<SubjectList> subjectList = [SubjectList(text: "-- SELECT --")];
  List<Year> yearList = [Year(yearName: "--Select--")];
  List<Class> classList = [Class(text: "All")];

  changeSectionValue(SectionList val) async {
    selectSectionValue = val;
    if (val.text != "-- SELECT --") {
      await getExamMasterResult();
    }
    notifyListeners();
  }

  changeExamMasterValue(SubjectList val) async {
    selectExamMasterValue = val;
    notifyListeners();
  }
  // changeSubjectValue(SubjectList val) {
  //   selectSubjectValue = val;
  //   notifyListeners();
  // }

  changeYear(Year val) {
    selectYearValue = val;
    notifyListeners();
  }

  changeClass(Class val) async {
    selectClassValue = val;
    notifyListeners();
    if (val.text != "All" && selectYearValue != "-- SELECT --") {
      await getAllSectionResult(val.value.toString(), selectYearValue!.yearId.toString());
      // await getAllSubjectResult(val.value.toString(), selectYearValue!.yearId.toString());
    }
  }

  init(bool search) async {
    await getReport(search);

    notifyListeners();
  }

  Color returnColor(String val) {
    switch (val) {
      case "A":
        return Color(0xFF559353);
      case "A+":
        return Color(0xFF4A7948);
      case "B":
        return Color(0xFFFFC336);
      case "B+":
        return Color(0xFFF9AE0F);
      case "C":
        return Color(0xFFF63B08);
      case "C+":
        return Color(0xFFDB3508);
      case "D":
        return Colors.orange;
    }
    return Color(0xFF559353);
  }

  Future<void> getReport(bool search) async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      getStudentClassWisePerformanceDataModel = await apiService.getStudentClassWisePerformanceDataModel(search
          ? {
              "LoginName": _neededVariables.loginModel!.fullName,
              "LoginId": _neededVariables.loginModel!.loginId,
              "token": _neededVariables.loginModel!.token,
              "password": _neededVariables.pass,
              "cmpid": _neededVariables.loginModel!.cmpid,
              "brcode": _neededVariables.loginModel!.brcode,
              "ClassId": selectClassValue?.value ?? 0,
              "YearId": selectYearValue?.yearId ?? 0,
              "SectionId": selectSectionValue?.value ?? 0,
              "Assesment": selectExamMasterValue?.value ?? 0,
            }
          : {"LoginName": _neededVariables.loginModel!.fullName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "cmpid": _neededVariables.loginModel!.cmpid, "brcode": _neededVariables.loginModel!.brcode});
      if (getStudentClassWisePerformanceDataModel != null) {
        if (getStudentClassWisePerformanceDataModel!.years!.yearList!.isNotEmpty) {
          yearList.addAll(getStudentClassWisePerformanceDataModel!.years!.yearList!);
          changeYear(getStudentClassWisePerformanceDataModel!.years!.yearList![0]);
        }
        if (getStudentClassWisePerformanceDataModel!.classes!.isNotEmpty) {
          classList.addAll(getStudentClassWisePerformanceDataModel!.classes!);
        }
      }
      log(classList.length.toString());
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
    }
  }

  Future<void> getAllSectionResult(String classId, String year) async {
    setBusy(true);
    try {
      // getAllSectionModal = null;
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      log(_neededVariables.loginModel!.toMap().toString(), name: "data");
      final result = await apiService.getAllSection({
        "LoginName": _neededVariables.loginModel!.fullName,
        "LoginId": _neededVariables.loginModel!.loginId,
        "token": _neededVariables.loginModel!.token,
        "password": _neededVariables.pass,
        "cmpid": _neededVariables.loginModel!.cmpid,
        "brcode": _neededVariables.loginModel!.brcode,
        "ClassId": classId,
        "YearId": year,
      });
      getAllSectionModal = result;
      sectionList.clear();
      selectSectionValue = null;
      sectionList.add(SectionList(text: "All"));
      sectionList.addAll(getAllSectionModal!.sectionList!);
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log(e.toString());
    }
  }

  Future<void> getExamMasterResult() async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      log(_neededVariables.loginModel!.toMap().toString(), name: "data");
      examMasterModel = await apiService.examMaster({"LoginName": _neededVariables.loginModel!.fullName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "cmpid": _neededVariables.loginModel!.cmpid, "brcode": _neededVariables.loginModel!.brcode, "CourseID": _neededVariables.loginModel!.courseId, "Authentication": _neededVariables.loginModel!.authentication, "Value": selectSectionValue!.value});

      examMasterList.clear();
      selectExamMasterValue = null;
      examMasterList.add(SubjectList(text: "All"));
      examMasterList.addAll(examMasterModel!.list!);
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log(e.toString());
    }
  }
}
