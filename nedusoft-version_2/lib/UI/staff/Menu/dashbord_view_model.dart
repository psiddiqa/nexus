import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:nedusoft/app/app.router.dart';
import 'package:nedusoft/models/login_model.dart';
import 'package:nedusoft/models/staff_info_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/API/api_service.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../../core/services/needed_utils.dart';
import '../../../models/user_info_model.dart';

class StaffDashBoardViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();
  NeededVariables neededVariables = locator<NeededVariables>();

  StaffPersonalInfoModel? staffPersonalInfoModel;
  Uint8List? bytesImage;

  init() {
    setBusy(true);
    staffPersonalInfoModel = _neededVariables.staffInfoModel;
    bytesImage = staffPersonalInfoModel!.base64String == null ? null : const Base64Decoder().convert(staffPersonalInfoModel!.base64String!);
    notifyListeners();
    setBusy(false);
  }

  navigateToProfile() {
    _navigationService.navigateTo(Routes.staffProfileScreen, arguments: StaffProfileScreenArguments(model: staffPersonalInfoModel, bytesImage: bytesImage));
  }

  navigateToMENU() {
    _navigationService.navigateTo(Routes.staffMenu);
  }
}
