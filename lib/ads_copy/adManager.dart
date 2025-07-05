
import 'package:camaramanmodmelon/ads_copy/CustomAds/CustomAds.dart';
import 'package:camaramanmodmelon/ads_copy/FaceBookAds/fbNativeAd.dart';
import 'package:camaramanmodmelon/ads_copy/appLifeCyclecontroller.dart';
import 'package:camaramanmodmelon/ads_copy/bannerAdWidget.dart';
import 'package:camaramanmodmelon/ads_copy/googleAdx/gFixedNativeAd.dart';
import 'package:camaramanmodmelon/ads_copy/googleAdx/googleNativeAd.dart';
import 'package:camaramanmodmelon/ads_copy/googleAdx/smallNativeAd.dart';
import 'package:camaramanmodmelon/ads_copy/nativeAd.dart';
import 'package:camaramanmodmelon/ads_copy/unityAds/unityAds.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class Admanager {
  /*
    IndAdCounter varibales
  */

  static int IndCounter = 0;
  static int alternateIntCounter = 0;

  /*
    GOOGLE AD IDS
  */
  static String GNativeAd = "";
  static String GIndAd = "";
  static String GRewardAd = "";
  static String GbannerAd = "";
  static String GopenAd = "";

  /*
    FACEBOOK AD IDS
  */
  static String FBNativeAd = "";
  static String FBIndAd = "";
  static String FBRewardAd = "";
  static String FBannerAd = "";

  /*
    UNITY AD IDS
  */
  static String UNativeAd = "Banner_Android";
  static String UBIndAd = "Interstitial_Android";
  static String UBRewardAd = "Rewarded_Android";
  static String UBannerAd = "Banner_Android";

  static var RewardCounter = 0;

  static int alternateRewardCounter = 0;
  // static String GopenAd = "";
  Widget getNativeAd() {
    return appLifeCycleController.adsConstant.adData?.nativeAd?.status == true
        ? NativeAdWidget(
            nativeAdArray:
                appLifeCycleController.adsConstant.adData?.nativeAd?.adArray ??
                    ["G", "F", "C"],
            onFailedGoogle: appLifeCycleController
                    .adsConstant.adData?.adIdConfig?.g?.onFailedNative ??
                "F",
            onFailedFacebook: appLifeCycleController
                    .adsConstant.adData?.adIdConfig?.f?.onFailedNative ??
                "F",
            onFailedCustom: "C")
        : SizedBox.shrink();
  }

  static getIndAd() async {
    if (appLifeCycleController.adsConstant.adData?.indAd?.status == true) {
      if (IndCounter %
              (appLifeCycleController.adsConstant.adData?.indAd?.counter ??
                  3) ==
          0) {
        // reset counter
        if (alternateIntCounter ==
            appLifeCycleController.adsConstant.adData?.indAd?.adArray?.length) {
          alternateIntCounter = 0;
        }

        String ad = appLifeCycleController
                .adsConstant.adData?.indAd?.adArray?[alternateIntCounter++] ??
            "C";
        print(ad);
        switch (ad) {
          case "G":
            await googleRemainAds.showIndAd();
            break;

          case "F":
            await FbAdClass.showIndAd();
            break;

          case "U":
            await UnityAdsClass.showInterAd();
            break;
          case "C":
            await CustomAds.showInterAd();
            break;
          default:
            break;
        }
      }
      IndCounter = IndCounter + 1;
    }
  }

  static getRewardAd(Future<void> downloadMods) async {
    if (appLifeCycleController.adsConstant.adData?.rewardAd?.status == true) {
      // reset counter

      if (RewardCounter %
              (appLifeCycleController.adsConstant.adData?.rewardAd?.counter ??
                  1) ==
          0) {
        if (alternateRewardCounter >=
            (appLifeCycleController
                    .adsConstant.adData?.rewardAd?.adArray?.length ??
                1)) {
          alternateRewardCounter = 0;
        }

        String ad = appLifeCycleController.adsConstant.adData?.rewardAd
                ?.adArray?[alternateRewardCounter++] ??
            "C";

        switch (ad) {
          case "G":
            await googleRemainAds.showRewardAd(downloadMods);
            break;

          case "F":
            await FbAdClass.showRewardAd(downloadMods);
            break;

          case "U":
            await UnityAdsClass.showRewardAd(downloadMods);
            break;
          case "C":
            await CustomAds.showRewardAd(downloadMods);
            break;
          default:
            break;
        }
      }
      RewardCounter = RewardCounter + 1;
    } else {
      downloadMods;
    }
  }

  getBannerAd() {
    return appLifeCycleController.adsConstant.adData?.bannerAd?.status == true
        ? bannerAdWidget(
            ad: appLifeCycleController.adsConstant.adData?.bannerAd?.ad ?? "C",
          )
        : SizedBox.shrink();
  }

  getFixedNativeAd() {
    if (appLifeCycleController
            .adsConstant.adData?.nativeAd?.innerFixedAppEnabled ==
        true) {
      return Gfixednativead(
          ad: appLifeCycleController
                  .adsConstant.adData?.nativeAd?.innerFixedAd ??
              "C");
    } else {
      return SizedBox.shrink();
    }
  }

  static int alternatecounter = 0;
  static int onbackcounter = 0;

  static getBackOn() async {
    if (appLifeCycleController.adsConstant.adData?.onBak?.status == true) {
      if (onbackcounter %
              (appLifeCycleController.adsConstant.adData?.onBak?.counter ??
                  1) ==
          0) {
        if (alternatecounter ==
            (appLifeCycleController
                    .adsConstant.adData?.onBak?.adArray?.length ??
                2)) {
          alternatecounter = 0;
        }

        String ad = appLifeCycleController
                .adsConstant.adData?.onBak?.adArray?[alternatecounter++] ??
            "C";

        switch (ad) {
          case "G":
            await googleRemainAds.showIndAd();
            break;

          case "U":
            await UnityAdsClass.showInterAd();
            break;
          case "F":
            await FbAdClass.showIndAd();
            break;

          case "C":
            await CustomAds.showInterAd();
          default:
            return;
        }
      }
      onbackcounter = onbackcounter + 1;
    }
  }

  getSmallNativeAd() {
     return appLifeCycleController.adsConstant.adData?.nativeAd?.status == true
        ?smallNativeAd()
        : SizedBox.shrink();
  }
}
