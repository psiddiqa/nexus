import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:nedusoft/app/app.router.dart';
import 'package:nedusoft/models/login_model.dart';
import 'package:nedusoft/models/user_info_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';
import '../../Utils/custom_snackbar.dart';
import '../../core/API/api_service.dart';
import '../../core/service_locator/service_locator.dart';
import '../../core/services/needed_utils.dart';
import '../../main.dart';

class IntroViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();

  UserPerInfoModel? userPerIndoModel;

  LocalAuthentication? auth;
  bool supported = true;

  changeSupport(bool val) {
    supported = val;
    notifyListeners();
  }

  bool showUnlockButton = false;
  changeValueOfButton(bool val) {
    showUnlockButton = val;
    notifyListeners();
  }

  // Future<void> _getAvailabilty() async {
  //   List<BiometricType> type = await auth!.getAvailableBiometrics();
  //   print(type);
  // }

  authenticate() async {
    try {
      changeValueOfButton(true);
      bool authenticate = await auth!.authenticate(
          localizedReason: 'Please authenticate to Countinue',
          authMessages: const [
            AndroidAuthMessages(
              signInTitle: 'Oops! Biometric authentication required!',
              cancelButton: 'No thanks',
            ),
            IOSAuthMessages(
              cancelButton: 'No thanks',
            ),
          ],
          options: const AuthenticationOptions(stickyAuth: false, biometricOnly: false, useErrorDialogs: false));
      if (authenticate) {
        await callApi();
      } else {
        changeValueOfButton(false);
        showCustomSnackbar(msg: "Oops! Biometric Authentication Failed!", type: SnackbarType.failure);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  callApi() async {
    final login = _neededVariables.sharedPreferences.getBool("loginDone");
    final onBordeing = _neededVariables.sharedPreferences.getBool("Onbording");

    if (login != null && login == true) {
      await userInfo();
    } else {
      log(login.toString(), name: "login");
      log(onBordeing.toString(), name: "on");
      Future.delayed(const Duration(seconds: 3)).then((value) {
        if (onBordeing != null) {
          _navigationService.clearStackAndShow(Routes.addSchoolCode);
        } else {
          _navigationService.navigateTo(Routes.onbording);
        }
      });
      
    }
    notifyListeners();
  }

  init() async {
    
    auth = LocalAuthentication();
    auth!.isDeviceSupported().then((bool isSupport) => changeSupport(isSupport));
    final val = _neededVariables.sharedPreferences.getBool("biometric");
    if (val != null && val == true) {
      await authenticate();
    } else {
      await callApi();
    }
  }

  Future<void> userInfo() async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      final url = _neededVariables.sharedPreferences.getString("baseUrl");
      ApiService apiService = ApiService(dio, baseUrl: url);
      final asFor = _neededVariables.sharedPreferences.getString(
        "asFor",
      );
      final pass = _neededVariables.sharedPreferences.getString(
        "pass",
      );

      final value = await _neededVariables.flutterSecureStorage.read(key: "loginModel");
      final model = LoginModel.fromJson(jsonDecode(value!));
      log("${model.token} $asFor $pass");
      log(model.toMap().toString());
      _neededVariables.addSpecificValue(model, asFor!);
      _neededVariables.addBasedUrl(urls: url!);
      if (asFor == "Student") {
        final result = await apiService.getUserInfo({"LoginName": model.fullName, "LoginId": model.loginId, "token": model.token, "password": pass});
        if (result.statusMessage == "success") {
          final webUrl = _neededVariables.sharedPreferences.getString(
            "webUrl",
          );
          await _neededVariables.addWebUrl(val: webUrl ?? "");
          await _neededVariables.addUser(model: result);
          _navigationService.clearStackAndShow(Routes.menu);
        } else {
          _navigationService.clearStackAndShow(Routes.addSchoolCode);
        }
      } else {
        // stopwatch.start();
        final result = await apiService.getStaffPersonalInfo({"LoginName": model.fullName, "LoginId": model.loginId, "token": model.token, "password": pass});
        // stopwatch.stop();
        // log(stopwatch.elapsed.toString(), name: "stop watch time");
        if (result.statusMessage == "success") {
          await _neededVariables.addStaffInfo(model: result);
          _navigationService.clearStackAndShow(Routes.staffMenu);
        } else {
          _navigationService.clearStackAndShow(Routes.addSchoolCode);
        }
      }
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log(e.toString());
    }
  }
}
