import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greanleaf/shared/utils/app_colors.dart';

class FontWeightHelper {
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extralight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semibold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extrabold = FontWeight.w800;
}

class AppStyle {
  // Black Color Styles

  static TextStyle font32blacksemibold = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeightHelper.semibold,
    color: Colors.black,
  );
  static TextStyle font14blacksemibold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.semibold,
    color: Colors.black,
  );

  static TextStyle font20blacksemibold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static TextStyle font16blacksemibold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semibold,
    color: Colors.black,
  );
  static TextStyle font16blackmedium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: Colors.black,
  );
  static TextStyle font14blackmedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    color: Colors.black,
  );

  // Grey Color Styles

  static TextStyle font14Greyregular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: const Color(0xffA7A6A5),
  );
  static TextStyle font16Greyregular = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: const Color(0xffA7A6A5),
  );
  static TextStyle font14Greymedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: const Color(0xffA7A6A5),
  );
  static TextStyle font12Greymedium = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: const Color(0xff909090),
  );

  // Primary Color Styles
  static TextStyle font14Primarysemibold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: ColorManger.primaryColor,
  );

  // White Color Styles

  static TextStyle font14Whitesemibold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static TextStyle font14Whiteregular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  static TextStyle font16Whitesemibold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static TextStyle font18Whitesemibold = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
