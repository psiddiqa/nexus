import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:nedusoft/app/app.router.dart';
import 'package:nedusoft/models/student/student_sibling_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../Utils/custom_snackbar.dart';
import '../../core/API/api_service.dart';
import '../../core/service_locator/service_locator.dart';
import '../../core/services/needed_utils.dart';
import '../../main.dart';
import '../../models/user_info_model.dart';

class DashBoardViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();

  UserPerInfoModel? userPerIndoModel;
  Uint8List? bytesImage;

  ListElement? selectSibling;
  List<ListElement> siblingList = [];

  init() async {
    setBusy(true);
    userPerIndoModel = _neededVariables.userModel;
    // log(userPerIndoModel!.addressLine1.toString());
    bytesImage = userPerIndoModel!.base64String == null ? null : const Base64Decoder().convert(userPerIndoModel!.base64String!);
    await studentSibling();
    for (var val = 0; val < siblingList.length; val++) {
      if (siblingList[val].value == _neededVariables.loginModel!.loginId) {
        selectSibling = siblingList[val];
      }
    }
    notifyListeners();
    setBusy(false);
  }

  navigateToProfile() {
    _navigationService.navigateTo(Routes.profile, arguments: ProfileArguments(model: userPerIndoModel, bytesImage: bytesImage));
  }

  navigateToMENU() {
    _navigationService.navigateTo(Routes.menu);
  }

  StudentSiblings? siblingsModel;

  changeSibling(ListElement val) async {
    selectSibling = val;
    await studentLogin(selectSibling!.value!);
    notifyListeners();
  }

  Future<void> studentSibling() async {
    try {
      setBusy(true);
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);

      siblingsModel = await apiService.studentSibling({"LoginName": _neededVariables.loginModel!.fullName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "cmpid": _neededVariables.loginModel!.cmpid, "brcode": _neededVariables.loginModel!.brcode});
      siblingList.addAll(siblingsModel!.list!);
      setBusy(false);
      notifyListeners();
    } catch (e) {}
  }

  Future<void> studentLogin(int id) async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      final result = await apiService.getStudentInfo({"LoginName": _neededVariables.loginModel!.fullName, "LoginId": _neededVariables.loginModel!.loginId, "token": _neededVariables.loginModel!.token, "password": _neededVariables.pass, "cmpid": _neededVariables.loginModel!.cmpid, "brcode": _neededVariables.loginModel!.brcode, "Value": id});
      if (result.statusFlag == 1) {
        String model = jsonEncode(result.toMap());
        log(model.toString());
        await _neededVariables.flutterSecureStorage.write(key: "loginModel", value: model);
        await _neededVariables.addSpecificValue(result, "Student");
        await userInfo(result.fullName!, result.loginId.toString(), result.token ?? "", _neededVariables.pass ?? "");
      }
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log(e.toString());
    }
  }

  Future<void> userInfo(String loginName, String loginId, String token, String password) async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);

      final result = await apiService.getUserInfo({"LoginName": loginName, "LoginId": loginId, "token": token, "password": password});

      if (result.statusMessage == "success") {
        await _neededVariables.addUser(model: result);
        userPerIndoModel = result;
        log(_neededVariables.userModel!.studentName!);
      } else {
        showCustomSnackbar(msg: result.statusMessage, type: SnackbarType.failure);
      }
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log(e.toString());
    }
  }
}
