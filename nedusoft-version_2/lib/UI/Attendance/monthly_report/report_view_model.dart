import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'dart:developer';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../Utils/constant.dart';
import '../../../../core/API/api_service.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../../../core/services/needed_utils.dart';
import '../../../../models/staff/report_model.dart';
import '../../../models/staff/yearly_attendance_report.dart';

class StudentReportViewmodel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();
  YearAttendanceReport? yearAttendanceReport;
  Map<DateTime, int> heatMapDatasets = {};
  List<AttnList>? attnList;
  DateTime fromDate = DateTime.now();
  changeMonth(DateTime mon) async {
    fromDate = mon;
    await init(false);
    notifyListeners();
  }

  init(bool firstTime) async {
    await getReport(firstTime);

    if (yearAttendanceReport != null) {
      firstTime ? attnList = yearAttendanceReport?.attnList ?? [] : null;
      if (yearAttendanceReport!.list!.isNotEmpty) {
        for (var obj in yearAttendanceReport!.list!) {
          if (obj.status == "A") {
            heatMapDatasets[obj.date!] = 4;
          } else if (obj.status == "P") {
            heatMapDatasets[obj.date!] = 3;
          } else if (obj.status == "C") {
            heatMapDatasets[obj.date!] = 2;
          }

          // // heatMapDatasets[obj.date!] = obj.status == "P" ? 3 : 1;
          // heatMapDatasets[obj.date!] = obj.status == "C" ? 2 : 1;
        }
      }
    }
    log(attnList!.length.toString());
    notifyListeners();
  }

  Future<void> getReport(bool firstTime) async {
    DateTime from = DateTime(fromDate.year, fromDate.month, 1);

    DateTime toDate = fromDate.month == 2 ? DateTime(fromDate.year, fromDate.month, 28) : DateTime(fromDate.year, fromDate.month, 30);

    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      yearAttendanceReport = await apiService.getMonthlyAttendanceReport(firstTime
          ? {
              "LoginName": _neededVariables.loginModel!.fullName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "cmpid": _neededVariables.loginModel!.cmpid, "brcode": _neededVariables.loginModel!.brcode,
              // "FrmDate": dateFormatInYearMonthDate(DateFormat("dd-MM-yyyy").format(from)),
              //  "ToDate": dateFormatInYearMonthDate(DateFormat("dd-MM-yyyy").format(toDate))
            }
          : {"LoginName": _neededVariables.loginModel!.fullName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "cmpid": _neededVariables.loginModel!.cmpid, "brcode": _neededVariables.loginModel!.brcode, "FrmDate": dateFormatInYearMonthDate(DateFormat("dd-MM-yyyy").format(from)), "ToDate": dateFormatInYearMonthDate(DateFormat("dd-MM-yyyy").format(toDate))});
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log(e.toString());
    }
  }
}
