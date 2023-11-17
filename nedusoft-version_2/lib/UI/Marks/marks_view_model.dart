import 'dart:developer';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../core/API/api_service.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../../core/services/needed_utils.dart';
import '../../Utils/custom_snackbar.dart';
import '../../app/app.router.dart';
import '../../main.dart';
import '../../models/student/get_mark_dropdown_model.dart';

class StudentMarksViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();

  ListElement? selectSectionValue;
  List<ListElement> sectionList = [ListElement(text: "-- SELECT --")];

  ExamList? selectExamMasterValue;
  List<ExamList> examMasterList = [ExamList(text: "-- SELECT --")];

  navigateToBack() {
    _navigationService.back();
  }

  search() async {
    if (selectSectionValue!.text != "-- SELECT --" && selectExamMasterValue!.text != "-- SELECT --") {
      await getAllMarksList();

      // _navigationService.navigateTo(Routes.studentMarkDetail, arguments: StudentMarkDetailArguments(getStudentMarksList: getStudentMarksList!, examName: selectExamMasterValue!.text!));
    } else {
      showCustomSnackbar(msg: "Please Select Required fields", type: SnackbarType.failure);
    }
  }

  changeSectionValue(ListElement val) async {
    selectSectionValue = val;
    if (val.text != "-- SELECT --") {
      await getExamList();
    }
    notifyListeners();
  }

  changeExamMasterValue(ExamList val) async {
    selectExamMasterValue = val;
    notifyListeners();
  }

  GetMarksDropDownModel? marksOnPageModel;
  GetStudentExamList? examMasterModel;
  GetStudentMarksList? getStudentMarksList;

  init() async {
    setBusy(true);
    await getMarksOnPage();
    if (marksOnPageModel != null) {
      if (marksOnPageModel!.list!.isNotEmpty) {
        sectionList.addAll(marksOnPageModel!.list!);
      }
    }

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
      marksOnPageModel = await apiService.markDropDownList({"LoginName": _neededVariables.loginModel!.fullName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "cmpid": _neededVariables.loginModel!.cmpid, "brcode": _neededVariables.loginModel!.brcode, "Authentication": _neededVariables.loginModel!.authentication, "PersonId": _neededVariables.loginModel!.loginId, "CourseID": _neededVariables.loginModel!.courseId, "YearId": _neededVariables.loginModel!.yearId});
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log(e.toString());
    }
  }

  Future<void> getExamList() async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      log(_neededVariables.loginModel!.toMap().toString(), name: "data");
      examMasterModel = await apiService.getStudentsExamList({"LoginName": _neededVariables.loginModel!.fullName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "cmpid": _neededVariables.loginModel!.cmpid, "brcode": _neededVariables.loginModel!.brcode, "Authentication": _neededVariables.loginModel!.authentication, "PersonId": _neededVariables.loginModel!.loginId, "CourseID": _neededVariables.loginModel!.courseId, "YearId": _neededVariables.loginModel!.yearId, "SectionId": selectSectionValue!.value});

      examMasterList.clear();
      selectExamMasterValue = null;
      examMasterList.add(ExamList(text: "-- SELECT --"));
      examMasterList.addAll(examMasterModel!.examList!);
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log(e.toString());
    }
  }

  Future<void> getAllMarksList() async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      log(_neededVariables.loginModel!.toMap().toString(), name: "data");
      getStudentMarksList = await apiService.getStudentMarkList({"LoginName": _neededVariables.loginModel!.fullName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "cmpid": _neededVariables.loginModel!.cmpid, "brcode": _neededVariables.loginModel!.brcode, "Authentication": _neededVariables.loginModel!.authentication, "PersonId": _neededVariables.loginModel!.loginId, "CourseID": _neededVariables.loginModel!.courseId, "YearId": _neededVariables.loginModel!.yearId, "Value": selectExamMasterValue!.value});
      log(getStudentMarksList!.marksList!.length.toString());
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log(e.toString());
    }
  }


  // GetStudentMarksList? getStudentList;

  // init(GetStudentMarksList? getStudent) async {
  //   setBusy(true);
  //   getStudentList = getStudent;
  //   notifyListeners();
  //   setBusy(false);
  // }

  String order = "";
  bool sub = false;
  bool fac = false;
  bool mark = false;
  bool per = false;

  changeSubjectOrder(
    String val,
  ) {
    order = val;
    if (val == "Subject") {
      sub = !sub;
      if (sub) {
        allDescending(val);
      } else {
        allAscending(val);
      }
    } else if (val == "Faculty") {
      fac = !fac;
      if (fac) {
        log("message2");
        allDescending(val);
      } else {
        log("message");
        allAscending(val);
      }
    } else if (val == "MarksO") {
      mark = !mark;
      if (mark) {
        allDescending(val);
      } else {
        allAscending(val);
      }
    } else {
      per = !per;
      if (per) {
        allDescending(val);
      } else {
        allAscending(val);
      }
    }
    notifyListeners();
  }

  allAscending(String val) {
    setBusy(true);
    if (val == "Subject") {
      final val = getStudentMarksList!.marksList!.toList();
      List<MarksList> listMappedEntries = val;
      listMappedEntries.sort((a, b) => a.subName!.compareTo(b.subName!));
      getStudentMarksList!.marksList = listMappedEntries;
    } else if (val == "Faculty") {
      final val = getStudentMarksList!.marksList!.toList();
      List<MarksList> listMappedEntries = val;
      listMappedEntries.sort((a, b) => a.facultyName!.compareTo(b.facultyName!));
      getStudentMarksList!.marksList = listMappedEntries;
    } else if (val == "MarksO") {
      final val = getStudentMarksList!.marksList!.toList();
      List<MarksList> listMappedEntries = val;
      listMappedEntries.sort((a, b) => a.marksObtained!.compareTo(b.marksObtained!));
      getStudentMarksList!.marksList = listMappedEntries;
    } else {
      final val = getStudentMarksList!.marksList!.toList();
      List<MarksList> listMappedEntries = val;
      listMappedEntries.sort((a, b) => a.percentage!.compareTo(b.percentage!));
      getStudentMarksList!.marksList = listMappedEntries;
    }
    setBusy(false);
  }

  allDescending(String val) {
    setBusy(true);
    if (val == "Subject") {
      final val = getStudentMarksList!.marksList!.toList();
      List<MarksList> listMappedEntries = val;
      listMappedEntries.sort((a, b) => b.subName!.compareTo(a.subName!));
      getStudentMarksList!.marksList = listMappedEntries;
    } else if (val == "Faculty") {
      log("1223");
      final val = getStudentMarksList!.marksList!.toList();
      List<MarksList> listMappedEntries = val;
      listMappedEntries.sort((a, b) => b.facultyName!.compareTo(a.facultyName!));
      getStudentMarksList!.marksList = listMappedEntries;
      log(getStudentMarksList!.marksList![0].facultyName!);
    } else if (val == "MarksO") {
      final val = getStudentMarksList!.marksList!.toList();
      List<MarksList> listMappedEntries = val;
      listMappedEntries.sort((a, b) => b.marksObtained!.compareTo(a.marksObtained!));
      getStudentMarksList!.marksList = listMappedEntries;
    } else {
      final val = getStudentMarksList!.marksList!.toList();
      List<MarksList> listMappedEntries = val;
      listMappedEntries.sort((a, b) => b.percentage!.compareTo(a.percentage!));
      getStudentMarksList!.marksList = listMappedEntries;
    }
    setBusy(false);
  }
}
