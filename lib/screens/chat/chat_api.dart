import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart';

import '../../Model/chat.dart';

class ChatApi {
  Future<List<Chat2>> getChat(int id) async {
    String url = 'http://192.168.175.67:8000/api/chat-detail?userId=$id';
    Uri uri = Uri.parse(url);
    final response = await Dio().get(url);
    List<Chat2> l = [];
    if (response.statusCode == 200) {
      for (var element in response.data['data']) {
        l.add(Chat2.fromJson(element));
      }
    }
    return l;
  }
}
