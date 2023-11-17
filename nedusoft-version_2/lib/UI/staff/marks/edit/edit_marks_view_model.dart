import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nedusoft/UI/staff/marks/add_marks.dart';
import 'package:nedusoft/models/get_combine_sec_model.dart';
import 'package:nedusoft/models/getall_section_model.dart';
import 'package:nedusoft/models/getall_subject_model.dart';
import 'package:nedusoft/models/staff/all_marks_students_model.dart';
import 'package:nedusoft/models/staff/exam_mater_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../Utils/custom_snackbar.dart';
import '../../../../app/app.router.dart';
import '../../../../core/API/api_service.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../../../core/services/needed_utils.dart';
import '../../../../main.dart';
import '../../../../models/getattendance_model.dart';
import '../../../../models/staff/marks_onpage_model.dart';

class StaffEditMarksViewModel extends BaseViewModel {
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

  SubjectList? selectExamMasterValue;
  List<SubjectList> examMasterList = [SubjectList(text: "-- SELECT --")];

  SubjectList? selectExamTypeValue;
  List<SubjectList> examTypeList = [SubjectList(text: "-- SELECT --")];

  TextEditingController dateField = TextEditingController();
  String radioButtonItem = 'ONE';

  // Group Value for Radio Button.
  String id = "name";
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
    if (selectYearValue!.yearName != "-- SELECT --" && selectSectionValue!.text != "-- SELECT --" && selectSubjectValue!.text != "-- SELECT --" && selectExamTypeValue!.text != "-- SELECT --" && selectExamMasterValue!.text != "-- SELECT --") {
      await getAllMarksStudent();

      if (allUpdateStudentMarksList!.output!.statusFlag == 0) {
        showCustomSnackbar(msg: allUpdateStudentMarksList!.output!.statusMessage, type: SnackbarType.failure);
      } else {
        _navigationService.navigateTo(Routes.staffUpdateMarkScreen,
            arguments: StaffUpdateMarkScreenArguments(
              addMarksModel: addMarksList,
              dataModel: allUpdateStudentMarksList,
              section: selectSectionValue!.value,
              subject: selectSubjectValue!.value,
              classId: selectClassValue!.value,
              exam: selectExamTypeValue!.value,
              assesment: selectExamMasterValue!.value,
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

  changeSectionValue(SectionList val) async {
    selectSectionValue = val;
    if (val.text != "-- SELECT --") {
      await getExamMasterResult();
    }
    notifyListeners();
  }

  changeSubjectValue(SubjectList val) {
    selectSubjectValue = val;
    notifyListeners();
  }

  changeExamMasterValue(SubjectList val) async {
    selectExamMasterValue = val;
    if (val.text != "-- SELECT --") {
      await getExamTypeResult();
    }
    notifyListeners();
  }

  changeExamTypeValue(SubjectList val) {
    selectExamTypeValue = val;
    notifyListeners();
  }

  fromPickDate(BuildContext context) async {
    final date = await showDatePicker(context: context, initialDate: DateTime.now().add(const Duration(days: 1)), firstDate: DateTime.now().subtract(const Duration(days: 30)), lastDate: DateTime.now().add(const Duration(days: 365)));
    dateField.text = date == null ? "" : DateFormat("dd-MM-yyyy").format(date);
  }

  MarksOnPageModel? marksOnPageModel;
  GetAllSectionModal? getAllSectionModal;
  GetAllSubjectModal? getAllSubjectModal;
  GetAllCombineClassModel? getAllCombineClassModel;
  GetAllClassesModel? getAllClassModel;
  GetAllCombineSubjectModel? getAllCombineSubjectModel;
  GetAllCombineSectionModel? getAllCombineSectionModel;
  AllUpdateStudentMarksList? allUpdateStudentMarksList;
  List<AddMarksModel>? addMarksList;
  GetExamMasterModel? examMasterModel;
  GetExamMasterModel? examtypeModel;

  init() async {
    setBusy(true);
    await getMarksOnPage();
    if (marksOnPageModel != null) {
      if (marksOnPageModel!.cls!.isNotEmpty) {
        classList.addAll(marksOnPageModel!.cls!);
        yearList.addAll(marksOnPageModel!.year!.yearList!);
      }
    }
    dateField.text = DateFormat("dd-MM-yyyy").format(DateTime.now());
    notifyListeners();
    setBusy(false);
  }

  Future<void> getMarksOnPage() async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      log(_neededVariables.loginModel!.toMap().toString(), name: "data");
      marksOnPageModel = await apiService.editMarksOnPageDropdown({"LoginName": _neededVariables.loginModel!.fullName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "cmpid": _neededVariables.loginModel!.cmpid, "brcode": _neededVariables.loginModel!.brcode, "Authentication": _neededVariables.loginModel!.authentication, "PersonId": _neededVariables.loginModel!.personId, "CourseID": _neededVariables.loginModel!.courseId});
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

  Future<void> getAllCombineSubResult(String classId) async {
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
        "classId": classId
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
      examMasterList.add(SubjectList(text: "-- SELECT --"));
      examMasterList.addAll(examMasterModel!.list!);
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log(e.toString());
    }
  }

  Future<void> getExamTypeResult() async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      log(_neededVariables.loginModel!.toMap().toString(), name: "data");
      examtypeModel = await apiService.examTypeResult({"LoginName": _neededVariables.loginModel!.fullName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "cmpid": _neededVariables.loginModel!.cmpid, "brcode": _neededVariables.loginModel!.brcode, "CourseID": _neededVariables.loginModel!.courseId, "Authentication": _neededVariables.loginModel!.authentication, "Value": selectExamMasterValue!.value});

      examTypeList.clear();
      selectExamTypeValue = null;
      examTypeList.add(SubjectList(text: "-- SELECT --"));
      examTypeList.addAll(examtypeModel!.list!);
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

  Future<void> getAllMarksStudent() async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      log(_neededVariables.loginModel!.toMap().toString(), name: "data");
      allUpdateStudentMarksList = await apiService.getAllUpdateMarkStudentsList({
        "input": {"LoginName": _neededVariables.loginModel!.fullName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "cmpid": _neededVariables.loginModel!.cmpid, "brcode": _neededVariables.loginModel!.brcode, "Authentication": _neededVariables.loginModel!.authentication, "YearId": selectYearValue!.yearId},
        "marks": {
          "ExamId": selectExamTypeValue!.value,
          "Assesment": selectExamMasterValue!.value,
          "SubjectId": selectSubjectValue!.value,
          "SectionId": selectSectionValue!.value,
          "ClassId": selectClassValue!.value,
          "orderby": id,
        }
      });
      addMarksList = List<AddMarksModel>.from(allUpdateStudentMarksList!.list!.map((x) => AddMarksModel.fromMap(x)));
      // log(addMarksList![0]..toString());
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log(e.toString());
    }
  }
}
