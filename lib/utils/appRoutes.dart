import 'package:camaramanmodmelon/screens/detailed/controller/detaildBinding.dart';
import 'package:camaramanmodmelon/screens/detailed/detaildScreen.dart';
import 'package:camaramanmodmelon/screens/home/controller/homeBinding.dart';
import 'package:camaramanmodmelon/screens/home/homeScreen.dart';
import 'package:camaramanmodmelon/screens/splash/controller/splashBinding.dart';
import 'package:camaramanmodmelon/screens/splash/splashScreen.dart';
import 'package:camaramanmodmelon/utils/appRoutesString.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes {
  //HoneBinding
  static Widget homeRouteWidget = HomeScreen();
  static Widget splashRouteWidget = SplashScreen();
  static Widget detaildRouteWidget = DetaildScreen();

  //bindings
  static Bindings homeBinding = HomeBinding();
  static Bindings splashBinding = SplashBinding();
  static Bindings detaildBinding = DetaildBindning();

  List<GetPage> routesPages = [
    GetPage(
        name: AppRoutesString.homeRouteName,
        page: () {
          return AppRoutes.homeRouteWidget;
        },
        binding: AppRoutes.homeBinding),
    GetPage(
      name: AppRoutesString.splashRouteName,
      page: () {
        return AppRoutes.splashRouteWidget;
      },
      binding: AppRoutes.splashBinding,
    ),
    GetPage(
        name: AppRoutesString.detaildRouteName,
        page: () {
          return AppRoutes.detaildRouteWidget;
        },
        binding: AppRoutes.detaildBinding,
        parameters: {'image': "0", "downloadFile": "", "name": ""})
  ];
}
