import 'dart:developer';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../Utils/custom_snackbar.dart';
import '../../../../core/API/api_service.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../../../core/services/needed_utils.dart';
import '../../../../main.dart';
import '../../../../models/staff/student_Show_performance_model.dart';
import '../../../../models/staff/student_exam_wise_model.dart';
import '../../../Attendance/subject_report/report_screen.dart';

class StudentExamWiseViewModel extends BaseViewModel {
  final NavigationService navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();

  GetStudentExamWisePerformanceData? reportModel;

  List<ChartData> list = [];
  // Year? selectYearValue;
  // Class? selectClassValue;
  // Class? selectSectionValue;
  // List<Class> sectionList = [Class(text: "--Select--")];

  // Class? selectSubjectValue;
  // List<Class> subjectList = [Class(text: "-- SELECT --")];
  // List<Year> yearList = [Year(yearName: "--Select--")];
  // List<Class> classList = [Class(text: "--Select--")];

  // changeSectionValue(Class val) async {
  //   selectSectionValue = val;
  //   notifyListeners();
  // }

  // changeSubjectValue(Class val) {
  //   selectSubjectValue = val;
  //   notifyListeners();
  // }

  // changeYear(Year val) {
  //   selectYearValue = val;
  //   notifyListeners();
  // }

  // changeClass(Class val) async {
  //   selectClassValue = val;
  //   notifyListeners();
  // }

  Future<void> getReport(String yearId, String studentId, String assesmentId, String sectionId, String classId) async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      reportModel = await apiService.getStudentExamWisePerformanceData({
        "LoginName": _neededVariables.loginModel!.fullName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "cmpid": _neededVariables.loginModel!.cmpid, "brcode": _neededVariables.loginModel!.brcode, "Authentication": _neededVariables.loginModel!.authentication,
        "YearId": yearId, "Assesment": assesmentId, "SectionId": sectionId, "ClassId": classId,

        // "SectionId": "3",
        // "YearId": "1",
        "StudentId": studentId,
        // "Assesment": "1"
      });
      if (reportModel != null) {
        if (reportModel!.subjects!.isNotEmpty) {
          for (var obj in reportModel!.subjects!) {
            list.add(ChartData(
              "${obj.subject}",
              obj.subjectPerc!.roundToDouble(),
              obj.subject ?? "",
            ));
          }
        }
      }

      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
    }
  }

  // navigateToSearchScreen(String yearId, String assesmentId, String sectionId, String classId) async {
  //   if (selectYearValue!.yearName != "-- SELECT --" && selectSectionValue!.text != "-- SELECT --" && selectSubjectValue!.text != "-- SELECT --" && selectClassValue!.text != "-- SELECT --") {
  //     await getReport(yearId, assesmentId, sectionId, classId);
  //   } else {
  //     showCustomSnackbar(msg: "Please Select Required fields", type: SnackbarType.failure);
  //   }
  // }
}
