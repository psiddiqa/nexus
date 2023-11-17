import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nedusoft/models/getall_attendance_model.dart';
import 'package:nedusoft/models/save_attendance_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../Utils/constant.dart';
import '../../../Utils/custom_snackbar.dart';
import '../../../core/API/api_service.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../../core/services/needed_utils.dart';
import '../../../main.dart';
import '../../../models/attendance_model.dart';
import '../../../models/get_status_model.dart' as status;

class StaffAttendanceShowViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();

  List<status.ListElement> statusList = [];

  List<status.ListElement> remarkList = [status.ListElement(text: "-- SELECT --", value: 0)];
  GetAllStudentAtteListModel? getAllStudentAtteListModel;
  status.GetAllStatusModel? getAllStatusModel;
  status.GetAllRemarkModel? getAllRemarkModel;
  SaveAttendanceResult? saveModel;
  List<SaveStudentAttendanceModel>? saveStudentAttendanceModel;
  List<AbsentModel> absentStudentList = [];

  bool onlyAbsent = false;
  bool allAbsent = false;

  bool ascending = true;

  changeAscending() {
    ascending = !ascending;
    if (ascending) {
      allAscending();
    } else {
      allDescending();
    }
    notifyListeners();
  }

  allAscending() {
    setBusy(true);
    final val = getAllStudentAtteListModel!.list!.toList();
    List<ListElement> listMappedEntries = val;
    listMappedEntries.sort((a, b) => a.firstName!.compareTo(b.firstName!));
    getAllStudentAtteListModel!.list = listMappedEntries;

    final vals = saveStudentAttendanceModel!.toList();
    List<SaveStudentAttendanceModel> listMapped = vals;
    listMapped.sort((a, b) => a.studentName.compareTo(b.studentName));
    saveStudentAttendanceModel = listMapped;
    log(getAllStudentAtteListModel!.list![0].firstName!);

    setBusy(false);
  }

  allDescending() {
    setBusy(true);
    final val = getAllStudentAtteListModel!.list!.toList();
    List<ListElement> listMappedEntries = val;
    listMappedEntries.sort((a, b) => b.firstName!.compareTo(a.firstName!));
    getAllStudentAtteListModel!.list = listMappedEntries;

    final vals = saveStudentAttendanceModel!.toList();
    List<SaveStudentAttendanceModel> listMapped = vals;
    listMapped.sort((a, b) => b.studentName.compareTo(a.studentName));
    saveStudentAttendanceModel = listMapped;
    log(getAllStudentAtteListModel!.list![0].firstName!);
    setBusy(false);
  }

  allAbsentStudent() {
    setBusy(true);
    for (var v = 0; v < saveStudentAttendanceModel!.length; v++) {
      saveStudentAttendanceModel![v].name = 1;
      saveStudentAttendanceModel![v].statusId = constStatus[1].value;
      addStudent(AbsentModel(index: v, name: saveStudentAttendanceModel![v].studentName));
    }
    setBusy(false);
  }

  allPresentStudent() {
    setBusy(true);
    for (var v = 0; v < saveStudentAttendanceModel!.length; v++) {
      saveStudentAttendanceModel![v].name = 0;
      saveStudentAttendanceModel![v].statusId = constStatus[0].value;
      absentStudentList.clear();
    }
    setBusy(false);
  }

  changeAbsent(bool value) {
    onlyAbsent = value;
    setBusy(true);
    for (var v = 0; v < saveStudentAttendanceModel!.length; v++) {
      for (var b in absentStudentList) {
        if (saveStudentAttendanceModel![v].studentName == b.name) {
          b.index = v;
        }
      }
    }
    setBusy(false);
    notifyListeners();
  }

  changeAllAbsent(bool value) {
    allAbsent = value;
    if (value) {
      allAbsentStudent();
    } else {
      allPresentStudent();
    }
    notifyListeners();
  }

  addStudent(AbsentModel val) {
    var contain = absentStudentList.where((element) => element.name == val.name);
    if (contain.isEmpty) {
      absentStudentList.add(val);
      notifyListeners();
    }
  }

  subStudent(AbsentModel val) {
    var contain = absentStudentList.indexWhere((element) {
      return element.name == val.name;
    });
    if (contain != -1) {
      absentStudentList.removeAt(contain);
    }
    notifyListeners();
  }

  changeStatusValue(int index, int status, int name) {
    getAllStudentAtteListModel!.list![index].statusId = status;
    saveStudentAttendanceModel![index].statusId = status;
    saveStudentAttendanceModel![index].name = name;
    notifyListeners();
  }

  changeRemarkValue(int index, int remark, int name) {
    getAllStudentAtteListModel!.list![index].remarkId = remark;
    saveStudentAttendanceModel![index].remarkId = remark;
    saveStudentAttendanceModel![index].remark = name;
    notifyListeners();
  }

  init(List<SaveStudentAttendanceModel> list, GetAllStudentAtteListModel model) async {
    setBusy(true);
    await getAllRemark();
    await getAllStatus();
    saveStudentAttendanceModel = list;
    getAllStudentAtteListModel = model;
    notifyListeners();
    setBusy(false);
  }

  Future<void> getAllStatus() async {
    setBusy(true);
    try {
      // getAllSectionModal = null;
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      final result = await apiService.getAllStatus({
        "LoginName": _neededVariables.loginModel!.fullName,
        "LoginId": _neededVariables.loginModel!.loginId,
        "token": _neededVariables.loginModel!.token,
        "password": _neededVariables.pass,
        "cmpid": _neededVariables.loginModel!.cmpid,
        "brcode": _neededVariables.loginModel!.brcode,
      });
      getAllStatusModel = result;
      statusList.addAll(getAllStatusModel!.list!);
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
    }
  }

  Future<void> getAllRemark() async {
    setBusy(true);
    try {
      // getAllSectionModal = null;
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      final result = await apiService.getAllRemark({
        "LoginName": _neededVariables.loginModel!.fullName,
        "LoginId": _neededVariables.loginModel!.loginId,
        "token": _neededVariables.loginModel!.token,
        "password": _neededVariables.pass,
        "cmpid": _neededVariables.loginModel!.cmpid,
        "brcode": _neededVariables.loginModel!.brcode,
      });
      getAllRemarkModel = result;
      remarkList.addAll(getAllRemarkModel!.list!);
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
    }
  }

  String timeConverter(TimeOfDay picked) {
    DateTime tempDate = DateFormat("HH:mm").parse("${picked.hour}:${picked.minute}");
    var dateFormat = DateFormat("H:mm");
    return dateFormat.format(tempDate);
  }

  Future<void> saveAttendance(String sectionId, String? subjectId, String? sessionId, TimeOfDay? from, TimeOfDay? to, String yearid, String date, bool goback) async {
    setBusy(true);
    try {
      // getAllSectionModal = null;
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      final result = await apiService.saveAttendance({
        "input": {
          "LoginId": _neededVariables.loginModel!.loginId,
          "token": _neededVariables.loginModel!.token,
          "cmpid": _neededVariables.loginModel!.cmpid,
          "brcode": _neededVariables.loginModel!.brcode,
          "SectionId": sectionId,
          "SubjectId": subjectId,
          "SessionId": sessionId ?? 0,
          "YearId": yearid,
          "date": date,
          "Authentication": "Faculty",
          "password": _neededVariables.pass,
          "LoginName": _neededVariables.loginModel!.loginName,
        },
        "from_time": from == null ? null : timeConverter(from),
        "to_time": to == null ? null : timeConverter(to),
        "List": List.from(saveStudentAttendanceModel!.map((x) => x.toMap())),
      });
      saveModel = result;
      showCustomSnackbar(msg: "Attendance Saved Successfully", type: SnackbarType.success);
      _navigationService.back();

      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
    }
  }
}

class AbsentModel {
  String name;
  int index;
  AbsentModel({required this.index, required this.name});
}
