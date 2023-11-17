import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:nedusoft/app/app.router.dart';
import 'package:nedusoft/models/getall_subject_model.dart';
import 'package:nedusoft/models/staff/get_chapter_details.dart' as chapter;

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../Utils/custom_snackbar.dart';
import '../../../core/API/api_service.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../../core/services/needed_utils.dart';
import '../../../main.dart';
import '../../../models/get_combine_sec_model.dart';
import '../../../models/getattendance_model.dart';

class StaffEditChapterViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();

  chapter.Year? selectYearValue;
  List<chapter.Year> yearList = [chapter.Year(yearName: "-- SELECT --")];

  Cl? selectClassValue;
  List<Cl> classList = [Cl(text: "-- SELECT --")];

  SubjectList? selectSubjectValue;
  List<SubjectList> subjectList = [SubjectList(text: "-- SELECT --")];

  TextEditingController chapterNo = TextEditingController();
  TextEditingController chapterName = TextEditingController();
  bool isCombined = false;

  navigateToBack() {
    _navigationService.back();
  }

  String? chapterId;

  changeCombined(bool val) async {
    isCombined = val;
    if (val) {
      await getAllCombineClassResult();
    } else {
      // await getChapterDetails(chapterId!);
    }
    notifyListeners();
  }

  navigateToSearchScreen() async {
    if (selectYearValue!.yearName != "-- SELECT --" && selectSubjectValue!.text != "-- SELECT --" && selectClassValue!.text != "-- SELECT --" && chapterName.text != "" && chapterNo.text != "") {
      await saveUpdate();
    } else {
      showCustomSnackbar(msg: "Please Select Required fields", type: SnackbarType.failure);
    }
  }

  changeYearValue(chapter.Year val) {
    selectYearValue = val;
    notifyListeners();
  }

  changeClassValue(Cl val) async {
    selectClassValue = val;
    notifyListeners();
    if (val.text != "-- SELECT --") {
      if (isCombined) {
        await getAllCombineSubResult(selectClassValue!.value.toString());
      } else {
        await getAllSubjectResult(
          val.value.toString(),
        );
      }
    }
  }

  changeSubjectValue(SubjectList val) {
    selectSubjectValue = val;
    notifyListeners();
  }
  GetAllSubjectModal? getAllSubjectModal;
  chapter.GetChapterDetailModel? getChapterDetailModel;
  GetAllCombineClassModel? getAllCombineClassModel;
  GetAllCombineSubjectModel? getAllCombineSubjectModel;

  init(String chapId) async {
    setBusy(true);
    chapterId = chapId;
    await getChapterDetails(chapId);
    log("message12");

    notifyListeners();
    setBusy(false);
  }

  Future<void> getChapterDetails(String chapterId) async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      log(_neededVariables.loginModel!.toMap().toString(), name: "data");
      getChapterDetailModel = await apiService.chaptersDetails({"LoginName": _neededVariables.loginModel!.fullName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "cmpid": _neededVariables.loginModel!.cmpid, "brcode": _neededVariables.loginModel!.brcode, "Authentication": _neededVariables.loginModel!.authentication, "PersonId": _neededVariables.loginModel!.personId, "CourseID": _neededVariables.loginModel!.courseId, "Value": chapterId});
      if (getChapterDetailModel!.output!.statusFlag == 1) {
        subjectList.clear();
        selectSubjectValue = null;
        subjectList.add(SubjectList(text: "-- SELECT --"));
        subjectList.addAll(getChapterDetailModel!.dropdowns!.sub!);
        classList.clear();
        selectClassValue = null;
        classList.add(Cl(text: "-- SELECT --"));
        classList.addAll(getChapterDetailModel!.dropdowns!.cls!);
        yearList.clear();
        selectYearValue = null;
        yearList.add(chapter.Year(yearName: "-- SELECT --"));
        yearList.addAll(getChapterDetailModel!.dropdowns!.year!.yearList!);
      }
      for (var val = 0; val < classList.length; val++) {
        if (classList[val].text == getChapterDetailModel!.chapter!.semester) {
          changeClassValue(classList[val]);
        }
      }

      for (var val = 0; val < yearList.length; val++) {
        if (yearList[val].yearId == getChapterDetailModel!.chapter!.yearId) {
          changeYearValue(yearList[val]);
        }
      }
      for (var val = 0; val < subjectList.length; val++) {
        if (subjectList[val].value == getChapterDetailModel!.chapter!.subjectId) {
          changeSubjectValue(subjectList[val]);
        }
      }

      chapterNo.text = getChapterDetailModel?.chapter?.chapterNo ?? "";
      chapterName.text = getChapterDetailModel?.chapter?.chapterName ?? "";
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

  Future<void> saveUpdate() async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);

      final result = await apiService.updateChapters({
        "input": {
          "LoginName": _neededVariables.loginModel!.fullName,
          "LoginId": _neededVariables.loginModel!.loginId,
          "token": _neededVariables.loginModel!.token,
          "password": _neededVariables.pass,
          "cmpid": _neededVariables.loginModel!.cmpid,
          "brcode": _neededVariables.loginModel!.brcode,
          "CourseID": _neededVariables.loginModel!.courseId,
          "Authentication": _neededVariables.loginModel!.authentication,
        },
        "chapter": {
          "ChapterName": chapterName.text,
          "SubjectId": selectSubjectValue!.value,
          "SemesterId": selectClassValue!.value,
          "yearId": selectYearValue!.yearId,
          "ChapterNo": chapterNo.text,
          "ChapterId": chapterId,
        },
      });

      showCustomSnackbar(msg: "Chapter Update Successfully", type: SnackbarType.success);
      _navigationService.back();
      _navigationService.replaceWithStaffMyChapterScreen();

      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log(e.toString());
    }
  }

  Future<void> getAllSubjectResult(
    String classId,
  ) async {
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
        "YearID": selectYearValue!.yearId,
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
}
