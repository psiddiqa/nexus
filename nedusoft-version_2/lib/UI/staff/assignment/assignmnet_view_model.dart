import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:nedusoft/UI/staff/lesson_update/lesson_update_screen.dart';
import 'package:nedusoft/app/app.router.dart';
import 'package:nedusoft/models/staff/assignment_onpage_model.dart';
import 'package:nedusoft/models/staff_notification_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/API/api_service.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../../core/services/needed_utils.dart';
import '../../../models/staff/lesson_onpage_model.dart';

class StaffAssignmnetOnPageViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();

  StaffAssignmentModel? staffAssignmentModel;

  init() async {
    await getOnPageAssignment();
    
    notifyListeners();
  }

  navigateToAddScreen() {
    _navigationService.navigateTo(Routes.staffAddAssignment,);
  }

  navigateToEditScreen(String assignId) {
    _navigationService.navigateTo(Routes.staffEditAssignment, arguments: StaffEditAssignmentArguments(assignId: assignId));
  }

  Future<void> getOnPageAssignment() async {
    try {
      setBusy(true);
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      staffAssignmentModel = await apiService.onPageStaffAssignment({
        "LoginName": _neededVariables.loginModel!.fullName,
        "LoginId": _neededVariables.loginModel!.loginId,
        "token": _neededVariables.loginModel!.token,
        "password": _neededVariables.pass,
        "PersonId" : _neededVariables.loginModel!.personId,
        "cmpid": _neededVariables.loginModel!.cmpid,
        "brcode": _neededVariables.loginModel!.brcode,
      });
      notifyListeners();
      // log(lessonUpdateOnPageLoadModel.lessonLst!.length.toString(),name: "len");
      setBusy(false);
    } catch (e) {
      setBusy(false);
    }
  }

  Future<File> loadPdfFromNetwork(String url) async {
    setBusy(true);
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;
    setBusy(false);
    return _storeFile(url, bytes);
  }

  Future<File> _storeFile(String url, List<int> bytes) async {
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    if (kDebugMode) {
      print('$file');
    }
    return file;
  }

  void openPdf(File file, String url, String name) {
    _navigationService.navigateTo(Routes.pdfViewer, arguments: PdfViewerArguments(file: file, url: url, fileName: name));
  }

}
