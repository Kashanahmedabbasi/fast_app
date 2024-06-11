import 'package:fast_app/config/app_colors.dart';
import 'package:fast_app/const/const_variable.dart';
import 'package:flutter/material.dart';

class ProfileSceen extends StatelessWidget {
  const ProfileSceen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit_square,
                color: Colors.black,
              ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ColoredBox(
                color: backgroundColor,
                child: SizedBox(
                  height: 150,
                  width: double.infinity,
                ),
              ),
              Positioned(
                  bottom: -50,
                  left: 20,
                  child: CircleAvatar(
                    radius: 50,
                  )),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Daud Nasir",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 18,
                          color: Color.fromARGB(96, 4, 4, 4),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          "islamabad",
                          style: subTitleTextStyle,
                        ),
                      ],
                    ),
                    Text("18 items posted", style: subTitleTextStyle),
                    Text("24 items rennted", style: subTitleTextStyle)
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "Items You've rented",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
