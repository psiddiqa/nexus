import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:nedusoft/models/get_status_model.dart' as status;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../Utils/custom_snackbar.dart';
import '../../../app/app.router.dart';
import '../../../core/API/api_service.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../../core/services/needed_utils.dart';
import '../../../main.dart';
import '../../../models/get_combine_sec_model.dart';
import '../../../models/get_status_model.dart';
import '../../../models/getall_section_model.dart';
import '../../../models/getall_subject_model.dart';
import '../../../models/staff/get_specific_assignment.dart';

class StaffEditAssignmentViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();

  Chapter? selectClassValue;
  List<Chapter> classList = [Chapter(text: "-- SELECT --")];

  // Cl? selectSessionValue;
  // List<Cl> sessionList = [Cl(text: "-- SELECT --")];

  SectionList? selectSectionValue;
  List<SectionList> sectionList = [SectionList(text: "-- SELECT --")];

  SubjectList? selectSubjectValue;
  List<SubjectList> subjectList = [SubjectList(text: "-- SELECT --")];

  ListElement? selectChapterValue;
  List<ListElement> chapterList = [ListElement(text: "-- SELECT --")];

  TextEditingController topic = TextEditingController();
  TextEditingController dateField = TextEditingController();
  TextEditingController submitDate = TextEditingController();
  TextEditingController notes = TextEditingController();
  DateTime dataFieldDate = DateTime.now();
  DateTime submitDataField = DateTime.now();
  bool isCombined = false;

  navigateToBack() {
    _navigationService.back();
  }

  navigateToSearchScreen() async {
    if (selectSectionValue!.text != "-- SELECT --" && selectSubjectValue!.text != "-- SELECT --" && selectChapterValue!.text != "-- SELECT --") {
      await assignmentUpdate();
    }
  }

  changeClassValue(Chapter val) async {
    selectClassValue = val;
    notifyListeners();
    if (val.text != "-- SELECT --") {
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
    if (val.text != "-- SELECT --" && selectClassValue!.text != "-- SELECT --") {
      await getAllChapters(selectClassValue!.value.toString(), val.value.toString());
    }
  }

  changeChapterValue(ListElement val) async {
    selectChapterValue = val;
    notifyListeners();
  }

  fromPickDate(BuildContext context) async {
    final date = await showDatePicker(context: context, initialDate: DateTime.now().add(const Duration(days: 1)), firstDate: DateTime.now().subtract(const Duration(days: 30)), lastDate: DateTime.now().add(const Duration(days: 365)));
    dateField.text = date == null ? "" : DateFormat("dd-MM-yyyy").format(date);
    dataFieldDate = date ?? DateTime.now();
  }

  submitPickDate(BuildContext context) async {
    final date = await showDatePicker(context: context, initialDate: DateTime.now().add(const Duration(days: 1)), firstDate: DateTime.now(), lastDate: DateTime.now().add(const Duration(days: 365)));
    submitDate.text = date == null ? "" : DateFormat("dd-MM-yyyy").format(date);
    submitDataField = date ?? DateTime.now();
  }

  GetSpecificAssignmentModel? getSpecificAssignmentModel;
  GetAllSectionModal? getAllSectionModal;
  GetAllSubjectModal? getAllSubjectModal;
  GetAllStatusModel? getAllStatusModel;
  GetAllCombineSubjectModel? getAllCombineSubjectModel;
  GetAllCombineSectionModel? getAllCombineSectionModel;
  String? assignId;

  init(String id) async {
    setBusy(true);
    assignId = id;
    await getAssignmentResult(id);
    if (getSpecificAssignmentModel != null) {
      for (var val = 0; val < classList.length; val++) {
        if (classList[val].value == getSpecificAssignmentModel!.data!.classId) {
          selectClassValue = classList[val];
        }
      }
      for (var val = 0; val < sectionList.length; val++) {
        if (sectionList[val].value == getSpecificAssignmentModel!.data!.sectionId) {
          selectSectionValue = sectionList[val];
        }
      }
      for (var val = 0; val < subjectList.length; val++) {
        if (subjectList[val].value == getSpecificAssignmentModel!.data!.subjectId) {
          selectSubjectValue = subjectList[val];
        }
      }
      for (var val = 0; val < chapterList.length; val++) {
        if (chapterList[val].value == getSpecificAssignmentModel!.data!.chapterId) {
          selectChapterValue = chapterList[val];
        }
      }
    }
    notifyListeners();
    setBusy(false);
  }

  Future<void> getAssignmentResult(String val) async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      final result = await apiService.getSpecificAssignmentDetail({
        "LoginName": _neededVariables.loginModel!.fullName,
        "LoginId": _neededVariables.loginModel!.loginId,
        "token": _neededVariables.loginModel!.token,
        "password": _neededVariables.pass,
        "Authentication": _neededVariables.loginModel!.authentication,
        "Value": val,
        "cmpid": _neededVariables.loginModel!.cmpid,
        "brcode": _neededVariables.loginModel!.brcode,
      });
      getSpecificAssignmentModel = result;
      if (getSpecificAssignmentModel != null) {
        classList.addAll(getSpecificAssignmentModel!.classList!);
        sectionList.addAll(getSpecificAssignmentModel!.sections!);
        subjectList.addAll(getSpecificAssignmentModel!.subjects!);
        chapterList.addAll(getSpecificAssignmentModel!.chapters!);
        isCombined = getSpecificAssignmentModel!.data!.isCombined ?? false;
        topic.text = getSpecificAssignmentModel?.data!.assignTopic ?? "";
        notes.text = getSpecificAssignmentModel?.data!.assignNote ?? "";
        dateField.text = getSpecificAssignmentModel?.data!.assignDate ?? "";
        submitDate.text = getSpecificAssignmentModel?.data!.submiDate ?? "";
        submitDataField = DateFormat('dd/MM/yyyy').parse(submitDate.text);
        dataFieldDate = DateFormat('dd/MM/yyyy').parse(dateField.text);
      }
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

  Future<void> assignmentUpdate() async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      final result = await apiService.updateStaffAssignment({
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
          "assign_id": assignId,
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

      if (result.statusFlag == 0) {
        showCustomSnackbar(msg: result.statusMessage, type: result.statusFlag == 0 ? SnackbarType.failure : SnackbarType.success);
      }
      _navigationService.back();
      _navigationService.replaceWithStaffAssignmentScreen();

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
}
