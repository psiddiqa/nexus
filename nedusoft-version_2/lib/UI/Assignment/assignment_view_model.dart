import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:nedusoft/app/app.router.dart';
import 'package:nedusoft/models/student/student_assignment_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../core/API/api_service.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../../../core/services/needed_utils.dart';
import '../../models/login_model.dart';

class StudentAssignmentViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();

  StudentAssignmentModel? studentAssignmentModel;
  List<List1Element> submitList = [];
  List<List1Element> completeList = [];
  List<List1Element> pendingList = [];
  List<List1Element> incompleteList = [];

  Section? selectSection;
  List<Section> sectionList = [];

  changeSection(Section val) async {
    selectSection = val;
    await getOnPageAssignment();
    notifyListeners();
  }

  init() async {
    await loadSection();
    await getOnPageAssignment();
    notifyListeners();
  }

  navigateToEditScreen(String assignId, bool complete) {
    _navigationService.navigateTo(Routes.assignmentDetailScreen, arguments: AssignmentDetailScreenArguments(assignId: assignId, complete: complete));
  }

  loadSection() async {
    // log(_neededVariables.loginModel.sections.toString());
    sectionList.addAll(_neededVariables.loginModel!.sections!);
    selectSection = sectionList[0];
    notifyListeners();
  }

  Future<void> getOnPageAssignment() async {
    try {
      setBusy(true);
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      studentAssignmentModel = await apiService.getStudentsAssignment({
        "LoginName": _neededVariables.loginModel!.fullName,
        "LoginId": _neededVariables.loginModel!.loginId,
        "token": _neededVariables.loginModel!.token,
        "password": _neededVariables.pass,
        "classId": _neededVariables.loginModel!.classId,
        "sectionId": selectSection!.value,
        "cmpid": _neededVariables.loginModel!.cmpid,
        "brcode": _neededVariables.loginModel!.brcode,
      });
      
      completeList.addAll(studentAssignmentModel!.list2!);
      submitList.addAll(studentAssignmentModel!.list1!);
      pendingList.addAll(studentAssignmentModel!.list3!);
      incompleteList.addAll(studentAssignmentModel!.list4!);
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
