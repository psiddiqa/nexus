import 'dart:developer';

import 'package:nedusoft/models/attendance_model.dart';
import 'package:nedusoft/models/student/attendance_report_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../core/API/api_service.dart';
import '../../core/service_locator/service_locator.dart';
import '../../core/services/needed_utils.dart';

class AttendanceViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();
  NeededVariables neededVariables = locator<NeededVariables>();

  AttendanceModel? attendanceModel;
  StudentAttendanceReportModel? attendanceReportModel;

  Year? selectYearValue;
  List<Year> yearList = [Year(yearName: "-- SELECT --")];

  changeYearValue(Year val) async {
    selectYearValue = val;
    if (selectYearValue!.yearName == "-- SELECT --") {
      await getAttendanceReport(null);
    } else {
      await getAttendanceReport(val.yearId.toString());
    }
    notifyListeners();
  }

  init() async {
    await getAttendanceReport(null);
    if (attendanceReportModel != null) {
      yearList.addAll(attendanceReportModel!.year!.yearList!);
      for (var val = 0; val < yearList.length; val++) {
        if (yearList[val].yearId == attendanceReportModel!.year!.yearId) {
          selectYearValue = yearList[val];
        }
      }
    }
    notifyListeners();
  }

  Future<void> getAttendanceReport(String? yearId) async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      log(_neededVariables.loginModel!.toMap().toString(), name: "data");
      attendanceReportModel = await apiService.attendanceReport({"LoginName": _neededVariables.loginModel!.fullName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "cmpid": _neededVariables.loginModel!.cmpid, "brcode": _neededVariables.loginModel!.brcode, "YearId": yearId});

      setBusy(false);
    } catch (e) {
      setBusy(false);
      log(e.toString());
    }
  }
}
