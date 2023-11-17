import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nedusoft/app/app.router.dart';
import 'package:nedusoft/core/services/firebase_analytics.dart';
import 'package:nedusoft/models/getbase_model.dart';
import 'package:nedusoft/models/login_model.dart';
import 'package:nedusoft/models/user_info_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../Utils/custom_snackbar.dart';
import '../../core/API/api_service.dart';
import '../../core/service_locator/service_locator.dart';
import '../../core/services/needed_utils.dart';
import '../../main.dart';
import '../../models/getlogo_model.dart';

class LoginViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiService _apiService = locator<ApiService>();
  NeededVariables _neededVariables = locator<NeededVariables>();
  AnalyticsServices _analyticsServices = locator<AnalyticsServices>();
  var stopWatch = Stopwatch();
  double hight = 50;
  String? bytesImage;

  bool isVisible = false;

  changeVisibility(bool val) {
    isVisible = val;
    notifyListeners();
  }

  bool isAccept = false;

  changeAccept(bool val) {
    isAccept = val;
    notifyListeners();
  }

  changeHight(double val) {
    hight = val;
    notifyListeners();
  }

  GetBaseUrl? getBaseUrlModel;
  LoginModel? loginModel;
  UserPerInfoModel? userPerIndoModel;
  GetLogoModel? getLogoModel;
  final schoolName = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();

  List listitem = [
    '+91',
    '+41',
    '+81',
    '+1',
  ];
  String? selectarrive = '+91';

  changeListItem(String val) {
    selectarrive = val;
    notifyListeners();
  }

  Future<void> getBaseUrl(String asFor) async {
    setBusy(true);
    try {
      await _analyticsServices.logEvents("School Code", {"school_code": schoolName.text});
      final result = await _apiService.getBaseUrl({
        "code": schoolName.text,
      });
      getBaseUrlModel = result;
      _neededVariables.sharedPreferences.setString("webUrl", getBaseUrlModel?.webUrl ?? "");
      await _neededVariables.addWebUrl(val: getBaseUrlModel?.webUrl ?? "");
      if (result.url != null && result.url != "") {
        await getLogo(result.url!);
        _neededVariables.sharedPreferences.setString("schoolCode", schoolName.text);
        await _neededVariables.addBasedUrl(urls: result.url ?? "");
        _navigationService.navigateTo(Routes.signin, arguments: SigninArguments(asFor: asFor, image: bytesImage));
      } else {
        showCustomSnackbar(msg: "Invalid School Code", type: SnackbarType.failure);
      }
      log(result.url.toString());
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log(e.toString());
    }
  }

  Future<void> getLogo(String url) async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      ApiService apiService = ApiService(dio, baseUrl: url);
      final result = await apiService.getLogo();
      getLogoModel = result;

      bytesImage = getLogoModel!.logo;
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log(e.toString());
    }
  }

  Future<void> studentLogin(String asFor) async {
    setBusy(true);
    try {
      await _analyticsServices.logEvents("Student Login", {"fcmToken": _neededVariables.fcmToken ?? ""});
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      _neededVariables.sharedPreferences.setString("pass", password.text);
      final result = await apiService.getLogin({"LoginName": phone.text, "password": password.text});
      if (result.token != null && result.token != "") {
        await _neededVariables.addSpecificValue(result, asFor);
        String model = jsonEncode(result.toMap());
        await _neededVariables.flutterSecureStorage.write(key: "loginModel", value: model);
        _neededVariables.sharedPreferences.setString("asFor", asFor);
        _neededVariables.sharedPreferences.setBool("loginDone", true);
        await userInfo(result.fullName!, result.loginId.toString(), result.token!, password.text);
        await _analyticsServices.setUserProperties(_neededVariables.loginModel?.loginId.toString() ?? "", "Student");
        _navigationService.clearStackAndShow(Routes.menu);
      } else {
        showCustomSnackbar(msg: result.statusMessage, type: SnackbarType.failure);
      }
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log(e.toString());
    }
  }

  Future<void> staffLogin(String asFor) async {
    setBusy(true);
    try {
      await _analyticsServices.logEvents("Faculty Login", {"fcmToken": _neededVariables.fcmToken ?? ""});
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      _neededVariables.sharedPreferences.setString("pass", password.text);

      final result = await apiService.getStaffLogin({"LoginName": phone.text, "password": password.text});

      if (result.token != null && result.token != "") {
        await _neededVariables.addSpecificValue(result, asFor);
        String model = jsonEncode(result.toMap());
        log(model.toString());
        await _neededVariables.flutterSecureStorage.write(key: "loginModel", value: model);
        _neededVariables.sharedPreferences.setString("asFor", asFor);
        _neededVariables.sharedPreferences.setBool("loginDone", true);
        await getStaffInfo(result.fullName!, result.loginId.toString(), result.token!, password.text);
        await _analyticsServices.setUserProperties(_neededVariables.loginModel?.loginId.toString() ?? "", "Faculty");
        _navigationService.clearStackAndShow(Routes.staffMenu);
      } else {
        showCustomSnackbar(msg: result.statusMessage, type: SnackbarType.failure);
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
      } else {
        showCustomSnackbar(msg: result.statusMessage, type: SnackbarType.failure);
      }
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log(e.toString());
    }
  }

  Future<void> getStaffInfo(String loginName, String loginId, String token, String password) async {
    setBusy(true);
    try {
      final dio = locator<NeededVariables>().dio;
      String url = locator<NeededVariables>().getUrl;
      ApiService apiService = ApiService(dio, baseUrl: url);
      stopWatch.start();
      final result = await apiService.getStaffPersonalInfo({"LoginName": loginName, "LoginId": loginId, "token": token, "password": password});
      stopWatch.stop();
      log(stopWatch.elapsed.toString(), name: "stop watch time");
      if (result.statusMessage == "success") {
        await _neededVariables.addStaffInfo(model: result);
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
