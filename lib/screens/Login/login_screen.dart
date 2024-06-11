import 'package:fast_app/config/app_colors.dart';
import 'package:fast_app/widgets/app_button.dart';
import 'package:fast_app/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )),
              const SizedBox(
                height: 20,
              ),
              AppTextField("Email", controller: emailController),
              const SizedBox(
                height: 8,
              ),
              AppTextField("Password", controller: emailController),
              const SizedBox(
                height: 12,
              ),
              const Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "Forget your password",
                    style: TextStyle(color: primaryColor),
                  )),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
        const AppButton(
          child: Text("Login"),
        ),
        const Spacer(
          flex: 8,
        ),
        TextButton(
            onPressed: () {},
            child: const Text(
              "Sign Up",
              style: TextStyle(color: Colors.black),
            )),
        Spacer(),
      ]),
    );
  }
}
