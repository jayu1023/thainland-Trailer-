

import 'package:camaramanmodmelon/Colors.dart';
import 'package:camaramanmodmelon/ads_copy/FaceBookAds/fbNativeAd.dart';
import 'package:camaramanmodmelon/ads_copy/adManager.dart';
import 'package:camaramanmodmelon/ads_copy/appLifeCyclecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sizer/sizer.dart';

class smallNativeAd extends StatefulWidget {
  const smallNativeAd({
    super.key,
  });

  @override
  State<smallNativeAd> createState() => _gNativeAdState();
}

class _gNativeAdState extends State<smallNativeAd> {
  bool googleAdLoaded = false;
  late NativeAd googleNativeAd;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAd();
  }

  @override
  Widget build(BuildContext context) {
    return googleAdLoaded
        ? Container(
          // height: 100
          // height: 120,
          constraints: BoxConstraints(
            maxHeight: 120,
            maxWidth: Get.width,
            minHeight: Get.height*0.05,minWidth: Get.width
          ),
          // color: Colors.black,
          // width: Get.width,
           alignment: Alignment.center,
 
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AdWidget(ad: googleNativeAd),
            ),
          )
        : onFailedAd(appLifeCycleController
                .adsConstant.adData?.adIdConfig?.g?.onFailedNative ??
            "F");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    googleNativeAd?.dispose();
  }

  void loadAd() {
    googleNativeAd = NativeAd(
      adUnitId:
          Admanager.GNativeAd, // Replace with your AdMob native ad unit ID
      // factoryId: 'adFactoryExample',
      request: AdRequest(),
      
      nativeAdOptions: NativeAdOptions(
            
          mediaAspectRatio: MediaAspectRatio.landscape,
        videoOptions: VideoOptions()
      ),
      nativeTemplateStyle: NativeTemplateStyle(
        cornerRadius: 20,
        callToActionTextStyle: NativeTemplateTextStyle(
          textColor: myColors.iconColor,
          size: 11.sp,
          backgroundColor: myColors.lightbckgroundColor,
          
        ),
        tertiaryTextStyle:NativeTemplateTextStyle(
            size: 11.sp,
          style:NativeTemplateFontStyle.bold
        ) ,

      secondaryTextStyle: NativeTemplateTextStyle(
          size: 11.sp,
          style:NativeTemplateFontStyle.bold
        ),
        primaryTextStyle: NativeTemplateTextStyle(
            size: 13.sp,
          style:NativeTemplateFontStyle.bold
        ),
        templateType: TemplateType.small,
      ),
      listener: NativeAdListener(
        onAdLoaded: (_) {
          print("AD: Google Native Loaded");

          setState(() {
            googleAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          print("AD: Google Native Failed $error");

          ad.dispose();

          // Move to the next ad on failure
        },
      ),
    )..load();
  }

  onFailedAd([String s = "F"]) {
    if (s == "F") {
      return FbNativeAd();
    } else if (s == "G") {
      return SizedBox.shrink();
    } else if (s == "C") {
      return Text("Cstom");
    } else {
      return SizedBox.shrink();
    }
  }
}
