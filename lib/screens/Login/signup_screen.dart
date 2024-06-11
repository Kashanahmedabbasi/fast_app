import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fast_app/config/app_colors.dart';
import 'package:fast_app/widgets/app_button.dart';
import 'package:fast_app/widgets/app_text_field.dart';

import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  String? countrySelected;
  String? citySelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const Spacer(
          flex: 3,
        ),
        const Text(
          "Renting App",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Registration",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )),
              const SizedBox(
                height: 20,
              ),
              AppTextField("Name", controller: emailController),
              const SizedBox(
                height: 8,
              ),
              AppTextField("Email", controller: emailController),
              const SizedBox(
                height: 8,
              ),
              AppTextField("Contact number", controller: emailController),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Align(
                          alignment: Alignment.topLeft, child: Text("Country")),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2(
                          buttonHeight: 55,
                          isExpanded: true,
                          hint: const Text("Select Country"),
                          buttonDecoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          value: countrySelected,
                          items: [],
                          onChanged: (val) {}),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Align(
                          alignment: Alignment.topLeft, child: Text("City")),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2(
                          buttonHeight: 55,
                          isExpanded: true,
                          hint: const Text("Select city"),
                          buttonDecoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          value: countrySelected,
                          items: [],
                          onChanged: (val) {}),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
        const AppButton(
          child: Text("Sign Up"),
        ),
        const Spacer(
          flex: 6,
        ),
        TextButton(
            onPressed: () {},
            child: const Text(
              "Login",
              style: TextStyle(color: Colors.black),
            )),
        const Spacer(),
      ]),
    );
  }
}
