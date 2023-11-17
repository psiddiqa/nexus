import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nedusoft/Utils/constant.dart';
import 'package:nedusoft/models/get_status_model.dart' as status;
import 'package:nedusoft/models/staff/get_video_detail_model.dart';
import '../../../models/staff/get_publisher_model.dart' as publisher;
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
import '../../../models/getattendance_model.dart';

class AddVideoViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();

  Year? selectYearValue;
  List<Year> yearList = [Year(yearName: "-- SELECT --")];

  Cl? selectClassValue;
  List<Cl> classList = [Cl(text: "-- SELECT --")];

  SubjectList? selectSubjectValue;
  List<SubjectList> subjectList = [SubjectList(text: "-- SELECT --")];

  status.ListElement? selectChapterValue;
  List<status.ListElement> chapterList = [status.ListElement(text: "-- SELECT --")];

  List<publisher.Cl> publisherList = [
    publisher.Cl(text: "-- SELECT --"),
  ];

  publisher.Cl? selectPublisherValue;

  TextEditingController topic = TextEditingController();
  TextEditingController dateField = TextEditingController();
  TextEditingController notes = TextEditingController();
  TextEditingController link = TextEditingController();

  GetVideoDetailModel? getVideoDetailModel;

  navigateToBack() {
    _navigationService.back();
  }

  navigateToSearchScreen() async {
    if (selectSubjectValue!.text != "-- SELECT --" && selectClassValue!.text != "-- SELECT --" && selectYearValue!.yearName != "-- SELECT --" && selectPublisherValue!.text != "-- SELECT --" && selectChapterValue!.text != "-- SELECT --" && topic.text != "" && link.text != "") {
      await addVideo();
    } else {
      showCustomSnackbar(msg: "Please Select Required fields", type: SnackbarType.failure);
    }
  }

  changeClassValue(Cl val) async {
    selectClassValue = val;
    notifyListeners();
    log("message");
    if (val.text != "-- SELECT --") {
      await getAllSubjectResult(
        val.value.toString(),
      );
    }
  }

  changeYearValue(Year val) {
    selectYearValue = val;
    notifyListeners();
  }

  changePublisherValue(publisher.Cl val) {
    selectPublisherValue = val;
    notifyListeners();
  }

  changeChapterValue(status.ListElement val) {
    selectChapterValue = val;
    notifyListeners();
  }

  changeSubjectValue(SubjectList val) async {
    selectSubjectValue = val;
    if (val.text != "-- SELECT --" && selectClassValue!.text != "-- SELECT --") {
      await getAllChapters(selectClassValue!.value.toString(), val.value.toString());
    }
    notifyListeners();
  }

  fromPickDate(BuildContext context) async {
    final date = await showDatePicker(context: context, initialDate: DateTime.now().add(const Duration(days: 1)), firstDate: DateTime.now().subtract(const Duration(days: 30)), lastDate: DateTime.now().add(const Duration(days: 365)));
    dateField.text = date == null ? "" : DateFormat("dd-MM-yyyy").format(date);
  }

  GetEnterAttendanceDropdownsModel? getEnterAttendanceDropdownsModel;
  status.GetAllStatusModel? getAllStatusModel;
  publisher.GetPublisherModel? getpublisherModel;

  GetAllSubjectModal? getAllSubjectModal;
  init(GetVideoDetailModel? model) async {
    setBusy(true);
    getVideoDetailModel = model;
    await getDropDownResult();
    await getPublisher();
    if (getEnterAttendanceDropdownsModel != null) {
      if (getEnterAttendanceDropdownsModel!.cls!.isNotEmpty) {
        classList.addAll(getEnterAttendanceDropdownsModel!.cls!);
        yearList.addAll(getEnterAttendanceDropdownsModel!.year!.yearList!);
      }
    }
    dateField.text = DateFormat("dd-MM-yyyy").format(DateTime.now());
    if (getVideoDetailModel != null) {
      for (var val = 0; val < classList.length; val++) {
        if (classList[val].value == getVideoDetailModel!.classId) {
          changeClassValue(classList[val]);
        }
      }
      for (var val = 0; val < yearList.length; val++) {
        if (yearList[val].yearId == getVideoDetailModel!.yearId) {
          changeYearValue(yearList[val]);
        }
      }
      topic.text = getVideoDetailModel?.topic ?? "";
      notes.text = getVideoDetailModel?.notes ?? "";
      link.text = getVideoDetailModel?.link ?? "";
      dateField.text = DateFormat("dd-MM-yyyy").format(getVideoDetailModel?.date ?? DateTime.now());
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

  Future<void> getPublisher() async {
    try {
      setBusy(true);
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      getpublisherModel = await apiService.getPublisher({"LoginName": _neededVariables.loginModel!.fullName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "cmpid": _neededVariables.loginModel!.cmpid, "PersonId": _neededVariables.loginModel!.personId, "Authentication": _neededVariables.loginModel!.authentication, "brcode": _neededVariables.loginModel!.brcode});
      if (getpublisherModel!.publishers!.isNotEmpty) {
        publisherList.clear();
        selectPublisherValue = null;
        publisherList.add(publisher.Cl(text: "-- SELECT --"));
        publisherList.addAll(getpublisherModel!.publishers!);
        if (getVideoDetailModel != null) {
          for (var val in publisherList) {
            if (val.value == getVideoDetailModel!.publisherId) {
              selectPublisherValue = val;
            }
          }
        }
      }

      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
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
        "YearID": "1",
      });
      getAllSubjectModal = result;

      subjectList.clear();
      selectSubjectValue = null;
      subjectList.add(SubjectList(text: "-- SELECT --"));
      subjectList.addAll(getAllSubjectModal!.subjectList!);
      if (getVideoDetailModel != null) {
        for (var val in subjectList) {
          if (val.value == getVideoDetailModel!.subjectId) {
            changeSubjectValue(val);
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

  Future<void> addVideo() async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      log(_neededVariables.loginModel!.toMap().toString(), name: "data");
      Map<String, dynamic> body = {
        "input": {
          "LoginName": _neededVariables.loginModel!.fullName,
          "LoginId": _neededVariables.loginModel!.loginId,
          "token": _neededVariables.loginModel!.token,
          "cmpid": _neededVariables.loginModel!.cmpid,
          "brcode": _neededVariables.loginModel!.brcode,
          "Authentication": _neededVariables.loginModel!.authentication,
        },
        "publisher_id": selectPublisherValue!.value,
        "year_id": selectYearValue!.yearId,
        "class_id": selectClassValue!.value,
        "subject_id": selectSubjectValue!.value,
        "chapter_id": selectChapterValue!.value,
        "topic": topic.text,
        "link": link.text,
        "date": dateFormatInYearMonthDate(dateField.text),
        "notes": notes.text,
        "File": file != null ? base64Encode(file!.readAsBytesSync()) : null,
        "file_name": file != null ? baseName : null,
      };
      getVideoDetailModel == null
          ? null
          : body.addAll({
              "topic_id": getVideoDetailModel!.topicId,
            });
      final result = await apiService.addVideo(body);
      if (result.statusFlag == 0) {
        showCustomSnackbar(msg: result.statusMessage, type: SnackbarType.failure);
        _navigationService.back();
      } else {
        showCustomSnackbar(msg: getVideoDetailModel == null ? "Add video Successfully" : "Update video Successfully", type: SnackbarType.success);
        _navigationService.back();
        _navigationService.replaceWithStaffVideosScreen();
      }
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
      if (getVideoDetailModel != null) {
        for (var val in chapterList) {
          if (val.value == getVideoDetailModel!.chapterId) {
            selectChapterValue = val;
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
