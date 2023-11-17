import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'dart:developer';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../Utils/constant.dart';
import '../../../../core/API/api_service.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../../../core/services/needed_utils.dart';
import '../../../../models/staff/getFacultySubjectWiseAttnDataModel.dart';
import '../../../../models/staff/report_model.dart';

class ReportViewmodel extends BaseViewModel {
  final NavigationService navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();

  GetFacultySubjectWiseAttnDataModel? reportModel;

  Future<void> getReport(String yearId, String subjectId, String classId) async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      reportModel = await apiService.getFacultySubjectWiseAttnData({"LoginName": _neededVariables.loginModel!.fullName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "cmpid": _neededVariables.loginModel!.cmpid, "brcode": _neededVariables.loginModel!.brcode, "Authentication": _neededVariables.loginModel!.authentication, "YearId": yearId, "SubjectId": subjectId, "ClassId": classId});
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log(e.toString());
    }
  }
}
