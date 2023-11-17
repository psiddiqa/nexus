import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nedusoft/UI/Attendance/yearly_report/report_screen.dart';
import 'package:stacked/stacked.dart';
import 'dart:developer';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../Utils/constant.dart';
import '../../../../core/API/api_service.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../../../core/services/needed_utils.dart';
import '../../../../models/staff/yearly_attendance_report.dart';

class YearlyReportViewmodel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();

  YearAttendanceReport? yearAttendanceReport;

  Year? selectYearValue;
  List<Year> yearList = [];
  List<ChartData> chartData = [];
  List<BarChartGroupData>? rawBarGroups;
  List<BarChartGroupData>? showingBarGroups;

  changeYear(Year val) async {
    selectYearValue = val;
    await init();
    notifyListeners();
  }

  init() async {
    chartData = [];
    rawBarGroups = null;
    showingBarGroups = null;
    await getReport();
    if (yearAttendanceReport != null) {
      if (yearList.isEmpty) {
        yearList.addAll(yearAttendanceReport!.year!.yearList!);
      }
      yearAttendanceReport?.pie?.absentPer == 0 ? null : chartData.add(ChartData("tot_absent", yearAttendanceReport?.pie?.absentPer?.toDouble() ?? 0, "${yearAttendanceReport?.pie?.absentPer?.toDouble()}%", color: Color(0xFFE13000)));
      yearAttendanceReport?.pie?.presentPer == 0 ? null : chartData.add(ChartData("tot_present", yearAttendanceReport?.pie?.presentPer?.toDouble() ?? 0, "${yearAttendanceReport?.pie?.presentPer?.toDouble()}%", color: Color(0xFF149269)));
      // chartData.add(ChartData("tot_holidays", yearAttendanceReport?.pie?.totHolidays?.toDouble() ?? 0, color: Color(0xFF800080)));
      yearAttendanceReport?.pie?.leavePer == 0 ? null : chartData.add(ChartData("tot_leaves", yearAttendanceReport?.pie?.leavePer?.toDouble() ?? 0, "${yearAttendanceReport?.pie?.leavePer?.toDouble()}%", color: Color(0xFFFFC336)));

      final barGroup1 = makeGroupData(0, yearAttendanceReport?.pie?.presentPer?.toDouble() ?? 0, Color(0xFF149269));
      final barGroup2 = makeGroupData(1, yearAttendanceReport?.pie?.absentPer?.toDouble() ?? 0, Color(0xFFE13000));
      final barGroup3 = makeGroupData(2, yearAttendanceReport?.pie?.leavePer?.toDouble() ?? 0, Color(0xFFFFC336));

      final items = [
        barGroup1,
        barGroup2,
        barGroup3,
      ];

      rawBarGroups = items;

      showingBarGroups = rawBarGroups;
    }
  }

  Future<void> getReport() async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      yearAttendanceReport = await apiService.getYearlyAttendanceReport({
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

BarChartGroupData makeGroupData(int x, double y1, Color color) {
  return BarChartGroupData(
    barsSpace: 4,
    x: x,
    barRods: [
      BarChartRodData(
        toY: y1,
        color: color,
        width: 15,
      ),
    ],
  );
}
