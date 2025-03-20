import 'package:camaramanmodmelon/api/api.dart';
import 'package:camaramanmodmelon/model/apiModel.dart';
import 'package:camaramanmodmelon/utils/apiEndPoints.dart';
import 'package:camaramanmodmelon/utils/appColors.dart';

import 'package:camaramanmodmelon/utils/appStrings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';

class HomeController extends GetxController {
  RxList<ApiModel> mods = <ApiModel>[].obs;
  ScrollController scCon = ScrollController();
  RxInt currentIndex = 0.obs;
  RxInt currentValue = 0.obs;
  RxBool isDataEnd = false.obs;
  late AdvancedDrawerController advancedDrawerController;
  RxBool visibleSlider = true.obs;
  RxBool isBottom = false.obs;
  RxBool isTop = true.obs;
  RxList<String> sliderData = <String>[
    "${ApiEndPoints.baseImageUrl}1.jpg",
    "${ApiEndPoints.baseImageUrl}5.jpg",
    "${ApiEndPoints.baseImageUrl}7.jpg",
    "${ApiEndPoints.baseImageUrl}8.jpg",
    "${ApiEndPoints.baseImageUrl}9.jpg",
    "${ApiEndPoints.baseImageUrl}10.jpg",
    "${ApiEndPoints.baseImageUrl}3.jpg",
    "${ApiEndPoints.baseImageUrl}2.jpg",
  ].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    scCon.addListener(() {
      if (scCon.position.atEdge) {
        if (scCon.position.pixels != 0) {
          isBottom.value = true;
          isTop.value = false;
          if (isDataEnd.value == true) {
            Fluttertoast.showToast(
                msg: "All Data is Loaded!!",
                toastLength: Toast.LENGTH_SHORT,
                fontSize: 16.0);
          } else {
            getData();
          }
        } else {
          isTop.value = true;
          isBottom.value = false;
        }
      } else {
        isTop.value = false;
        // isBottom.value=
      }
    });
    init();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    // advancedDrawerController.dispose();
  }

  void init() async {
    // listenScrolling();

    getData();
    initReview();
    advancedDrawerController = AdvancedDrawerController();

    // if (AppCommons.rateMyApp.shouldOpenDialog) {
    //   AppCommons.rateMyApp
    //       .showRateDialog(AppCommons.navigatorKey.currentState!.context);
    // }
  }

  getData() async {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.chasingDots
      ..userInteractions = false
      ..backgroundColor = AppColors.BlueColor
      ..indicatorColor = AppColors.TextColor;
    EasyLoading.show();
    List<ApiModel> data = await Apis()
        .getSubData(type: AppStrings.typeX, pack: 0, from: currentValue.value);
    if (data.isEmpty) {
      isDataEnd.value = true;
    } else {
      if (mods.isEmpty) {
        mods.value = data;
      } else {
        mods.addAll(data);
        update();
      }
      currentValue.value += 4;
    }
    EasyLoading.dismiss();
  }

  void listenScrolling() {}

  void initReview() async {
    final InAppReview inAppReview = InAppReview.instance;

    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    }
  }
}
