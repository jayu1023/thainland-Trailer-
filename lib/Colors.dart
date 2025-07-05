import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class myColors {
  static final myColors _appClass = myColors._myConstructer();

  factory myColors() => _appClass;

  myColors._myConstructer();

  static const Color iconColor = Color(0xff442C2E);
  Color blueColor = Color(0xff2988FF);
  Color lightTextColor = Color(0xff442C2E).withValues(alpha: 20.0);
  Color lightBlueColor = Color(0xffF4F8FB);
  Color blackColor = Color(0xff001B3D);
  Color greyColor = Color(0xff442C2E);

  static var lightbckgroundColor = Color(0xffFEEAE6);

  static var appbarColor = Color(0xffFEDBD0);

  // TextStyle heading_Style = TextStyle(
  //     fontSize: 63.sp,
  //     fontWeight: FontWeight.w600,
  //     color:);
  // get heading_Style => TextStyle(
  //     fontSize: Get.width > 500 ? 35.sp : 40.sp,
  //     fontWeight: FontWeight.w600,
  //     color: myColors.iconColor);
  // get heading_Style_2 => TextStyle(
  //     fontSize: Get.width > 500 ? 35.spMax : 20.spMax,
  //     fontWeight: FontWeight.w500,
  //     color: myColors.iconColor);
}
