import 'package:fast_app/config/app_colors.dart';
import 'package:fast_app/const/goto.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: current,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.black,
          onTap: (val) {
            current = val;
            setState(() {});
          },
          items: [
            const BottomNavigationBarItem(
                label: "Home", icon: Icon(Icons.home)),
            const BottomNavigationBarItem(
                label: "Search", icon: Icon(Icons.search)),
            BottomNavigationBarItem(
                label: "",
                icon: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                      color: primaryColor, shape: BoxShape.circle),
                  child: const Center(
                      child: Icon(
                    Icons.add,
                    color: Colors.white,
                  )),
                )),
            const BottomNavigationBarItem(
                label: "Chat", icon: Icon(Icons.chat)),
            const BottomNavigationBarItem(
                label: "Profile", icon: Icon(Icons.person_2)),
          ]),
      body: screens[current],
    );
  }
}
