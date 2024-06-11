import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fast_app/config/app_colors.dart';
import 'package:fast_app/widgets/app_button.dart';
import 'package:fast_app/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class AddProductScreen extends StatefulWidget {
  AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController name = TextEditingController();

  final TextEditingController hourlyRate = TextEditingController();

  final TextEditingController description = TextEditingController();
  File? _image;
  File? _video;
  Uint8List? _thumbnailBytes;
  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {}
    });
  }

  Future<void> _getVideo() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _video = File(pickedFile.path);
      } else {}
    });
  }

  String? citySelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          title: const Text(
            "Add Item",
            style:
                TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          _getImage();
                        },
                        child: Container(
                          height: 130,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12)),
                          child: _image != null
                              ? Image.file(_image!)
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.camera_alt,
                                      size: 35,
                                      color: primaryColor,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Upload Image",
                                      style: TextStyle(color: primaryColor),
                                    )
                                  ],
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          _getVideo();
                        },
                        child: Container(
                          height: 130,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12)),
                          child: _video != null
                              ? Center(
                                  child: Text("Video selected"),
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.video_camera_back_sharp,
                                      size: 35,
                                      color: primaryColor,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Upload Video",
                                      style: TextStyle(color: primaryColor),
                                    )
                                  ],
                                ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    AppTextField("Name", controller: name),
                    const SizedBox(height: 8),
                    AppTextField("Hourly Rate", controller: name),
                    const SizedBox(height: 8),
                    AppTextField("Description", controller: name),
                    const SizedBox(height: 8),
                    const Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Align(
                          alignment: Alignment.topLeft, child: Text("City")),
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
                          value: citySelected,
                          items: [],
                          onChanged: (val) {}),
                    ),
                    const SizedBox(height: 20),
                    AppButton(child: Text("Post Item"))
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
