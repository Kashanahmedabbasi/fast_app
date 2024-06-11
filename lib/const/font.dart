import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

class AppFont {
  static final xsmalStyle =
      GoogleFonts.montserratTextTheme().titleSmall!.copyWith(fontSize: 10.sp);
  static final smalStyle =
      GoogleFonts.montserratTextTheme().titleSmall!.copyWith(
            fontSize: 12.sp,
          );
  static final medStyle = GoogleFonts.montserratTextTheme()
      .titleSmall!
      .copyWith(fontSize: 13.sp, fontWeight: FontWeight.bold);
  static final xStyle = GoogleFonts.montserratTextTheme().titleSmall!.copyWith(
        fontSize: 18.sp,
      );
  static final xxStyle = GoogleFonts.montserratTextTheme().titleSmall!.copyWith(
        fontSize: 22.sp,
      );
  //// color
  static final xsmalStyleWhite =
      GoogleFonts.montserratTextTheme().titleSmall!.copyWith(
            fontSize: 10.sp,
            color: Colors.white,
          );
  static final smalStyleWhite =
      GoogleFonts.montserratTextTheme().titleSmall!.copyWith(
            fontSize: 12.sp,
            color: Colors.white,
          );
  static final medStyleWhite =
      GoogleFonts.montserratTextTheme().titleSmall!.copyWith(
            fontSize: 16.sp,
            color: Colors.white,
          );
  static final xStyleWhite =
      GoogleFonts.montserratTextTheme().titleSmall!.copyWith(
            fontSize: 18.sp,
            color: Colors.white,
          );
  static final xxStyleWhite =
      GoogleFonts.montserratTextTheme().titleSmall!.copyWith(
            fontSize: 22.sp,
            color: Colors.white,
          );
  //// color
  static final xsmalStyleGrey =
      GoogleFonts.montserratTextTheme().titleSmall!.copyWith(
            fontSize: 10.sp,
            color: AppColors.darkGrey,
          );
  static final smalStyleGrey =
      GoogleFonts.montserratTextTheme().titleSmall!.copyWith(
            fontSize: 12.sp,
            color: AppColors.darkGrey,
          );
  static final medStyleGrey =
      GoogleFonts.montserratTextTheme().titleSmall!.copyWith(
            fontSize: 16.sp,
            color: AppColors.darkGrey,
          );
  static final xStyleGrey =
      GoogleFonts.montserratTextTheme().titleSmall!.copyWith(
            fontSize: 18.sp,
            color: AppColors.darkGrey,
          );
  static final xxStyleGrey =
      GoogleFonts.montserratTextTheme().titleSmall!.copyWith(
            fontSize: 22.sp,
            color: AppColors.darkGrey,
          );
  //// color
  static final xsmalStyleAppClr =
      GoogleFonts.montserratTextTheme().titleSmall!.copyWith(
            fontSize: 10.sp,
            color: AppColors.primary,
          );
  static final smalStyleAppClr =
      GoogleFonts.montserratTextTheme().titleSmall!.copyWith(
            fontSize: 12.sp,
            color: AppColors.primary,
          );
  static final medStyleAppClr =
      GoogleFonts.montserratTextTheme().titleSmall!.copyWith(
            fontSize: 16.sp,
            color: AppColors.primary,
          );
  static final xStyleAppClr =
      GoogleFonts.montserratTextTheme().titleSmall!.copyWith(
            fontSize: 18.sp,
            color: AppColors.primary,
          );
  static final xxStyleAppClr =
      GoogleFonts.montserratTextTheme().titleSmall!.copyWith(
            fontSize: 22.sp,
            color: AppColors.primary,
          );
}
