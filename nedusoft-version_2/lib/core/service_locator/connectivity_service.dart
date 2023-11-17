import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ConnectivityService {
  Future<bool> checkConnectivity() async {
    if (kIsWeb) {
      return true;
    }
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile && await _addressLookUp()) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi && await _addressLookUp()) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> _addressLookUp() async {
    final result = await InternetAddress.lookup('www.google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
    return false;
  }
}
