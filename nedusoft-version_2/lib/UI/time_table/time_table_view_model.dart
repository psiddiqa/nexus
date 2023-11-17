import 'dart:developer';
import 'package:nedusoft/app/app.router.dart';
import 'package:nedusoft/models/staff/get_timetable_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/API/api_service.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../../core/services/needed_utils.dart';

class StudentTimeTableViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();

  // TimeTableModel? tableModel;
  GetFacultyTimeTableModel? getFacultyTimeTableModel;

  double height = 1;
  init() async {
    setBusy(true);
    await getTimeTableJson();
    notifyListeners();
    setBusy(false);
  }

  // Future<void> getTimeTable() async {
  //   try {
  //     setBusy(true);
  //     final dio = locator<NeededVariables>().dio;
  //     String url = locator<NeededVariables>().getUrl;
  //     ApiService apiService = ApiService(dio, baseUrl: url);
  //     tableModel = await apiService.getStudentTimeTable();
  //     setBusy(false);
  //   } catch (e) {
  //     setBusy(false);
  //   }
  // }
  Future<void> getTimeTableJson() async {
    try {
      setBusy(true);
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      // getFacultyTimeTableModel = GetFacultyTimeTableModel.fromJson(json);
      final result = await apiService.getStudentTimeTableJson({"LoginName": _neededVariables.loginModel!.loginName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "cmpid": _neededVariables.loginModel!.cmpid, "brcode": _neededVariables.loginModel!.brcode, "Value": _neededVariables.loginModel!.sections![0].value});
      if (result.statusFlag != 0) {
        getFacultyTimeTableModel = result;
      }
      log("message");
      setBusy(false);
      notifyListeners();
    } catch (e) {
      setBusy(false);
    }
  }
}
