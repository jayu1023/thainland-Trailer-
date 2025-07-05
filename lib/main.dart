import 'package:camaramanmodmelon/ads/adsMainClause.dart';
import 'package:camaramanmodmelon/ads_copy/appLifeCyclecontroller.dart';
import 'package:camaramanmodmelon/api/api.dart';
import 'package:camaramanmodmelon/utils/ads.dart';
import 'package:camaramanmodmelon/utils/appColors.dart';

import 'package:camaramanmodmelon/utils/appRoutes.dart';
import 'package:camaramanmodmelon/utils/appRoutesString.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:sizer/sizer.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Get.put(appLifeCycleController(),permanent: true).callApi();
  await AdMainClause.init();

  runApp(Sizer(builder: (context, orientation, deviceType) {
    return GetMaterialApp(
      theme: ThemeData(primarySwatch: mcgpalette0),
      getPages: AppRoutes().routesPages,
      // navigatorKey: AppCommons.navigatorKey,
      builder: EasyLoading.init(),
      // home: AppRoutes.s,
      initialRoute: AppRoutesString.splashRouteName,
      initialBinding: AppRoutes.splashBinding,
    );
  }));
}
