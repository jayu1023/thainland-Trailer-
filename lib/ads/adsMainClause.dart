import 'package:camaramanmodmelon/ads/facebookAd.dart';
import 'package:camaramanmodmelon/ads/interAdConstant.dart';
import 'package:camaramanmodmelon/ads/nativeAdConstnat.dart';
import 'package:camaramanmodmelon/ads/unityAdModel.dart';
import 'package:camaramanmodmelon/api/api.dart';
import 'package:camaramanmodmelon/utils/ads.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';

/**
 * 
 * get Value constant from ad Class inter ad and native ad
 */

class AdMainClause {
  static init() async {
    await MobileAds.instance.initialize();
    await UnityAdModel.initUnityAd();
    await Facebook.init();
  }

  static initAllLoaderAd() async {
    await Facebook.loadInd();
    await Ads.loadUnityInt();
    await Ads.loadUnityRewardedAd();
    await Apis().adsIdData();
    // await Apis().AdsIDDATA();
  }

  static getBannerAd() {
    return Facebook.getBannerAd();
  }

  static getNativeAd(int index) {
    if (index % NativeAdConstant.nativeAdCounter == 0) {
      return Facebook.getNativeAd();
    } else {
      return SizedBox();
    }
  }

  static getInterAd(Callback cb) {
    if (InterAdconstant.clickCounter == InterAdconstant.interAdCounter) {
      InterAdconstant.clickcounter(true);
      Ads.showUnityInt(cb);
    } else {
      InterAdconstant.clickcounter(false);
      cb.call();
    }
  }
}
