import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nedusoft/models/attendance_model.dart';
import 'package:nedusoft/models/get_combine_sec_model.dart';
import 'package:nedusoft/models/getall_attendance_model.dart';
import 'package:nedusoft/models/getall_section_model.dart';
import 'package:nedusoft/models/getall_subject_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../Utils/custom_snackbar.dart';
import '../../../../app/app.router.dart';
import '../../../../core/API/api_service.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../../../core/services/needed_utils.dart';
import '../../../../main.dart';
import '../../../../models/getattendance_model.dart';
import '../../../../models/staff/faculty_allocation_model.dart';

class StaffFacultyDeAllocationViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();

  Year? selectYearValue;
  List<Year> yearList = [Year(yearName: "-- SELECT --")];

  Cl? selectClassValue;
  List<Cl> classList = [Cl(text: "-- SELECT --")];

  SectionList? selectSectionValue;
  List<SectionList> sectionList = [SectionList(text: "-- SELECT --")];

  SubjectList? selectSubjectValue;
  List<SubjectList> subjectList = [SubjectList(text: "-- SELECT --")];

  String radioButtonItem = 'ONE';

  // Group Value for Radio Button.
  String id = "name";
  bool isCombined = false;

  navigateToEditScreen() {
    _navigationService.navigateTo(Routes.editAttFormScreem);
  }

  navigateToBack() {
    _navigationService.back();
  }

  changeCombined(bool val) async {
    isCombined = val;
    if (val) {
      await getAllCombineClassResult();
    } else {
      await getAllClassResult();
    }
    notifyListeners();
  }

  navigateToSearchScreen() async {
    if (selectYearValue!.yearName != "-- SELECT --" && selectSectionValue!.text != "-- SELECT --" && selectSubjectValue!.text != "-- SELECT --") {
      await getFacultyAllocationList();
      if (facultyAllocationList!.output!.statusFlag == 0) {
        showCustomSnackbar(msg: facultyAllocationList!.output!.statusMessage, type: SnackbarType.failure);
      }
      // else if (facultyAllocationList!.list!.isEmpty) {
      //   showCustomSnackbar(msg: "No Records Found", type: SnackbarType.failure);
      // }
      else {
        _navigationService.navigateTo(Routes.studentDeAllocation,
            arguments: StudentDeAllocationArguments(
              studentList: facultyAllocationStudentList,
              sectionList: selectSectionValue,
              subjectList: selectSubjectValue,
              year: selectYearValue,
              classes: selectClassValue,
            ));
      }
    } else {
      showCustomSnackbar(msg: "Please Select Required fields", type: SnackbarType.failure);
    }
  }

  changeOrderId(String val) {
    id = val;
    notifyListeners();
  }

  changeYearValue(Year val) {
    selectYearValue = val;
    notifyListeners();
  }

  changeClassValue(Cl val) async {
    selectClassValue = val;
    notifyListeners();
    log("message");
    // ignore: unrelated_type_equality_checks
    if (val.text != "-- SELECT --" && selectYearValue != "-- SELECT --") {
      if (isCombined) {
        await getAllCombineSecResult(selectClassValue!.value.toString());
        await getAllCombineSubResult(selectClassValue!.value.toString());
      } else {
        await getAllSectionResult(val.value.toString(), selectYearValue!.yearId.toString());
        await getAllSubjectResult(val.value.toString(), selectYearValue!.yearId.toString());
      }
    }
  }

  changeSectionValue(SectionList val) {
    selectSectionValue = val;
    notifyListeners();
  }

  changeSubjectValue(SubjectList val) {
    selectSubjectValue = val;
    notifyListeners();
  }

  GetEnterAttendanceDropdownsModel? getEnterAttendanceDropdownsModel;
  GetAllSectionModal? getAllSectionModal;
  GetAllSubjectModal? getAllSubjectModal;
  GetAllCombineSubjectModel? getAllCombineSubjectModel;
  GetAllCombineSectionModel? getAllCombineSectionModel;
  GetAllCombineClassModel? getAllCombineClassModel;
  GetAllClassesModel? getAllClassModel;
  FacultyAllocationList? facultyAllocationList;
  List<FacultyDeAllocationStudentList>? facultyAllocationStudentList;

  init() async {
    setBusy(true);
    await getDropDownResult();
    if (getEnterAttendanceDropdownsModel != null) {
      if (getEnterAttendanceDropdownsModel!.cls!.isNotEmpty) {
        // selectClassValue = getEnterAttendanceDropdownsModel!.cls![0].text!;
        classList.addAll(getEnterAttendanceDropdownsModel!.cls!);
        yearList.addAll(getEnterAttendanceDropdownsModel!.year!.yearList!);
      }
    }
    notifyListeners();
    setBusy(false);
  }

  Future<void> getDropDownResult() async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      log(_neededVariables.loginModel!.toMap().toString(), name: "data");
      final result = await apiService.getEnterAttendanceDropdowns({"LoginName": _neededVariables.loginModel!.fullName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "cmpid": _neededVariables.loginModel!.cmpid, "brcode": _neededVariables.loginModel!.brcode, "Authentication": _neededVariables.loginModel!.authentication, "PersonId": _neededVariables.loginModel!.personId, "CourseID": _neededVariables.loginModel!.courseId});
      getEnterAttendanceDropdownsModel = result;
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log(e.toString());
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
      sectionList.add(SectionList(text: "-- SELECT --"));
      sectionList.addAll(getAllSectionModal!.sectionList!);
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log(e.toString());
    }
  }

  Future<void> getAllSubjectResult(String classId, String year) async {
    setBusy(true);
    try {
      // getAllSubjectModal = null;
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      log(_neededVariables.loginModel!.toMap().toString(), name: "data");
      final result = await apiService.getAllSubject({
        "LoginName": _neededVariables.loginModel!.fullName,
        "LoginId": _neededVariables.loginModel!.loginId,
        "token": _neededVariables.loginModel!.token,
        "password": _neededVariables.pass,
        "cmpid": _neededVariables.loginModel!.cmpid,
        "brcode": _neededVariables.loginModel!.brcode,
        "CourseID": _neededVariables.loginModel!.courseId,
        "ClassId": classId,
        "Authentication": _neededVariables.loginModel!.authentication,
        "YearId": year,
      });
      getAllSubjectModal = result;

      subjectList.clear();
      selectSubjectValue = null;
      subjectList.add(SubjectList(text: "-- SELECT --"));
      subjectList.addAll(getAllSubjectModal!.subjectList!);
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log(e.toString());
    }
  }

  Future<void> getAllCombineSubResult(String id) async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      log(_neededVariables.loginModel!.toMap().toString(), name: "data");
      final result = await apiService.getAllCombineSubject({
        "LoginName": _neededVariables.loginModel!.fullName,
        "LoginId": _neededVariables.loginModel!.loginId,
        "token": _neededVariables.loginModel!.token,
        "password": _neededVariables.pass,
        "cmpid": _neededVariables.loginModel!.cmpid,
        "brcode": _neededVariables.loginModel!.brcode,
        "CourseID": _neededVariables.loginModel!.courseId,
        "Authentication": _neededVariables.loginModel!.authentication,
        "classId": id
      });
      getAllCombineSubjectModel = result;
      if (getAllCombineSubjectModel!.list!.isNotEmpty) {
        subjectList.clear();
        selectSubjectValue = null;
        subjectList.add(SubjectList(text: "-- SELECT --"));
        subjectList.addAll(getAllCombineSubjectModel!.list!);
      }
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log(e.toString());
    }
  }

  Future<void> getAllCombineSecResult(String classId) async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      log(_neededVariables.loginModel!.toMap().toString(), name: "data");
      final result = await apiService.getAllCombineSection({
        "LoginName": _neededVariables.loginModel!.fullName,
        "LoginId": _neededVariables.loginModel!.loginId,
        "token": _neededVariables.loginModel!.token,
        "password": _neededVariables.pass,
        "cmpid": _neededVariables.loginModel!.cmpid,
        "brcode": _neededVariables.loginModel!.brcode,
        "ClassId": classId,
      });
      getAllCombineSectionModel = result;
      if (getAllCombineSectionModel!.list!.isNotEmpty) {
        sectionList.clear();
        selectSectionValue = null;
        sectionList.add(SectionList(text: "-- SELECT --"));
        sectionList.addAll(getAllCombineSectionModel!.list!);
      }
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log(e.toString());
    }
  }

  Future<void> getAllCombineClassResult() async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      log(_neededVariables.loginModel!.toMap().toString(), name: "data");
      getAllCombineClassModel = await apiService.getAllCombineClass({
        "LoginName": _neededVariables.loginModel!.fullName,
        "LoginId": _neededVariables.loginModel!.loginId,
        "token": _neededVariables.loginModel!.token,
        "password": _neededVariables.pass,
        "cmpid": _neededVariables.loginModel!.cmpid,
        "brcode": _neededVariables.loginModel!.brcode,
        "Authentication": _neededVariables.loginModel!.authentication,
        "CourseID": _neededVariables.loginModel!.courseId,
      });
      if (getAllCombineClassModel!.list!.isNotEmpty) {
        classList.clear();
        selectClassValue = null;
        classList.add(Cl(text: "-- SELECT --"));
        classList.addAll(getAllCombineClassModel!.list!);
      }
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log(e.toString());
    }
  }

  Future<void> getAllClassResult() async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      log(_neededVariables.loginModel!.toMap().toString(), name: "data");
      getAllClassModel = await apiService.getAllClass({
        "LoginName": _neededVariables.loginModel!.fullName,
        "LoginId": _neededVariables.loginModel!.loginId,
        "token": _neededVariables.loginModel!.token,
        "password": _neededVariables.pass,
        "cmpid": _neededVariables.loginModel!.cmpid,
        "brcode": _neededVariables.loginModel!.brcode,
        "Authentication": _neededVariables.loginModel!.authentication,
        "CourseID": _neededVariables.loginModel!.courseId,
      });
      if (getAllClassModel!.classList!.isNotEmpty) {
        classList.clear();
        selectClassValue = null;
        classList.add(Cl(text: "-- SELECT --"));
        classList.addAll(getAllClassModel!.classList!);
      }
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log(e.toString());
    }
  }

  Future<void> getFacultyAllocationList() async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      log(_neededVariables.loginModel!.toMap().toString(), name: "data");
      facultyAllocationList = await apiService.getAllocatedStudent({
        "LoginName": _neededVariables.loginModel!.fullName,
        "LoginId": _neededVariables.loginModel!.loginId,
        "cmpid": _neededVariables.loginModel!.cmpid,
        "brcode": _neededVariables.loginModel!.brcode,
        "Password": _neededVariables.pass,
        "token": _neededVariables.loginModel!.token,
        "Authentication": _neededVariables.loginModel!.authentication,
        "PersonId": _neededVariables.loginModel!.personId,
        "SectionId": selectSectionValue!.value,
        "SubjectId": selectSubjectValue!.value,
        "YearId": selectYearValue!.yearId,
        "orderby": id,
        "ClassId": selectClassValue!.value,
      });
      facultyAllocationStudentList = List<FacultyDeAllocationStudentList>.from(facultyAllocationList!.list!.map((x) => FacultyDeAllocationStudentList.fromMap(x)));
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log(e.toString());
    }
  }
}
