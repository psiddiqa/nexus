import 'dart:developer';
import 'package:nedusoft/app/app.router.dart';
import 'package:nedusoft/models/staff/get_timetable_model.dart';
import 'package:nedusoft/models/student/student_learn_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/API/api_service.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../../core/services/needed_utils.dart';

class StudentLearnViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();

  // TimeTableModel? tableModel;
  StudentLearnStubjectModel? stubjectModel;
  StudentLearnChapterModel? studentLearnChapterModel;

  navigateToChapters(String subjectId) async {
    await getStudentChapter(subjectId);
    _navigationService.navigateTo(Routes.studentLearnChapters, arguments: StudentLearnChaptersArguments(model: studentLearnChapterModel));
  }

  double height = 1;
  init() async {
    setBusy(true);
    await getStudentSubject();
    notifyListeners();
    setBusy(false);
  }

  Future<void> getStudentSubject() async {
    try {
      setBusy(true);
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      stubjectModel = await apiService.getStudentLearnSubject({"LoginName": _neededVariables.loginModel!.loginName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "cmpid": _neededVariables.loginModel!.cmpid, "brcode": _neededVariables.loginModel!.brcode, "Value": _neededVariables.loginModel!.classId});
      log(stubjectModel!.list!.length.toString());
      setBusy(false);
    } catch (e) {
      setBusy(false);
    }
  }

  Future<void> getStudentChapter(String subjectId) async {
    try {
      setBusy(true);
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      studentLearnChapterModel = await apiService.getStudentLearnChapters({"LoginName": _neededVariables.loginModel!.loginName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "cmpid": _neededVariables.loginModel!.cmpid, "brcode": _neededVariables.loginModel!.brcode, "Value": subjectId});
      log(stubjectModel!.list!.length.toString());
      setBusy(false);
    } catch (e) {
      setBusy(false);
    }
  }
}
