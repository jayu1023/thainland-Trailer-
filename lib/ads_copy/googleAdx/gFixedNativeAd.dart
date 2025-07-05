import 'dart:async';


import 'package:camaramanmodmelon/ads_copy/googleAdx/googleNativeAd.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';


import 'package:unity_ads_plugin/unity_ads_plugin.dart';

import '../CustomAds/CustomAds.dart';
import '../FaceBookAds/fbNativeAd.dart';
import '../unityAds/unityAds.dart';

class Gfixednativead extends StatefulWidget {
  // final int nativeAdCounter;
  // Specifies what ad to load on Facebook Ad failure
  final String ad; // Specifies what ad to load on Custom Ad failure

  Gfixednativead({required this.ad});

  @override
  _GfixednativeadState createState() => _GfixednativeadState();
}

class _GfixednativeadState extends State<Gfixednativead> {
  // NativeAd? googleNativeAd;
  // bool googleAdLoaded = false;
  // bool facebookAdLoaded = false;
  // bool showCustomWidget = false;

//0 = Google, 1 = Facebook, 2 = Custom
  int adType = 0;

  late FacebookNativeAd facebookNativeAd;

  int adIndex = 0; // To track which ad to load from the array

  @override
  void initState() {
    super.initState();

    String ad = widget.ad;
    "G";
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
