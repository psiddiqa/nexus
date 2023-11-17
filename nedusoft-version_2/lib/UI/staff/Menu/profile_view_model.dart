import 'package:nedusoft/models/staff/academices_model.dart';
import 'package:nedusoft/models/staff/experience_model.dart';
import 'package:nedusoft/models/staff/family_details_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../Utils/custom_snackbar.dart';
import '../../../core/API/api_service.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../../core/services/needed_utils.dart';
import '../../../main.dart';

class staffProfileViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();

  FamilyDetailsModel? familyDetailsModel;
  ExperienceDetailsModel? experienceDetailsModel;
  AcademicsDetailsModel? academicsDetailsModel;

  init() async {
    setBusy(true);
    await getFamiltInfo();
    await getExpInfo();
    await getAcaInfo();
    setBusy(false);
  }

  Future<void> getFamiltInfo() async {
    try {
      setBusyForObject(getFamiltInfo, true);
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);

      familyDetailsModel = await apiService.familyDetails({"LoginName": _neededVariables.loginModel!.fullName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "EmployeeId": _neededVariables.loginModel!.employeeId});
      if (familyDetailsModel!.output!.statusFlag == 1) {
      } else {
        showCustomSnackbar(msg: familyDetailsModel!.output!.statusMessage, type: SnackbarType.failure);
      }
      notifyListeners();
    } catch (e) {}
  }

  Future<void> getExpInfo() async {
    try {
      setBusyForObject(getFamiltInfo, true);
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);

      experienceDetailsModel = await apiService.experienceDetails({"LoginName": _neededVariables.loginModel!.fullName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "EmployeeId": _neededVariables.loginModel!.employeeId});
      if (familyDetailsModel!.output!.statusFlag == 1) {
      } else {
        showCustomSnackbar(msg: familyDetailsModel!.output!.statusMessage, type: SnackbarType.failure);
      }
      notifyListeners();
    } catch (e) {}
  }

  Future<void> getAcaInfo() async {
    try {
      setBusyForObject(getFamiltInfo, true);
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);

      academicsDetailsModel = await apiService.academicesDetails({"LoginName": _neededVariables.loginModel!.fullName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "EmployeeId": _neededVariables.loginModel!.employeeId});
      if (familyDetailsModel!.output!.statusFlag == 1) {
      } else {
        showCustomSnackbar(msg: familyDetailsModel!.output!.statusMessage, type: SnackbarType.failure);
      }
      notifyListeners();
    } catch (e) {}
  }
}
