import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nedusoft/models/attendance_model.dart';
import 'package:nedusoft/models/get_combine_sec_model.dart';
import 'package:nedusoft/models/getall_attendance_model.dart';
import 'package:nedusoft/models/getall_section_model.dart';
import 'package:nedusoft/models/getall_subject_model.dart';
import 'package:path/path.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../Utils/custom_snackbar.dart';
import '../../../app/app.router.dart';
import '../../../core/API/api_service.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../../core/services/needed_utils.dart';
import '../../../main.dart';
import 'package:nedusoft/models/get_status_model.dart' as status;
import '../../../models/get_status_model.dart';
import '../../../models/getattendance_model.dart';
import '../../../models/staff/assignment_onpage_model.dart';
import '../../../models/staff/lesson_onpage_model.dart';

class StaffAssignmentViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();

  String dropdownvalue1 = "2020";
  var year = ["2020", "2021", "2022", "2023", "2024", "2025", "2026", "2027", "2028", "2029", "2030"];

  Year? selectYearValue;
  List<Year> yearList = [Year(yearName: "-- SELECT --")];

  Cl? selectClassValue;
  List<Cl> classList = [Cl(text: "-- SELECT --")];

  // Cl? selectSessionValue;
  // List<Cl> sessionList = [Cl(text: "-- SELECT --")];

  SectionList? selectSectionValue;
  List<SectionList> sectionList = [SectionList(text: "-- SELECT --")];

  SubjectList? selectSubjectValue;
  List<SubjectList> subjectList = [SubjectList(text: "-- SELECT --")];

  status.ListElement? selectChapterValue;
  List<status.ListElement> chapterList = [status.ListElement(text: "-- SELECT --")];

  TextEditingController topic = TextEditingController();
  TextEditingController dateField = TextEditingController();
  TextEditingController submitDate = TextEditingController();
  TextEditingController notes = TextEditingController();

  DateTime dataFieldDate = DateTime.now();
  DateTime submitDataField = DateTime.now();

  String radioButtonItem = 'ONE';
  // Group Value for Radio Button.
  // String id = "name";
  bool isCombined = false;

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
    if (selectSectionValue!.text != "-- SELECT --" && selectSubjectValue!.text != "-- SELECT --" && selectChapterValue!.text != "-- SELECT --") {
      await assignmentUpdate();
    }
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
        await getAllSectionResult(val.value.toString());
        await getAllSubjectResult(val.value.toString());
      }
    }
  }

  changeSectionValue(SectionList val) {
    selectSectionValue = val;
    notifyListeners();
  }

  changeSubjectValue(SubjectList val) async {
    selectSubjectValue = val;
    notifyListeners();
    log("message");
    // ignore: unrelated_type_equality_checks
    if (val.text != "-- SELECT --" && selectClassValue!.text != "-- SELECT --") {
      await getAllChapters(selectClassValue!.value.toString(), val.value.toString());
    }
  }

  changeChapterValue(status.ListElement val) {
    selectChapterValue = val;
    notifyListeners();
  }

  fromPickDate(BuildContext context) async {
    final date = await showDatePicker(context: context, initialDate: DateTime.now().add(const Duration(days: 1)), firstDate: DateTime.now().subtract(const Duration(days: 30)), lastDate: DateTime.now().add(const Duration(days: 365)));
    dateField.text = date == null ? "" : DateFormat("dd-MM-yyyy").format(date);
    dataFieldDate = date ?? DateTime.now();
    notifyListeners();
  }

  submitPickDate(BuildContext context) async {
    final date = await showDatePicker(context: context, initialDate: DateTime.now().add(const Duration(days: 1)), firstDate: DateTime.now(), lastDate: DateTime.now().add(const Duration(days: 365)));
    log(date.toString());
    submitDate.text = date == null ? "" : DateFormat("dd-MM-yyyy").format(date);
    submitDataField = date ?? DateTime.now();
    notifyListeners();
  }

  GetEnterAttendanceDropdownsModel? getEnterAttendanceDropdownsModel;
  GetAllSectionModal? getAllSectionModal;
  GetAllSubjectModal? getAllSubjectModal;
  GetAllStatusModel? getAllStatusModel;
  GetAllCombineSubjectModel? getAllCombineSubjectModel;
  GetAllCombineSectionModel? getAllCombineSectionModel;
  GetAllCombineClassModel? getAllCombineClassModel;
  GetAllClassesModel? getAllClassModel;
  init() async {
    setBusy(true);
    await getDropDownResult();
    if (getEnterAttendanceDropdownsModel != null) {
      if (getEnterAttendanceDropdownsModel!.cls!.isNotEmpty) {
        // selectClassValue = getEnterAttendanceDropdownsModel!.cls![0].text!;
        classList.addAll(getEnterAttendanceDropdownsModel!.cls!);
        // yearList.addAll(getEnterAttendanceDropdownsModel!.year!.yearList!);
      }
    }
    dateField.text = DateFormat("dd-MM-yyyy").format(DateTime.now());

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

  Future<void> getAllSectionResult(
    String classId,
  ) async {
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

  Future<void> getAllSubjectResult(String classId) async {
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
        "YearId": "1",
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

  Future<void> getAllChapters(String classId, String subjectId) async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      log(_neededVariables.loginModel!.toMap().toString(), name: "data");
      final result = await apiService.getAllChapters({
        "LoginName": _neededVariables.loginModel!.fullName,
        "LoginId": _neededVariables.loginModel!.loginId,
        "token": _neededVariables.loginModel!.token,
        "password": _neededVariables.pass,
        "cmpid": _neededVariables.loginModel!.cmpid,
        "brcode": _neededVariables.loginModel!.brcode,
        "SubjectId": subjectId,
        "ClassId": classId,
        "Authentication": _neededVariables.loginModel!.authentication,
      });
      getAllStatusModel = result;

      chapterList.clear();
      selectChapterValue = null;
      chapterList.add(status.ListElement(text: "-- SELECT --"));
      chapterList.addAll(getAllStatusModel!.list!);
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log(e.toString());
    }
  }

  Future<void> assignmentUpdate() async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      log(_neededVariables.loginModel!.toMap().toString(), name: "data");

      final result = await apiService.addStaffAssignment({
        "input": {
          "LoginId": _neededVariables.loginModel!.loginId,
          "token": _neededVariables.loginModel!.token,
          "password": _neededVariables.pass,
          "Authentication": _neededVariables.loginModel!.authentication,
          "cmpid": _neededVariables.loginModel!.cmpid,
          "brcode": _neededVariables.loginModel!.brcode,
          "PersonId": _neededVariables.loginModel!.personId,
        },
        "data": {
          "date": DateFormat('yyyy-MM-dd').format(dataFieldDate),
          "chapter_id": selectChapterValue!.value,
          "subject_id": selectSubjectValue!.value,
          "section_id": selectSectionValue!.value,
          "class_id": selectClassValue!.value,
          "remarks": "",
          "assign_topic": topic.text,
          "assign_note": notes.text,
          "follow_up_date": DateFormat('yyyy-MM-dd').format(submitDataField),
          "base64": file != null ? base64Encode(file!.readAsBytesSync()) : null,
          "file_name": file != null ? baseName : null,
        },
      });

      showCustomSnackbar(msg: "Add Assignment Successfully", type: SnackbarType.success);
      _navigationService.back();
      _navigationService.replaceWithStaffAssignmentScreen();

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
      final result = await apiService.getAllCombineSubject({"LoginName": _neededVariables.loginModel!.fullName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "cmpid": _neededVariables.loginModel!.cmpid, "brcode": _neededVariables.loginModel!.brcode, "CourseID": _neededVariables.loginModel!.courseId, "Authentication": _neededVariables.loginModel!.authentication, "classId": id});
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
}
