import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:nedusoft/app/app.router.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../core/API/api_service.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../../../core/services/needed_utils.dart';
import '../../../../models/staff/submit_assignment_model.dart';

class StaffSubmitAssViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();

  GetSubmitAssignmentListModel? submitAssignmentListModel;
  List<Data> submitList = [];
  List<Data> completeList = [];

  init() async {
    await getOnPageAssignment();

    notifyListeners();
  }

  navigateToEditScreen(String assignId) {
    _navigationService.navigateTo(Routes.staffSubmitAssDetail, arguments: StaffSubmitAssDetailArguments(assignId: assignId));
  }

  Future<void> getOnPageAssignment() async {
    try {
      setBusy(true);
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      submitAssignmentListModel = await apiService.submitAssignment({
        "LoginName": _neededVariables.loginModel!.fullName,
        "LoginId": _neededVariables.loginModel!.loginId,
        "token": _neededVariables.loginModel!.token,
        "password": _neededVariables.pass,
        "PersonId": _neededVariables.loginModel!.personId,
        "Authentication": _neededVariables.loginModel!.authentication,
      });
      if (submitAssignmentListModel!.list2!.isNotEmpty) {
        completeList.addAll(submitAssignmentListModel!.list2!);
      }
      if (submitAssignmentListModel!.list1!.isNotEmpty) {
        submitList.addAll(submitAssignmentListModel!.list1!);
      }
      notifyListeners();
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
