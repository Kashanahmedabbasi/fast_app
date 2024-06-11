import 'dart:convert';

import 'package:fast_app/Model/current_user.dart';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

String _baseAPI = "";
login({required String email, required String password, String? role}) {}
SignUp({CurrentUser? user, isSocialLogin = false}) async {}
Future<dynamic> updateToke(int id) async {
  try {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    var token = await messaging.getToken();
    final response = await Dio().post(
      "${_baseAPI}Account/UpdateToken",
      data: json.encode({"UserId": id, 'Token': token}),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    print(e.toString());
  }
}
