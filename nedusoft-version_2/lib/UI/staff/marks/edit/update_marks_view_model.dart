import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../Utils/custom_snackbar.dart';
import '../../../../core/API/api_service.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../../../core/services/needed_utils.dart';
import '../../../../main.dart';
import '../../../../models/staff/all_marks_students_model.dart';

class StaffUpdateMarksViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();

  AllUpdateStudentMarksList? getAllStudentMarksList;
  List<AddMarksModel>? addMarksList;

  TextEditingController maxMarks = TextEditingController();
  TextEditingController passMarks = TextEditingController();

  init(AllUpdateStudentMarksList model, List<AddMarksModel> list) async {
    setBusy(true);
    getAllStudentMarksList = model;
    addMarksList = list;
    maxMarks.text = getAllStudentMarksList?.details?.minmarks.toString() ?? "";
    passMarks.text = getAllStudentMarksList?.details?.maxmarks.toString() ?? "";
    notifyListeners();
    setBusy(false);
  }

  changeMarks(int index, String value) {
    addMarksList![index].markesObtain = value;
    
    notifyListeners();
  }

  Future<void> saveMarks(int sectionId, int subjectId, int classId, int exam, int assesment) async {
    setBusy(true);
    try {
      // getAllSectionModal = null;
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      final result = await apiService.submitUpdateMarks({
        "input": {
          "LoginId": _neededVariables.loginModel!.loginId,
          "token": _neededVariables.loginModel!.token,
          "cmpid": _neededVariables.loginModel!.cmpid,
          "brcode": _neededVariables.loginModel!.brcode,
          "PersonId": _neededVariables.loginModel!.personId,
        },
        "Marks": {
          "ExamId": exam,
          "Assesment": assesment,
          "SubjectId": subjectId,
          "SectionId": sectionId,
          "classId": classId,
          "MaxMarks": maxMarks.text,
          "PassMarks": passMarks.text,
        },
        "List": List.from(addMarksList!.map((x) => x.toMap())),
      });
      showCustomSnackbar(msg: "Marks Saved Successfully", type: SnackbarType.success);
      _navigationService.back();

      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
    }
  }
}
