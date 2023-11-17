import 'package:nedusoft/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/API/api_service.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../../core/services/needed_utils.dart';
import '../../models/student/student_feedback_model.dart';

class StudentFeedbackViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();

  StudentFeedbackListModel? feebbackListModel;

  navigateToDetailPage(String nID) {
    _navigationService.navigateTo(Routes.studentFeedBackDetail, arguments: StudentFeedBackDetailArguments(nId: nID));
  }

  navigateToAddPage(String nID) {
    _navigationService.navigateTo(Routes.staffFeedBackDetail, arguments: StaffFeedBackDetailArguments(nId: nID));
  }

  navigateToAddScreen() {
    _navigationService.navigateTo(Routes.studentAddFeedback);
  }

  init() async {
    setBusy(true);
    await getFeedbackList();
    notifyListeners();
    setBusy(false);
  }

  Future<void> getFeedbackList() async {
    try {
      setBusy(true);
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      feebbackListModel = await apiService.getStudentFeedbackList({"LoginName": _neededVariables.loginModel!.loginName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "EmployeeId": _neededVariables.loginModel!.employeeId, "PersonId": _neededVariables.loginModel!.personId});

      setBusy(false);
    } catch (e) {
      setBusy(false);
    }
  }
}
