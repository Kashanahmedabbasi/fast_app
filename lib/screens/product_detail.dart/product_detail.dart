import 'package:fast_app/config/app_colors.dart';
import 'package:fast_app/const/const_variable.dart';
import 'package:fast_app/screens/report/report_screen.dart';
import 'package:fast_app/widgets/app_button.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Item",
          style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ReportScreen()));
              },
              child: Text(
                "Report",
                style: TextStyle(color: primaryColor),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              color: backgroundColor,
              child: null,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "\$12",
                        style: TextStyle(color: primaryColor, fontSize: 18),
                      ),
                      Text(
                        " / hr",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Name of the item",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
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
                      Text(
                        "7th Mar, 2023",
                        style: subTitleTextStyle,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                      "Detail of the product. Detail of the product. Detail of the product. Detail of the product. Detail of the product."),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: backgroundColor,
                    ),
                    title: Text("Miracle Dias"),
                    subtitle: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text("1 new message"),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.chat),
                    ),
                  ),
                  Center(child: AppButton(child: Text("Rent it")))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
