import 'package:camaramanmodmelon/ads/adsMainClause.dart';

import 'package:camaramanmodmelon/model/apiModel.dart';
import 'package:camaramanmodmelon/screens/home/controller/HomeController.dart';
import 'package:camaramanmodmelon/utils/ads.dart';
import 'package:camaramanmodmelon/utils/adsParameter.dart';
import 'package:camaramanmodmelon/utils/apiEndPoints.dart';
import 'package:camaramanmodmelon/utils/appColors.dart';
import 'package:camaramanmodmelon/utils/navigation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:sizer/sizer.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ItemCard extends GetView<HomeController> {
  // int index;
  String image;
  ApiModel model;
  ItemCard({super.key, required this.image, required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        EasyLoading.show();
        AdMainClause.getInterAd(() {
          EasyLoading.dismiss();
          Navigation.navigateToDetaildScreen(
            model,
            false,
            model.name.toString(),
            model.download.toString(),
            model.images.toString(),
          );
        });
        // if (Inte.currentClickCounterInter %
        //         AppAdsParameter.countNative ==
        //     0) {
        //   Ads.showUnityInt(() {
        //     Navigation.navigateToDetaildScreen(
        //       model,
        //       false,
        //       model.name.toString(),
        //       model.download.toString(),
        //       model.images.toString(),
        //     );
        //   });
        // } else {
        //   Navigation.navigateToDetaildScreen(
        //     model,
        //     false,
        //     model.name.toString(),
        //     model.download.toString(),
        //     model.images.toString(),
        //   );
        // }
        // if (AppAdsParameter.currentClickCounterInter ==
        //     AppAdsParameter.countNative) {
        //   AppAdsParameter.currentClickCounterInter = 0;
        // } else {
        //   AppAdsParameter.currentClickCounterInter =
        //       AppAdsParameter.currentClickCounterInter + 1;
        // }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 15.sp,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.sp)),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Hero(
                tag: image,
                child: Container(
                  width: 100.w,
                  height: 25.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: CachedNetworkImageProvider(
                              "${ApiEndPoints.baseImageUrl}${image}"))),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                height: 5.h,
                width: 100.w,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    controller.mods[controller.currentIndex.value].name
                        .toString(),
                    style:
                        TextStyle(color: AppColors.TextColor, fontSize: 16.sp),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                  gradient: LinearGradient(
                      colors: [Color(0xff2F3C7E), Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
