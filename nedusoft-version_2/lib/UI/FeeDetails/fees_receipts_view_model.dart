import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:nedusoft/Utils/custom_snackbar.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../core/API/api_service.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../../core/services/needed_utils.dart';
import '../../app/app.router.dart';
import '../../models/student/on_page_receipts_mode.dart';

class StudentFeesReceiptsViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();

  Year? selectYear;
  List<Year> yearList = [Year(text: "-- SELECT --")];

  navigateToBack() {
    _navigationService.back();
  }

  navigateToSearchScreen() async {
    // if (selectSectionValue!.text != "-- SELECT --" && selectExamMasterValue!.text != "-- SELECT --") {
    //   await getAllMarksList();

    //   _navigationService.navigateTo(Routes.studentMarkDetail, arguments: StudentMarkDetailArguments(getStudentMarksList: getStudentMarksList!, examName: selectExamMasterValue!.text!));
    // } else {
    //   showCustomSnackbar(msg: "Please Select Required fields", type: SnackbarType.failure);
    // }
  }

  changeFeeTypealue(Year val) async {
    selectYear = val;
    await getReceipts(selectYear!.value);
    notifyListeners();
  }

  OnPageReceiptsModel? onPageReceiptsModel;

  init() async {
    setBusy(true);
    await getReceipts(null);
    notifyListeners();
    setBusy(false);
  }

  Future<void> getReceipts(int? yearId) async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      log(_neededVariables.loginModel!.toMap().toString(), name: "data");
      onPageReceiptsModel = await apiService.onPageReceipts({"LoginName": _neededVariables.loginModel!.fullName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "cmpid": _neededVariables.loginModel!.cmpid, "brcode": _neededVariables.loginModel!.brcode, "YearId": yearId});
      yearList.addAll(onPageReceiptsModel!.years!);
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log(e.toString());
    }
  }

  Future<void> downloadReceipts(int? yearId) async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      log(_neededVariables.loginModel!.toMap().toString(), name: "data");
      final result = await apiService.studentReceiptsFile({"LoginName": _neededVariables.loginModel!.fullName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "cmpid": _neededVariables.loginModel!.cmpid, "brcode": _neededVariables.loginModel!.brcode, "Value": yearId});
      if (result.statusMessage != "" && result.statusMessage != null) {
        final file = await loadPdfFromNetwork(result.statusMessage!);
        openPdf(file, result.statusMessage!, basename(result.statusMessage!));
      } else {
        showCustomSnackbar(msg: result.statusMessage);
      }
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log(e.toString());
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
