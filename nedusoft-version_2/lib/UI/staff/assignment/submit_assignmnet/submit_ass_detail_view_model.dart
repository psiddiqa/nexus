import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';
import 'dart:io';
import 'package:path/path.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../Utils/custom_snackbar.dart';
import '../../../../app/app.router.dart';
import '../../../../core/API/api_service.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../../../core/services/needed_utils.dart';
import '../../../../main.dart';
import '../../../../models/staff/submit_ass_detail_model.dart';

class SubmitAssigmentdetailViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();

  ClassList? selectStatus;
  List<ClassList> statusList = [];

  navigateToBack() {
    _navigationService.back();
  }

navigateToHistoryScreen() async {
    _navigationService.navigateTo(Routes.staffAssignmentHistoryScreen, arguments: StaffAssignmentHistoryScreenArguments(assignId: getSubmittedAssignmentDetailsModel!.data!.assignId!.toString(), subject: getSubmittedAssignmentDetailsModel!.data!.subject!, dataList: getSubmittedAssignmentDetailsModel!.list1!));
  }

  changeStatusValue(ClassList val) async {
    selectStatus = val;
    notifyListeners();
  }

  GetSubmittedAssignmentDetailsModel? getSubmittedAssignmentDetailsModel;
  String? assignId;

  init(String id) async {
    setBusy(true);
    assignId = id;
    await getSubmitAssignmentResult(id);

    notifyListeners();
    setBusy(false);
  }

  Future<void> getSubmitAssignmentResult(String val) async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      final result = await apiService.getSubmitAssignmentDetail({"LoginName": _neededVariables.loginModel!.fullName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "Authentication": _neededVariables.loginModel!.authentication, "PersonId": _neededVariables.loginModel!.personId, "Value": val});
      getSubmittedAssignmentDetailsModel = result;
      if (getSubmittedAssignmentDetailsModel != null) {
        statusList.addAll(getSubmittedAssignmentDetailsModel!.classList!);
        
        for (var val = 0; val < statusList.length; val++) {
          if (statusList[val].text == getSubmittedAssignmentDetailsModel!.data!.status) {
            changeStatusValue(statusList[val]);
          }
        }
      }
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log(e.toString());
    }
  }

  Future<void> assignmentUpdate() async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      log(_neededVariables.loginModel!.toMap().toString(), name: "data");
      final result = await apiService.updateSubmitAssignment({
        "input": {
          "LoginId": _neededVariables.loginModel!.loginId,
          "token": _neededVariables.loginModel!.token,
          "password": _neededVariables.pass,
          "Authentication": _neededVariables.loginModel!.authentication,
          "cmpid": _neededVariables.loginModel!.cmpid,
          "brcode": _neededVariables.loginModel!.brcode,
          "PersonId": _neededVariables.loginModel!.personId,
        },
        "data": {"status_id": selectStatus!.value, "follow_up_date": DateFormat.yMMMMd().format(getSubmittedAssignmentDetailsModel!.data!.followUpDate!), "assign_trans_id": assignId},
      });

      showCustomSnackbar(msg: "Update Assignment Successfully", type: SnackbarType.success);
      _navigationService.back();
      _navigationService.replaceWithSubmitAssignment();

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
