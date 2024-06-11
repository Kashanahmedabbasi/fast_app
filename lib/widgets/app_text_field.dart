import 'package:fast_app/config/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(this.text, {super.key, required this.controller});
  final TextEditingController controller;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text(text),
        ),
        Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: backgroundColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: TextFormField(
                cursorColor: primaryColor,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter ${text.toLowerCase()}"),
                controller: controller,
              ),
            )),
      ],
    );
  }
}
