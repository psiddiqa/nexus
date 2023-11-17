// import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:dio/dio.dart';
// import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:nedusoft/models/login_model.dart';
import 'package:nedusoft/models/staff_info_model.dart';
import 'package:nedusoft/models/user_info_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

@singleton
class NeededVariables {
  bool _loaded = false;

  Future<void> reset() async {
    _pass = null;
    _loginModel = null;
    _asFor = null;
    url = null;
    _usermodel = null;
    _staffPersonalInfoModel = null;
  }

  String? _appVersion;
  String? _appBuildNumber;
  String? get appVersion => _appVersion;
  String? get appBuildNumber => _appBuildNumber;

  String? _webUrl;
  String? get webUrl => _webUrl;

  String? get pass => _pass;
  LoginModel? _loginModel;
  LoginModel? get loginModel => _loginModel;
  String? get asFor => _asFor;
  String? _asFor;
  String? _pass;
  String? url;
  String get getUrl => url!;
  SharedPreferences get sharedPreferences => _sharedPreferences;
  FlutterSecureStorage get flutterSecureStorage => _flutterSecureStorage;

  Dio get dio => _dio;
  String? _classname;
  String? get className => _classname;

  late FlutterSecureStorage _flutterSecureStorage;
  late SharedPreferences _sharedPreferences;
  final Dio _dio = Dio();

  UserPerInfoModel? _usermodel;
  UserPerInfoModel? get userModel => _usermodel;

  StaffPersonalInfoModel? _staffPersonalInfoModel;
  StaffPersonalInfoModel? get staffInfoModel => _staffPersonalInfoModel;

  Future<void> addBasedUrl({required String urls}) async {
    await _sharedPreferences.setString(
      "baseUrl",
      urls,
    );
    url = urls;
  }

  String? _schoolCode;
  String? get schoolCode => _schoolCode;

  Future<void> addSpecificValue(LoginModel loginModel, String asFor) async {
    url = sharedPreferences.getString("baseUrl");
    _asFor = _asFor;
    _loginModel = loginModel;
    _pass = sharedPreferences.getString("pass");
    _schoolCode = sharedPreferences.getString("schoolCode");
  }

  Future<void> addUser({required UserPerInfoModel model}) async {
    _usermodel = model;
  }

  Future<void> addStaffInfo({required StaffPersonalInfoModel model}) async {
    _staffPersonalInfoModel = model;
  }

  Future<void> addWebUrl({required String val}) async {
    _webUrl = val;
  }

  String? _fcmToken;
  String? get fcmToken => _fcmToken;

  Future<void> load({required String appVersion, required String appBuildNumber, required String? token, required String type, required String version}) async {
    // _cacheStore = DbCacheStore();
    // ignore: no_leading_underscores_for_local_identifiers
    _appVersion = appVersion;
    _appBuildNumber = appBuildNumber;
    AndroidOptions _getAndroidOptions() => const AndroidOptions(
          encryptedSharedPreferences: true,
        );
    _fcmToken = token;
    _flutterSecureStorage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    _sharedPreferences = await SharedPreferences.getInstance();
    _loaded = true;
  }

  bool get isLoaded => _loaded;
}
