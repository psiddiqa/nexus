import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:nedusoft/Utils/custom_snackbar.dart';
import 'package:nedusoft/app/app.router.dart';
import 'package:nedusoft/main.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../Utils/utils.dart';
import '../service_locator/connectivity_service.dart';
import '../service_locator/service_locator.dart';
import '../services/needed_utils.dart';

InterceptorsWrapper throughOutInterceptorsWrapper(Dio dio) {
  final sharedPrefs = locator<NeededVariables>().sharedPreferences;
  final NavigationService _navigate = locator<NavigationService>();
  final _needHelper = locator<NeededVariables>();
  var hasConnection = true;
  return InterceptorsWrapper(
    onRequest: (options, handler) async {
      // final requestPathWithQueryParameters =
      //     attachQueryParametersToUrl(options.path, options.queryParameters);
      // var cachableoptions = !(options.path.contains('update') ||
      //     options.path.contains('otp') ||
      //     options.path.contains('log') ||
      //     options.path.contains('add') ||
      //     options.path.contains('confirm'));

      // if (options.method.toLowerCase() == 'get' && cachableoptions) {
      //   if (sharedPrefs!.containsKey(requestPathWithQueryParameters)) {
      //     print('$requestPathWithQueryParameters exists!');
      //     if (DateTime.now().compareTo(DateTime.parse(sharedPrefs
      //                 .getString('${requestPathWithQueryParameters}createdAt')!)
      //             .add(const Duration(minutes: 2))) <
      //         0) {
      //       print('$requestPathWithQueryParameters is not expired');
      //       var encryptString =
      //           sharedPrefs.getString(requestPathWithQueryParameters)!;
      //       handler.resolve(
      //         Response(
      //           data: json.decode(encrypt.decrypt(encryptString)),
      //           requestOptions: options,
      //           statusCode: 200,
      //         ),
      //       );
      //       return;
      //     }
      //   }
      // }
      hasConnection = await locator<ConnectivityService>().checkConnectivity();
      if (!hasConnection) {
        handler.reject(DioError(response: Response(data: {'errors': 'No internet Connection'}, requestOptions: options), error: 'No Internet Connection, Try again Later!', requestOptions: options, type: DioErrorType.cancel));
        return;
      }
      options.followRedirects = false;
      options.validateStatus = (status) => status! < 501;
      handler.next(options);
      return;
    },
    onResponse: (response, handler) async {
      if (response.statusCode! >= 200 && response.statusCode! < 203) {
        if (response.data['statusMessage'] != "Unauthorized access please login again ") {
          handler.resolve(response);
        } else {
          throw DioError(requestOptions: response.requestOptions, response: response, error: 'Bad Request Parameters', type: DioErrorType.response);
        }
      } else if (response.statusCode! >= 203 && response.statusCode! < 209) {
        response.data = {'data': null};
        // ignore: unawaited_futures

        handler.resolve(response);
      } else if (response.statusCode! >= 300 && response.statusCode! < 400) {
        throw DioError(requestOptions: response.requestOptions, response: response, error: 'Need to Login, couldn\'t identify User', type: DioErrorType.cancel);
      } else if (response.statusCode == 400) {
        throw DioError(requestOptions: response.requestOptions, response: response, error: 'Bad Request Parameters', type: DioErrorType.cancel);
      } else if (response.statusCode == 401) {
        log("401");
        await _needHelper.sharedPreferences.clear();
        await _needHelper.flutterSecureStorage.deleteAll();
        await _needHelper.reset();
        showCustomSnackbar(msg: "Unauthorized access please login again", type: SnackbarType.failure);
        _navigate.clearStackAndShow(Routes.addSchoolCode);
      } else if (response.statusCode! > 402 && response.statusCode! < 499) {
        if (response.data['message'] != null) {
          handler.resolve(response);
        }
        throw DioError(requestOptions: response.requestOptions, response: response, error: 'Error in finding the request', type: DioErrorType.receiveTimeout);
      } else if (response.statusCode! >= 500) {
        showCustomSnackbar(msg: "Internal Server Error", type: SnackbarType.failure);
      } else {
        throw DioError(requestOptions: response.requestOptions, response: response, error: 'Can\'t identify Error', type: DioErrorType.sendTimeout);
      }
    },
    onError: (dioError, handler) async {
      handler.next(dioError);
    },
  );
}
