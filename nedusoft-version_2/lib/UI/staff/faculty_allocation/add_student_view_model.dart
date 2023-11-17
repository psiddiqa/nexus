import 'dart:developer';

import 'package:nedusoft/models/staff/faculty_allocation_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../Utils/custom_snackbar.dart';
import '../../../core/API/api_service.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../../core/services/needed_utils.dart';
import '../../../main.dart';

class StudentAllocationViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();

  List<FacultyAllocationStudentList>? studentList;

  bool selectAll = false;

  List<SaveFacultyAllocation> addStudeuntList = [];

  addStudent(SaveFacultyAllocation val, bool select, int index) {
    var contain = addStudeuntList.where((element) => element.studentId == val.studentId);
    if (contain.isEmpty) {
      studentList![index].value = true;
      addStudeuntList.add(val);
      notifyListeners();
    }
  }

  subStudent(SaveFacultyAllocation val, bool select, int index) {
    var contain = addStudeuntList.indexWhere((element) {
      return element.studentId == val.studentId;
    });
    studentList![index].value = false;
    addStudeuntList.removeAt(contain);
    notifyListeners();
  }

  changeSelectAll(bool val) {
    selectAll = val;
    if (val) {
      selectAllStudent();
    } else {
      deselectAllStudent();
    }
    notifyListeners();
  }

  selectAllStudent() {
    for (var element in studentList!) {
      element.value = true;
      log(element.value.toString());
      addStudeuntList.add(SaveFacultyAllocation(studentId: element.studentId));
    }
    notifyListeners();
  }

  deselectAllStudent() {
    for (var element in studentList!) {
      element.value = false;
    }
    addStudeuntList.clear();
    notifyListeners();
  }

  init(List<FacultyAllocationStudentList> model) async {
    setBusy(true);

    studentList = model;
    notifyListeners();
    setBusy(false);
  }

  Future<void> add(String sectionId, String subjectId, String yearid, String classs) async {
    setBusy(true);
    try {
      // getAllSectionModal = null;
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      final result = await apiService.addFacultyAllocation({
        "input": {"LoginId": _neededVariables.loginModel!.loginId, "LoginName": _neededVariables.loginModel!.fullName, "token": _neededVariables.loginModel!.token, "cmpid": _neededVariables.loginModel!.cmpid, "brcode": _neededVariables.loginModel!.brcode, "SectionId": sectionId, "SubjectId": subjectId, "Authentication": _neededVariables.loginModel!.authentication, "Value": "1", "YearId": yearid, "ClassId": classs},
        "List": List.from(addStudeuntList.map((x) => x.toMap())),
      });

      showCustomSnackbar(msg: "Add Successfully", type: SnackbarType.success);
      _navigationService.back();

      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
    }
  }
}

class SaveFacultyAllocation {
  int studentId;
  SaveFacultyAllocation({
    required this.studentId,
  });

  factory SaveFacultyAllocation.fromJson(Map<String, dynamic> json) => SaveFacultyAllocation(studentId: json["studentId"]);
  Map<String, dynamic> toMap() => {
        "StudentId": studentId,
      };
}
