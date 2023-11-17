import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nedusoft/UI/Attendance/subject_report/report_screen.dart';
import 'package:stacked/stacked.dart';
import 'dart:developer';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../Utils/constant.dart';
import '../../../../core/API/api_service.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../../../core/services/needed_utils.dart';
import '../../../models/student/college_student_model.dart';

class CollegeYearlyReportViewmodel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();

  CollegeStudentReportModel? yearAttendanceReport;

  Year? selectYearValue;
  String? selectSubejctValue;
  List<Year> yearList = [];
  List<String> subjectList = ["All"];
  List<ChartData> commonChartData = [];
  List<SubjectWiseGraph> chartData = [];

  String classAtt = "0";
  String presentAtt = "0";
  String compAtt = "0";
  String absentAtt = "0";

  changeYear(Year val) async {
    selectYearValue = val;
    await init();
    notifyListeners();
  }

  changeSubject(String val) {
    selectSubejctValue = val;
    if (val != null) {
      subjectWiseBarGraph(val);
    }
    notifyListeners();
  }

  subjectWiseBarGraph(String subject) {
    commonChartData = [];
    if (subject != "All") {
      if (yearAttendanceReport!.list!.isNotEmpty) {
        for (var obj in yearAttendanceReport!.list!) {
          if (obj.subject == subject) {
            classAtt = "${obj.totClass?.toInt() ?? 0}";
            presentAtt = "${obj.totPresent?.toInt() ?? 0}";
            compAtt = "${obj.totLeave?.toInt() ?? 0}";
            absentAtt = "${obj.totAbsent?.toInt() ?? 0}";

            obj.totAbsentPer == 0 ? null : commonChartData.add(ChartData("tot_absent", obj.totAbsentPer?.toDouble() ?? 0, "${obj.totAbsentPer?.toDouble()}%", color: Color(0xFFE13000)));
            obj.totPersentPer == 0 ? null : commonChartData.add(ChartData("tot_present", obj.totPersentPer?.toDouble() ?? 0, "${obj.totPersentPer?.toDouble()}%", color: Color(0xFF149269)));
            // chartData.add(ChartData("tot_holidays", yearAttendanceReport?.pie?.totHolidays?.toDouble() ?? 0, color: Color(0xFF800080)));
            obj.totLeavePer == 0 ? null : commonChartData.add(ChartData("tot_leaves", obj.totLeavePer?.toDouble() ?? 0, "${obj.totLeavePer?.toDouble()}%", color: Color(0xFFFFC336)));
            break;
          }
        }
      }
    } else {
      classAtt = "${yearAttendanceReport?.totClass?.toInt() ?? 0}";
      presentAtt = "${yearAttendanceReport?.totPresent?.toInt() ?? 0}";
      compAtt = "${yearAttendanceReport?.totLeave?.toInt() ?? 0}";
      absentAtt = "${yearAttendanceReport?.totAbsent?.toInt() ?? 0}";

      yearAttendanceReport?.totAbsentPer == 0 ? null : commonChartData.add(ChartData("tot_absent", yearAttendanceReport?.totAbsentPer?.toDouble() ?? 0, "${yearAttendanceReport?.totAbsentPer?.toDouble()}%", color: Color(0xFFE13000)));
      yearAttendanceReport?.totPersentPer == 0 ? null : commonChartData.add(ChartData("tot_present", yearAttendanceReport?.totPersentPer?.toDouble() ?? 0, "${yearAttendanceReport?.totPersentPer?.toDouble()}%", color: Color(0xFF149269)));
      // chartData.add(ChartData("tot_holidays", yearAttendanceReport?.pie?.totHolidays?.toDouble() ?? 0, color: Color(0xFF800080)));
      yearAttendanceReport?.totLeavePer == 0 ? null : commonChartData.add(ChartData("tot_leaves", yearAttendanceReport?.totLeavePer?.toDouble() ?? 0, "${yearAttendanceReport?.totLeavePer?.toDouble()}%", color: Color(0xFFFFC336)));
    }
    notifyListeners();
  }

  init() async {
    chartData = [];
    commonChartData = [];
    await getReport();
    if (yearAttendanceReport != null) {
      if (yearList.isEmpty) {
        yearList.addAll(yearAttendanceReport!.year!.yearList!);
      }
      classAtt = "${yearAttendanceReport?.totClass?.toInt() ?? 0}";
      presentAtt = "${yearAttendanceReport?.totPresent?.toInt() ?? 0}";
      compAtt = "${yearAttendanceReport?.totLeave?.toInt() ?? 0}";
      absentAtt = "${yearAttendanceReport?.totAbsent?.toInt() ?? 0}";
      yearAttendanceReport?.totAbsentPer == 0 ? null : commonChartData.add(ChartData("tot_absent", yearAttendanceReport?.totAbsentPer?.toDouble() ?? 0, "${yearAttendanceReport?.totAbsentPer?.toDouble()}%", color: Color(0xFFE13000)));
      yearAttendanceReport?.totPersentPer == 0 ? null : commonChartData.add(ChartData("tot_present", yearAttendanceReport?.totPersentPer?.toDouble() ?? 0, "${yearAttendanceReport?.totPersentPer?.toDouble()}%", color: Color(0xFF149269)));
      // chartData.add(ChartData("tot_holidays", yearAttendanceReport?.pie?.totHolidays?.toDouble() ?? 0, color: Color(0xFF800080)));
      yearAttendanceReport?.totLeavePer == 0 ? null : commonChartData.add(ChartData("tot_leaves", yearAttendanceReport?.totLeavePer?.toDouble() ?? 0, "${yearAttendanceReport?.totLeavePer?.toDouble()}%", color: Color(0xFFFFC336)));
      subjectList.clear();
      subjectList.add("All");
      selectSubejctValue = null;
      if (yearAttendanceReport!.list!.isNotEmpty) {
        for (var obj in yearAttendanceReport!.list!) {
          if (!subjectList.contains(obj.subject)) {
            subjectList.add(obj.subject ?? "subject");
          }
          chartData.add(SubjectWiseGraph(name: obj.subject ?? "Subject", data: [
            ChartData("tot_absent", obj.totAbsentPer ?? 0.0, "${obj.totAbsentPer}%", color: Color(0xFFE13000)),
            ChartData("tot_present", obj.totPersentPer ?? 0.0, "${obj.totPersentPer}%", color: Color(0xFF149269)),
            ChartData("tot_leave", obj.totLeavePer ?? 0.0, "${obj.totLeavePer}%", color: Color(0xFFFFC336)),
          ]));
        }
      }
    }
    notifyListeners();
  }

  Future<void> getReport() async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      yearAttendanceReport = await apiService.getCollegeStudentReport({
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

class SubjectWiseGraph {
  String name;
  List<ChartData> data;
  SubjectWiseGraph({required this.name, required this.data});
}
