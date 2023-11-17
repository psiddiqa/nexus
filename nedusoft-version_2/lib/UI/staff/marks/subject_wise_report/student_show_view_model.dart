import 'dart:developer';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../Utils/custom_snackbar.dart';
import '../../../../core/API/api_service.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../../../core/services/needed_utils.dart';
import '../../../../main.dart';
import '../../../../models/getall_section_model.dart';
import '../../../../models/getall_subject_model.dart';
import '../../../../models/staff/exam_mater_model.dart';
import '../../../../models/staff/student_Show_performance_model.dart';

class StudentShowViewModel extends BaseViewModel {
  final NavigationService navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();
  GetAllSectionModal? getAllSectionModal;
  GetExamMasterModel? examMasterModel;
  StudentShowMarkListModel? reportModel;
  Year? selectYearValue;
  Class? selectClassValue;
  SectionList? selectSectionValue;
  List<SectionList> sectionList = [SectionList(text: "--Select--")];
  SubjectList? selectExamMasterValue;
  List<SubjectList> examMasterList = [SubjectList(text: "--Select--")];

  // SubjectList?

  List<Year> yearList = [Year(yearName: "--Select--")];
  List<Class> classList = [Class(text: "--Select--")];

  changeYear(Year val) {
    selectYearValue = val;
    notifyListeners();
  }

  changeClass(Class val) async {
    selectClassValue = val;
    if (val.text != "All" && selectYearValue != "-- SELECT --") {
      await getAllSectionResult(val.value.toString(), selectYearValue!.yearId.toString());
      // await getAllSubjectResult(val.value.toString(), selectYearValue!.yearId.toString());
    }
    notifyListeners();
  }

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

  String section = "";
  String assesment = "";

  init(String yearId, String assesmentId, String sectionId, String classId) async {
    await getReport(yearId, assesmentId, sectionId, classId);
    section = sectionId;
    assesment = assesmentId;
    if (reportModel != null) {
      yearList.addAll(reportModel!.year!.yearList!);
      classList.addAll(reportModel!.classes!);
    }
    for (var obj in yearList) {
      if (obj.yearId.toString() == yearId) {
        changeYear(obj);
      }
    }
    for (var obj in classList) {
      if (obj.value.toString() == classId) {
        log(obj.value.toString());
        log(classId);
        changeClass(obj);
      }
    }
    notifyListeners();
  }

  Future<void> getReport(String yearId, String assesmentId, String sectionId, String classId) async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      reportModel = await apiService.getStudentPerformanceDataModel({
        "LoginName": _neededVariables.loginModel!.fullName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "cmpid": _neededVariables.loginModel!.cmpid, "brcode": _neededVariables.loginModel!.brcode, "Authentication": _neededVariables.loginModel!.authentication,
        // "YearId": yearId, "Assesment": assesmentId, "SectionId": sectionId, "ClassId": classId
        "YearId": yearId,
        "ClassId": classId,
        "Assesment": assesmentId,
        "SectionId": sectionId
      });
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
    }
  }

  navigateToSearchScreen() async {
    if (selectYearValue!.yearName != "-- SELECT --" && selectSectionValue!.text != "-- SELECT --" && selectExamMasterValue!.text != "-- SELECT --" && selectClassValue!.text != "-- SELECT --") {
      log("message");
      await getReport(selectYearValue!.yearId.toString(), selectExamMasterValue!.value.toString(), selectSectionValue!.value.toString(), selectClassValue!.value.toString());
    } else {
      showCustomSnackbar(msg: "Please Select Required fields", type: SnackbarType.failure);
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
      sectionList.add(SectionList(text: "--Select--"));
      sectionList.addAll(getAllSectionModal!.sectionList!);
      for (var obj in sectionList) {
        if (section == obj.value.toString()) {
          changeSectionValue(obj);
        }
      }
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
      examMasterList.add(SubjectList(text: "--Select--"));
      examMasterList.addAll(examMasterModel!.list!);
      for (var obj in examMasterList) {
        if (assesment == obj.value.toString()) {
          changeExamMasterValue(obj);
        }
      }
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log(e.toString());
    }
  }
}
