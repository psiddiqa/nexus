import 'dart:developer';

import 'package:nedusoft/models/staff/faculty_allocation_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../Utils/custom_snackbar.dart';
import '../../../../core/API/api_service.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../../../core/services/needed_utils.dart';
import '../../../../main.dart';

class StudentDeAllocationViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();

  List<FacultyDeAllocationStudentList>? studentList;

  bool selectAll = false;

  List<SaveFacultyDeAllocation> addStudeuntList = [];

  addStudent(SaveFacultyDeAllocation val, bool select, int index) {
    var contain = addStudeuntList.where((element) => element.attId == val.attId);
    if (contain.isEmpty) {
      studentList![index].value = true;
      addStudeuntList.add(val);
      notifyListeners();
    }
  }

  subStudent(SaveFacultyDeAllocation val, bool select, int index) {
    var contain = addStudeuntList.indexWhere((element) {
      return element.attId == val.attId;
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
      addStudeuntList.add(SaveFacultyDeAllocation(attId: element.attId));
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

  init(List<FacultyDeAllocationStudentList> model) async {
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
      final result = await apiService.facultyDeAllocation({
        "input": {
          "LoginId": _neededVariables.loginModel!.loginId,
          "LoginName": _neededVariables.loginModel!.fullName,
          "token": _neededVariables.loginModel!.token,
          "cmpid": _neededVariables.loginModel!.cmpid,
          "brcode": _neededVariables.loginModel!.brcode,
          "Authentication": _neededVariables.loginModel!.authentication,
        },
        "List": List.from(addStudeuntList.map((x) => x.toMap())),
      });

      showCustomSnackbar(msg: "De-Allocation Successfully", type: SnackbarType.success);
      _navigationService.back();

      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
    }
  }
}

class SaveFacultyDeAllocation {
  int attId;
  SaveFacultyDeAllocation({
    required this.attId,
  });

  factory SaveFacultyDeAllocation.fromJson(Map<String, dynamic> json) => SaveFacultyDeAllocation(attId: json["attId"]);
  Map<String, dynamic> toMap() => {
        "AttId": attId,
      };
}
