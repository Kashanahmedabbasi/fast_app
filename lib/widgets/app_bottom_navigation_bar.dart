import 'package:fast_app/config/app_colors.dart';
import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.black,
        items: [
          const BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          const BottomNavigationBarItem(
              label: "Search", icon: Icon(Icons.search)),
          BottomNavigationBarItem(
              label: "",
              icon: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    color: primaryColor, shape: BoxShape.circle),
              )),
          const BottomNavigationBarItem(label: "Chat", icon: Icon(Icons.chat)),
          const BottomNavigationBarItem(
              label: "Profile", icon: Icon(Icons.person_2)),
        ]);
  }
}
