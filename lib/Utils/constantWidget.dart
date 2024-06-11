import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

import '../const/color.dart';
import '../const/const_variable.dart';

showSnackBar(msg) => Fluttertoast.showToast(
      msg: msg.toString(),
      toastLength: Toast.LENGTH_SHORT,
    );
Widget shimmer() => Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: EdgeInsets.only(bottom: 15.h, top: 5.h),
        height: MediaQuery.of(navigatorKey.currentContext!).size.height * 0.27,
        width: MediaQuery.of(navigatorKey.currentContext!).size.width - 25,
        child: const Card(),
      ),
    );

Widget vDivider = const VerticalDivider(
  color: AppColors.greyLight,
  endIndent: 1,
  indent: 1,
);
