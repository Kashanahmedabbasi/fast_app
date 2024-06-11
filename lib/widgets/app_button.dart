import 'package:fast_app/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: primaryColor,
            fixedSize: const Size(330, 50)),
        onPressed: () {},
        child: child);
  }
}
