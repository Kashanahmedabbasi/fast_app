import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

import '../const/const_variable.dart';
// import 'package:meego/const/const_variable.dart';

Future<bool> checkConnectivity() async {
  try {
    bool isConnected;
    var connectivity = await (Connectivity().checkConnectivity());
    if (connectivity == ConnectivityResult.mobile) {
      isConnected = true;
    } else if (connectivity == ConnectivityResult.wifi) {
      isConnected = true;
    } else {
      isConnected = false;
    }

    if (isConnected) {
      try {
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          isConnected = true;
        }
      } on SocketException catch (_) {
        isConnected = false;
      }
    }

    return isConnected;
  } catch (e) {
    debug('Exception - businessRule.dart - checkConnectivity(): $e');
  }
  return false;
}
