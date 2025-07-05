import 'dart:async';


import 'package:camaramanmodmelon/ads_copy/FaceBookAds/fbNativeAd.dart';
import 'package:camaramanmodmelon/ads_copy/appLifeCyclecontroller.dart';
import 'package:camaramanmodmelon/ads_copy/googleAdx/googleNativeAd.dart';
import 'package:camaramanmodmelon/ads_copy/unityAds/unityAds.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';



class bannerAdWidget extends StatefulWidget {
  // final List<String> bannerAdArray;
  final String ad;
  // final int nativeAdCounter;
  // final String onFailedGoogle; // Specifies what ad to load on Google Ad failure
  // final String
  //     onFailedFacebook; // Specifies what ad to load on Facebook Ad failure
  // final String onFailedCustom; // Specifies what ad to load on Custom Ad failure

  bannerAdWidget({
    // required this.nativeAdArray,
    // required this.nativeAdCounter,
    required this.ad,
    // required this.onFailedFacebook,
    // required this.onFailedCustom,
  });

  @override
  _bannerAdWidgetState createState() => _bannerAdWidgetState();
}

class _bannerAdWidgetState extends State<bannerAdWidget> {
//0 = Google, 1 = Facebook, 2 = Custom , 3 =U
  int adType = 0;

  // To track which ad to load from the array

  @override
  void initState() {
    super.initState();
    if (widget.ad.isNotEmpty &&
        (appLifeCycleController.adsConstant.adData?.bannerAd ?? true) == true) {
      "";
      switch (widget.ad) {
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
          adType = 2;
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
    if (widget.ad.isEmpty &&
        (appLifeCycleController.adsConstant.adData?.bannerAd?.status) ==
            false) {
      return SizedBox.shrink();
    }

    // Show Google ad if loaded
    if (adType == 0) {
      return gBannerAd();
    }

    // Show Facebook ad if loaded
    else if (adType == 1) {
      return FbBannerAd();
    }

    // Show fallback widget if both ads fail
    else if (adType == 2) {
      return Center(
          child: Text(
        'custom',
        style: TextStyle(color: Colors.black),
      ));
    } else if (adType == 3) {
      return UnityAdsClass.getBannerAd();
    }

    // If ads are still loading, show a loading indicator
    else {
      return Center(child: CircularProgressIndicator());
    }
  }
}
