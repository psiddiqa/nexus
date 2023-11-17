import 'package:nedusoft/app/app.router.dart';
import 'package:nedusoft/models/staff/feedback_list_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/API/api_service.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../../core/services/needed_utils.dart';

class StaffFeedbackViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();

  FeebbackListModel? feebbackListModel;

  navigateToDetailPage(String nID) {
    _navigationService.navigateTo(Routes.staffFeedBackDetail, arguments: StaffFeedBackDetailArguments(nId: nID));
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
      feebbackListModel = await apiService.getFeedbackList({"LoginName": _neededVariables.loginModel!.loginName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "EmployeeId": _neededVariables.loginModel!.employeeId, "PersonId": _neededVariables.loginModel!.personId});

      setBusy(false);
    } catch (e) {
      setBusy(false);
    }
  }
}
