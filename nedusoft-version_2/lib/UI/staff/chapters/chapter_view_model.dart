import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:nedusoft/app/app.router.dart';
import 'package:nedusoft/models/staff/my_chapter_list_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../core/API/api_service.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../../core/services/needed_utils.dart';
import '../../../models/staff/lesson_onpage_model.dart';

class StaffMyChapterViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();

  MyChaptersListModel? myChaptersListModel;

  init() async {
    await getMyChapterList();
    notifyListeners();
  }

  navigateToAddScreen() {
    _navigationService.navigateTo(Routes.staffAddChapter, arguments: const StaffAddChapterArguments(edit: false, chapter: null));
  }

  navigateToEditScreen(String chapter) {
    _navigationService.navigateTo(Routes.staffEditChapter, arguments: StaffEditChapterArguments(chapterId: chapter));
  }

  Future<void> getMyChapterList() async {
    try {
      setBusy(true);
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      log("message");
      myChaptersListModel = await apiService.myChapterList({"LoginName": _neededVariables.loginModel!.fullName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "PersonId": _neededVariables.loginModel!.personId});
      log(myChaptersListModel!.chapter.toString(), name: "alpha");
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
    }
  }
}
