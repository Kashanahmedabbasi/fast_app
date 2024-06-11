import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:meego/controllers/setting_controller.dart';
// import 'package:meego/controllers/vendor_controller.dart';

const dbProfile = 'dbProfile';
const keyintro = 'keyintro';

//late SettingController settingController;

//late VendorController vendorController;

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

debug(message) => log(message.toString());

//// gap
Widget xsmalGap() => SizedBox(height: 5.sp);
Widget smalGap() => SizedBox(height: 10.sp);
Widget mediumGap() => SizedBox(height: 15.sp);
Widget xGap() => SizedBox(height: 20.sp);
Widget xxGap() => SizedBox(height: 25.sp);
//// gap Ho
Widget xsmalHGap() => SizedBox(width: 5.sp);
Widget smalHGap() => SizedBox(width: 10.sp);
Widget mediumHGap() => SizedBox(width: 15.sp);
Widget xGapH() => SizedBox(width: 20.sp);
Widget xxGapH() => SizedBox(width: 25.sp);

//text styles
TextStyle get subTitleTextStyle =>
    const TextStyle(fontSize: 12, color: Colors.black38);
