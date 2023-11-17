import 'package:flutter/material.dart';
import 'package:nedusoft/Utils/Colors.dart';

import 'package:stacked_services/stacked_services.dart';

import '../core/service_locator/service_locator.dart';
import '../core/services/needed_utils.dart';
import '../main.dart';


SnackbarConfig customSnackbar({required SnackbarType type}) {
  switch (type) {
    case SnackbarType.success:
      return SnackbarConfig(
        // icon: SvgPicture.asset(
        //   'assets/svg/UI_utils/check-circle.svg',
        //   height: 20,
        //   width: 20,
        // ),
        // barBlur: 0.2,
        isDismissible: true,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        padding: const EdgeInsets.all(15),
        
        // boxShadows: [
        //   BoxShadow(
        //     blurRadius: 5,
        //     spreadRadius: -1,
        //     color: FontColors.success,
        //   )
        // ],
        messageColor: Colors.white,
        backgroundColor: secondryColor,
        borderRadius: 8,
        // borderColor: FontColors.success,
      );
    case SnackbarType.failure:
      return SnackbarConfig(
        // icon: SvgPicture.asset(
        //   'assets/svg/UI_utils/check-circle.svg',
        //   height: 20,
        //   width: 20,
        // ),
        // barBlur: 0.2,
        isDismissible: true,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        padding: const EdgeInsets.all(15),
        
        // boxShadows: [
        //   BoxShadow(
        //     blurRadius: 5,
        //     spreadRadius: -1,
        //     color: FontColors.error,
        //   )
        // ],
        messageColor: Colors.white,
        backgroundColor: Colors.red.withOpacity(0.5),
        borderRadius: 8,
        // borderColor: FontColors.error,
      );
    default:
      return SnackbarConfig(
        // icon: SvgPicture.asset(
        //   'assets/svg/UI_utils/check-circle.svg',
        //   height: 20,
        //   width: 20,
        // ),
        // barBlur: 0.2,
        isDismissible: true,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        padding: const EdgeInsets.all(10),
        // maxWidth: SizedBoxConfig.screenWidth * 0.9,
        // boxShadows: [
        //   BoxShadow(
        //     blurRadius: 5,
        //     spreadRadius: -1,
        //     color: FontColors.error,
        //   )
        // ],
        messageColor: Colors.white,
        backgroundColor: Colors.red,
        borderRadius: 8,
        borderColor:Colors.red.shade100,
      );
  }
}

void showCustomSnackbar(
    {required String? msg, SnackbarType type = SnackbarType.success,String? title}) {

  locator<SnackbarService>().showCustomSnackBar(
      message: msg!,
      title: title ?? (type == SnackbarType.success
          ?  'Success'
          :  'Error'),
      duration: const Duration(seconds: 2),
      variant: type);
}
