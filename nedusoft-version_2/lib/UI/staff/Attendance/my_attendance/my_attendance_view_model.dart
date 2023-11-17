import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nedusoft/models/staff/my_attendance_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../Utils/constant.dart';
import '../../../../core/API/api_service.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../../../core/services/needed_utils.dart';
import '../../../../models/staff/getFacultySubjectWiseAttnDataModel.dart';

class MyAttReportViewmodel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();

  MyAttendanceReportModel? myAttReportViewmodel;
  Map<DateTime, int> heatMapDatasets = {};
  TextEditingController from = TextEditingController();
  TextEditingController to = TextEditingController();
  // List<String> yearList = ["--Select--"];

  DateTime initalDate = DateTime.now();

  // Student? selectStudentValue;
  // Subject? selectSubejctValue;
  // List<Student> studentList = [Student(stName: "--Select--")];
  // List<Subject> subjectList = [Subject(text: "--Select--")];

  DateTime fromDate = DateTime.now();
  changeMonth(
    DateTime mon,
  ) async {
    fromDate = mon;
    await getReport();
    // await init();
    notifyListeners();
  }

  changeInitialDate(DateTime val) {
    setBusyForObject(initalDate, true);
    initalDate = val;
    setBusyForObject(initalDate, false);
    notifyListeners();
  }

  fromPickDate(BuildContext context) async {
    final date = await showDatePicker(context: context, initialDate: DateTime.now().add(const Duration(days: 1)), firstDate: DateTime.now().subtract(const Duration(days: 365)), lastDate: DateTime.now().add(const Duration(days: 15)));
    from.text = date == null ? "" : DateFormat("dd-MM-yyyy").format(date);
    fromDate = date ?? DateTime.now();
  }

  toPickDate(BuildContext context) async {
    final date = await showDatePicker(context: context, initialDate: DateTime.now().add(const Duration(days: 1)), firstDate: DateTime.now().subtract(const Duration(days: 365)), lastDate: DateTime.now().add(const Duration(days: 15)));
    to.text = date == null ? "" : DateFormat("dd-MM-yyyy").format(date);
  }

  // changeStudent(Student val) {
  //   selectStudentValue = val;
  //   notifyListeners();
  // }

  // changeSubject(Subject val) {
  //   selectSubejctValue = val;
  //   notifyListeners();
  // }

  init() async {
    await getReport();
    if (myAttReportViewmodel != null) {
      // if (getFacultyStudentCalendarDaysModel!.students!.isNotEmpty) {
      //   studentList.addAll(getFacultyStudentCalendarDaysModel!.students!);
      // }
      // if (getFacultyStudentCalendarDaysModel!.students!.isNotEmpty) {
      //   subjectList.addAll(getFacultyStudentCalendarDaysModel!.subjects!);
      // }
      // for (var obj in studentList) {
      //   if (obj.stId == id) {
      //     changeStudent(obj);
      //   }
      // }
      // for (var obj in subjectList) {
      //   if (obj.value == int.parse(subjectId)) {
      //     changeSubject(obj);
      //   }
      // }
      from.text = DateFormat("dd-MM-yyyy").format(DateTime.now());
      to.text = DateFormat("dd-MM-yyyy").format(DateTime.now());
    }

    notifyListeners();
  }

  bool isLoading = false;
  changeValue() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> getReport() async {
    changeValue();
    DateTime from1 = DateTime(fromDate.year, fromDate.month, 1);

    DateTime toDate = fromDate.month == 2 ? DateTime(fromDate.year, fromDate.month, 28) : DateTime(fromDate.year, fromDate.month, 30);
    fromDate = from1;
    to.text = DateFormat("dd-MM-yyyy").format(toDate);
    from.text = DateFormat("dd-MM-yyyy").format(from1);

    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      myAttReportViewmodel = await apiService.myAttendanceReport({
        "LoginName": _neededVariables.loginModel!.fullName,
        "LoginId": _neededVariables.loginModel!.loginId,
        "token": _neededVariables.loginModel!.token,
        "password": _neededVariables.pass,
        "cmpid": _neededVariables.loginModel!.cmpid,
        "brcode": _neededVariables.loginModel!.brcode,
        "EmployeeId": _neededVariables.loginModel!.employeeId,
        "SectionId": "5",
        "YearId": "1",
        "SubjectId": "29",
        "FrmDate": dateFormatInYearMonthDate(DateFormat("dd-MM-yyyy").format(from1)),
        "ToDate": dateFormatInYearMonthDate(DateFormat("dd-MM-yyyy").format(toDate)),
      });
      heatMapDatasets.clear();
      // "FrmDate": dateFormatInYearMonthDate(DateFormat("dd-MM-yyyy").format(from)),
      // "ToDate": dateFormatInYearMonthDate(DateFormat("dd-MM-yyyy").format(toDate))});
      if (myAttReportViewmodel!.list!.isNotEmpty) {
        for (var obj in myAttReportViewmodel!.list!) {
          log("print");
          if (obj.status == "A") {
            heatMapDatasets[obj.date!] = 4;
            // ignore: unrelated_type_equality_checks
          } else if (obj.status == "P") {
            heatMapDatasets[obj.date!] = 3;
            // ignore: unrelated_type_equality_checks
          } else if (obj.status == "C") {
            heatMapDatasets[obj.date!] = 2;
          }
        }
      }
      changeInitialDate(from1);
      changeValue();
      setBusy(true);
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
    }
  }

  search() {}
}
