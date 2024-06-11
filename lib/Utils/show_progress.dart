import 'package:flutter/material.dart';
import '../const/const_variable.dart';
import '../screens/admin/controller/AuthController.dart';

Future<void> showProgress() async {
  await showDialog(
    context: navigatorKey.currentContext!,
    barrierDismissible: false,
    builder: (ctx) => WillPopScope(
      onWillPop: () async => AuthController.fromFacebook,
      child: const AlertDialog(
        title: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    ),
  );
  AuthController.fromFacebook = false;
}
