import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nedusoft/models/lesson_update_model.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.router.dart';
import '../../core/API/api_service.dart';
import '../../core/service_locator/service_locator.dart';
import '../../core/services/needed_utils.dart';

class LessonUpdateViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();
  final dialogService = locator<DialogService>();

  LessonUpdateModel? lessonUpdateViewModel;

  TextEditingController from = TextEditingController();
  TextEditingController to = TextEditingController();

  List<LessonList>? _lesson;

  init() async {
    setBusy(true);

    await getLessonUpdateOnLoad();
    _lesson = lessonUpdateViewModel!.lessonList;
    notifyListeners();
    setBusy(false);
  }

  navigateToViewScreen(LessonList model) {
    _navigationService.navigateTo(Routes.studentLessonDetail, arguments: StudentLessonDetailArguments(model: model));
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

  Future<void> getLessonUpdateOnLoad() async {
    try {
      setBusy(true);
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      lessonUpdateViewModel = await apiService.getLessonUpdateOnLoad({"LoginName": _neededVariables.loginModel!.loginName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "cmpid": _neededVariables.loginModel!.cmpid, "brcode": _neededVariables.loginModel!.brcode, "Value": "12262"});
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log(e.toString());
    }
  }

  fromPickDate(BuildContext context) async {
    final date = await showDatePicker(context: context, initialDate: DateTime.now().add(const Duration(days: 1)), firstDate: DateTime.now().subtract(const Duration(days: 30)), lastDate: DateTime.now().add(const Duration(days: 365)));
    from.text = date == null ? "" : DateFormat("dd-MM-yyyy").format(date);
  }

  toromPickDate(BuildContext context) async {
    final date = await showDatePicker(context: context, initialDate: DateTime.now().add(const Duration(days: 1)), firstDate: DateTime.now(), lastDate: DateTime.now().add(const Duration(days: 365)));
    to.text = DateFormat("dd-MM-yyyy").format(date!);
  }
}
