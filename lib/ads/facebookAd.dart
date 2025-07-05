import 'dart:developer';

import 'package:camaramanmodmelon/ads_copy/adManager.dart';
import 'package:camaramanmodmelon/ads_copy/appLifeCyclecontroller.dart';
import 'package:facebook_audience_network/ad/ad_native.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Facebook {
  static List<String> native_ids = [
    "806443504242872_806444664242756",
    "806443504242872_806444520909437",
    "806443504242872_806444427576113",
    // "806443504242872_806497640904125",
    // "806443504242872_838897967664092"
  ];
  static int nativeCounter = 0;
  static int bannerCounter = 0;
  static bool _isInterstitialAdLoaded = false;

  static String InterAdId = kDebugMode
      ? "IMG_16_9_LINK#806443504242872_806444784242744"
      : "806443504242872_806444784242744";
  static List<String> bannerAdId = [
    "806443504242872_806444377576118",
    "806443504242872_806444307576125",
    "806443504242872_806444267576129"
  ];

  static getNativeAd() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 0,
        color: Colors.grey.withOpacity(0.2),
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Text("Reserve For Ads Space"),
            SizedBox(height: 250,width: Get.width,),
             appLifeCycleController.adsConstant.adData?.nativeAd?.screens?.contains(2)==true? Admanager().getNativeAd():SizedBox(height: 250,width: Get.width,)
            /*
            ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: FacebookNativeAd(
                placementId: native_ids[nativeCounter],
                // placementId: kDebugMode
                //     ? "IMG_16_9_LINK#${native_ids[nativeCounter]}"
                //     : native_ids[nativeCounter],
                keepAlive: true,
                adType: NativeAdType.NATIVE_AD_VERTICAL,
                bannerAdSize: NativeBannerAdSize.HEIGHT_50,
                width: double.infinity,
                height: 250,
                backgroundColor: Colors.white,
                titleColor: Colors.black,
                descriptionColor: Colors.black,
                buttonColor: Colors.black,
                buttonTitleColor: Colors.white,
                buttonBorderColor: Colors.white,
                listener: (result, value) {
                  if (nativeCounter == native_ids.length - 1) {
                    nativeCounter = 0;
                  } else {
                    nativeCounter = nativeCounter + 1;
                  }
                  print("Native Ad: $result --> $value");
                },
                keepExpandedWhileLoading: true,
                expandAnimationDuraion: 00,
              ),
            ),
          */
          ],
        ),
      ),
    );
  }

  static getBannerAd() {
    log("banner ad......");
    return FacebookBannerAd(
      bannerSize: BannerSize.STANDARD,
      keepAlive: true,
      placementId: kDebugMode
          ? "IMG_16_9_LINK#${bannerAdId[bannerCounter]}"
          : bannerAdId[bannerCounter],
      listener: (p0, p1) {
        if (bannerCounter == bannerAdId.length - 1) {
          bannerCounter = 0;
        } else {
          bannerCounter = bannerCounter + 1;
        }
      },
    );
  }

  static loadInd() async {
    await FacebookInterstitialAd.loadInterstitialAd(
      placementId: InterAdId,
      listener: (result, value) async {
        if (result == InterstitialAdResult.LOADED) {
          _isInterstitialAdLoaded = true;
          log("ad loded...");
        }

        if (result == InterstitialAdResult.DISMISSED &&
            value["invalidated"] == true) {
          _isInterstitialAdLoaded = false;
          await loadInd();
        }
      },
    );
  }

  static showInd() async {
    if (_isInterstitialAdLoaded == true) {
      await FacebookInterstitialAd.showInterstitialAd();
    } else {
      log("Interstial Ad not yet loaded!");
      await loadInd();
    }
  }

  static init() async {
    await FacebookAudienceNetwork.init(
        testingId: "e72cd241-346e-48be-9911-d9605b30a8a6");
  }
}
