import 'package:fast_app/widgets/app_button.dart';
import 'package:fast_app/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget {
  ReportScreen({super.key});
  final TextEditingController reportController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Report",
          style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
        ),
      ),
      body: Column(children: [
        const Divider(),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppTextField("Reason for reporting",
              controller: reportController),
        ),
        const Spacer(),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: AppButton(child: Text("Submit Report")),
        )
      ]),
    );
  }
}
