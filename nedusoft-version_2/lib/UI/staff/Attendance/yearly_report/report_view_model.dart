import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'dart:developer';
import 'package:stacked_services/stacked_services.dart';
import '../../../../core/API/api_service.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../../../core/services/needed_utils.dart';
import '../../../../models/staff/getFacultySubjectWiseAttnDataModel.dart';
import '../../../Attendance/subject_report/report_screen.dart';

class YearlyReportViewmodel extends BaseViewModel {
  final NavigationService navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();

  GetFacultySubjectAttnDataModel? getFacultySubjectAttnDataModel;

  Year? selectYearValue;
  List<Year> yearList = [];
  List<ChartData> chartData = [];

  changeYear(Year val) async {
    selectYearValue = val;
    // await init();
    await getReport(yearPass: true);
    notifyListeners();
  }

  init() async {
    await getReport();
    if (getFacultySubjectAttnDataModel != null) {
      yearList.addAll(getFacultySubjectAttnDataModel!.year!.yearList!);
      // // chartData.add(
      // //   ChartData("to_classes", yearAttendanceReport?.pie?.totClasses?.toDouble() ?? 0, color: Color.fromARGB(255, 114, 184, 176)),
      // // );
      // yearAttendanceReport?.pie?.absentPer == 0 ? null : chartData.add();
      // chartData.add();
      // // chartData.add(ChartData("tot_holidays", yearAttendanceReport?.pie?.totHolidays?.toDouble() ?? 0, color: Color(0xFF800080)));
      // yearAttendanceReport?.pie?.leavePer == 0 ? null : chartData.add(ChartData("tot_leaves", yearAttendanceReport?.pie?.leavePer?.toDouble() ?? 0, color: Color(0xFFFFC336)));
    }
  }

  Future<void> getReport({bool yearPass = false}) async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      getFacultySubjectAttnDataModel = await apiService.getFacultySubjectAttnData(yearPass
          ? {"LoginName": _neededVariables.loginModel!.fullName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "cmpid": _neededVariables.loginModel!.cmpid, "brcode": _neededVariables.loginModel!.brcode, "YearId": selectYearValue?.yearId ?? 1}
          : {
              "LoginName": _neededVariables.loginModel!.fullName,
              "LoginId": _neededVariables.loginModel!.loginId,
              "token": _neededVariables.loginModel!.token,
              "password": _neededVariables.pass,
              "cmpid": _neededVariables.loginModel!.cmpid,
              "brcode": _neededVariables.loginModel!.brcode,
            });
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log(e.toString());
    }
  }
}
