import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:nedusoft/app/app.router.dart';
import 'package:nedusoft/models/get_combine_sec_model.dart';
import 'package:nedusoft/models/getall_subject_model.dart';
import 'package:nedusoft/models/staff/all_year_model.dart';
import 'package:nedusoft/models/staff/my_chapter_list_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../Utils/custom_snackbar.dart';
import '../../../core/API/api_service.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../../core/services/needed_utils.dart';
import '../../../main.dart';
import '../../../models/getattendance_model.dart';

class StaffAddChapterViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();

  AllYearListModel? selectYearValue;
  List<AllYearListModel> yearList = [AllYearListModel(yearName: "-- SELECT --")];

  Cl? selectClassValue;
  List<Cl> classList = [Cl(text: "-- SELECT --")];

  SubjectList? selectSubjectValue;
  List<SubjectList> subjectList = [SubjectList(text: "-- SELECT --")];

  TextEditingController chapterNo = TextEditingController();
  TextEditingController chapterName = TextEditingController();

  Chapter? chapter;

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
    if (selectYearValue!.yearName != "-- SELECT --" && selectSubjectValue!.text != "-- SELECT --" && selectClassValue!.text != "-- SELECT --" && chapterName.text != "" && chapterNo.text != "") {
      await saveUpdate();
    } else {
      showCustomSnackbar(msg: "Please Select Required fields", type: SnackbarType.failure);
    }
  }

  changeYearValue(AllYearListModel val) {
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

  AllYearListModel? yearListModel;
  GetAllCombineClassModel? getAllCombineClassModel;
  GetAllClassesModel? getAllClassModel;
  GetAllSubjectModal? getAllSubjectModal;
  GetAllCombineSubjectModel? getAllCombineSubjectModel;

  init(Chapter? chap) async {
    setBusy(true);
    chapter = chap;
    await getAllYearList();
    await getAllClassResult();
    if (chapter != null) {
      for (var val = 0; val < classList.length; val++) {
        if (classList[val].text == chapter!.semester) {
          selectClassValue = classList[val];
          changeClassValue(classList[val]);
        }
      }

      for (var val = 0; val < yearList.length; val++) {
        if (yearList[val].yearId == chapter!.yearId) {
          changeYearValue(yearList[val]);
        }
      }
      chapterNo.text = chapter?.chapterNo ?? "";
      chapterName.text = chapter?.chapterName ?? "";
    }

    notifyListeners();
    setBusy(false);
  }

  Future<void> getAllYearList() async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      log(_neededVariables.loginModel!.toMap().toString(), name: "data");
      yearListModel = await apiService.allYearList({"LoginName": _neededVariables.loginModel!.fullName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "cmpid": _neededVariables.loginModel!.cmpid, "brcode": _neededVariables.loginModel!.brcode, "Authentication": _neededVariables.loginModel!.authentication, "PersonId": _neededVariables.loginModel!.personId, "CourseID": _neededVariables.loginModel!.courseId});
      yearList.clear();
      selectYearValue = null;
      yearList.add(AllYearListModel(yearName: "-- SELECT --"));
      yearList.addAll(yearListModel!.yearList!);
      log(yearList.length.toString());

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
      if (chapter != null) {
        for (var val in subjectList) {
          if (val.value == chapter!.subjectId) {
            selectSubjectValue = val;
          }
        }
      }
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

  Future<void> saveUpdate() async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);

      if (chapter == null) {
        final result = await apiService.saveChapters({
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
          },
        });
      } else {
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
            "ChapterId": chapter!.chapterId,
          },
        });
      }

      showCustomSnackbar(msg: chapter == null ? "Chapter Saved Successfully" : "Chapter Update Successfully", type: SnackbarType.success);
      _navigationService.back();
      _navigationService.replaceWithStaffMyChapterScreen();

      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log(e.toString());
    }
  }
}
