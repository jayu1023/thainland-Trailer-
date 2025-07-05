import 'dart:async';


import 'package:camaramanmodmelon/ads_copy/CustomAds/CustomAds.dart';
import 'package:camaramanmodmelon/ads_copy/FaceBookAds/fbNativeAd.dart';
import 'package:camaramanmodmelon/ads_copy/appLifeCyclecontroller.dart';
import 'package:camaramanmodmelon/ads_copy/googleAdx/googleNativeAd.dart';
import 'package:camaramanmodmelon/ads_copy/unityAds/unityAds.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';


import 'package:unity_ads_plugin/unity_ads_plugin.dart';

class NativeAdWidget extends StatefulWidget {
  final List<String> nativeAdArray;
  // final int nativeAdCounter;
  final String onFailedGoogle; // Specifies what ad to load on Google Ad failure
  final String
      onFailedFacebook; // Specifies what ad to load on Facebook Ad failure
  final String onFailedCustom; // Specifies what ad to load on Custom Ad failure

  NativeAdWidget({
    required this.nativeAdArray,
    // required this.nativeAdCounter,
    required this.onFailedGoogle,
    required this.onFailedFacebook,
    required this.onFailedCustom,
  });

  @override
  _NativeAdWidgetState createState() => _NativeAdWidgetState();
}

class _NativeAdWidgetState extends State<NativeAdWidget> {
  NativeAd? googleNativeAd;
  bool googleAdLoaded = false;
  bool facebookAdLoaded = false;
  bool showCustomWidget = false;

//0 = Google, 1 = Facebook, 2 = Custom
  int adType = 0;

  late FacebookNativeAd facebookNativeAd;

  int adIndex = 0; // To track which ad to load from the array

  @override
  void initState() {
    super.initState();
    if (widget.nativeAdArray.isNotEmpty) {
      if (appLifeCycleController.alternateNativeCounter ==
          appLifeCycleController.lengthNativeCounter) {
        appLifeCycleController.alternateNativeCounter = 0;
      }
      String ad = appLifeCycleController.adsConstant.adData?.nativeAd
              ?.adArray?[appLifeCycleController.alternateNativeCounter++] ??
          "";
      switch (ad) {
        case "G":
          adType = 0;
          break;
        case "F":
          adType = 1;
          break;
        case "C":
          adType = 2;
          break;
        case "U":
          adType = 3;
          break;
        default:
          adType = 0;
          break;
      }

      if (mounted) {
        setState(() {});
      }
      // _loadAd();
    }
  }

  // Load the appropriate ad based on the sequence in `nativeAdArray`
  //
  @override
  void dispose() {
    // googleNativeAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // If no ads are to be displayed, return SizedBox.shrink()
    if (widget.nativeAdArray.isEmpty) {
      return SizedBox.shrink();
    }

    // Show Google ad if loaded
    if (adType == 0) {
      return gNativeAd();
    }

    // Show Facebook ad if loaded
    else if (adType == 1) {
      return FbNativeAd();
    }

    // Show fallback widget if both ads fail
    else if (adType == 2) {
      return CustomAds.getNativeAd();
    } else if (adType == 3) {
      return UnityAdsClass.getNativAd();
    }

    // If ads are still loading, show a loading indicator
    else {
      return Center(child: CircularProgressIndicator());
    }
  }
}
