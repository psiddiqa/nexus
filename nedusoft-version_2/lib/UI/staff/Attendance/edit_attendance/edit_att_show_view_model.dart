import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nedusoft/models/getall_attendance_model.dart';
import 'package:nedusoft/models/save_attendance_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../Utils/constant.dart';
import '../../../../Utils/custom_snackbar.dart';
import '../../../../core/API/api_service.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../../../core/services/needed_utils.dart';
import '../../../../main.dart';
import '../../../../models/attendance_model.dart';
import '../../../../models/get_status_model.dart' as status;
import 'edit_att_view_model.dart';

class EditAttShowViewModel extends BaseViewModel {
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
  List<SaveAttendanceModel>? saveStudentAttendanceModel;

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
    List<SaveAttendanceModel> listMapped = vals;
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
    List<SaveAttendanceModel> listMapped = vals;
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
    }
    setBusy(false);
  }

  allPresentStudent() {
    setBusy(true);
    for (var v = 0; v < saveStudentAttendanceModel!.length; v++) {
      saveStudentAttendanceModel![v].name = 0;
      saveStudentAttendanceModel![v].statusId = constStatus[0].value;
    }
    setBusy(false);
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

  init(List<SaveAttendanceModel> list, GetAllStudentAtteListModel model) async {
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

  Future<void> updateAttendance(String sectionId, String? subjectId, String? sessionId, TimeOfDay? from, TimeOfDay? to, String yearid, String date, bool goback) async {
    setBusy(true);
    try {
      // getAllSectionModal = null;
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      final result = await apiService.updateAttendance({
        "input": {
          "LoginId": _neededVariables.loginModel!.loginId,
          "token": _neededVariables.loginModel!.token,
          "PersonId": _neededVariables.loginModel!.personId,
        },
        "from_time": from == null ? null : timeConverter(from),
        "to_time": to == null ? null : timeConverter(to),
        "List": List.from(saveStudentAttendanceModel!.map((x) => x.toMap())),
      });
      // saveModel = result;
      if (result.statusFlag == 1) {
        // _navigationService.navigateTo(Routes.doneAttendance,arguments: DoneAttendanceArguments(goback: absentStudentList.isEmpty ? true : false));
        showCustomSnackbar(msg: "Attendance Saved Successfully", type: SnackbarType.success);
        if (goback) {
          _navigationService.back();
        }
      }
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
    }
  }
}
