import 'package:fast_app/Screens/Admin/home.dart';
import 'package:fast_app/screens/chat/chat_list_screen.dart';
import 'package:fast_app/screens/product/add_product_screen.dart';
import 'package:fast_app/screens/profile/profile_screen.dart';
import 'package:fast_app/screens/search/search_screen.dart';
import 'package:flutter/cupertino.dart';

import 'const_variable.dart';

class Goto {
  //
  static void push(Widget screen) {
    Navigator.push(
      navigatorKey.currentContext!,
      CupertinoPageRoute(
        builder: (builder) => screen,
      ),
    );
  }

  //
  static void pushAndRemove(Widget screen) {
    Navigator.pushAndRemoveUntil(
      navigatorKey.currentContext!,
      CupertinoPageRoute(
        builder: (builder) => screen,
      ),
      ((route) => false),
    );
  }

  //
  static void pop() {
    if (Navigator.canPop(navigatorKey.currentContext!)) {
      Navigator.pop(navigatorKey.currentContext!);
    }
  }

  //
  static bool canPop() {
    return Navigator.canPop(navigatorKey.currentContext!);
  }
}

List<Widget> screens = [
  SearchScreen(),
  SearchScreen(),
  AddProductScreen(),
  ChatListScreen(),
  ProfileSceen()
];
