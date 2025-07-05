
import 'package:camaramanmodmelon/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sizer/sizer.dart';


import '../CustomAds/CustomAds.dart';
import '../FaceBookAds/fbNativeAd.dart';
import '../adManager.dart';
import '../appLifeCyclecontroller.dart';
import '../unityAds/unityAds.dart';

// import 'package:mapgmod/ads/adModel.dart';

class gNativeAd extends StatefulWidget {
  const gNativeAd({
    super.key,
  });

  @override
  State<gNativeAd> createState() => _gNativeAdState();
}

class _gNativeAdState extends State<gNativeAd> {
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
        ? ConstrainedBox(
           constraints: const BoxConstraints(
    minWidth: 320, // minimum recommended width
    minHeight: 320, // minimum recommended height
    maxWidth: 400,
    maxHeight: 400,
  )
 ,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AdWidget(ad: googleNativeAd),
              ),
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
      request: AdRequest(
        extras: appLifeCycleController.isPersonalizedAds ? null : {'npa': '1'}
      ),
      nativeAdOptions: NativeAdOptions(
        // mediaAspectRatio: MediaAspectRatio.portrait
      ),
      nativeTemplateStyle: NativeTemplateStyle(
        cornerRadius: 20,
        callToActionTextStyle: NativeTemplateTextStyle(
          textColor: myColors.iconColor,
          backgroundColor: myColors.lightbckgroundColor,
          
        ),
        tertiaryTextStyle:NativeTemplateTextStyle(
          style:NativeTemplateFontStyle.bold
        ) ,

      secondaryTextStyle: NativeTemplateTextStyle(
          style:NativeTemplateFontStyle.bold
        ),
        primaryTextStyle: NativeTemplateTextStyle(
          style:NativeTemplateFontStyle.bold
        ),
        templateType: TemplateType.medium,
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

class gBannerAd extends StatefulWidget {
  const gBannerAd({
    super.key,
  });

  @override
  State<gBannerAd> createState() => _gBannerAdState();
}

class _gBannerAdState extends State<gBannerAd> {
  bool googleAdLoaded = false;
  late BannerAd googleBannerAd;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAd();
  }

  @override
  Widget build(BuildContext context) {
    return googleAdLoaded &&
            appLifeCycleController.adsConstant?.adData?.adIdConfig?.g?.status ==
                true
        ? Container(
            height: 7.h,
            width: 100.w,
            child: AdWidget(ad: googleBannerAd),
          )
        : onFailedAd(appLifeCycleController
                .adsConstant.adData?.adIdConfig?.g?.onFailedBanner ??
            "F");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    googleBannerAd?.dispose();
  }

  void loadAd() {
    googleBannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: Admanager.GbannerAd,
        listener: BannerAdListener(
          onAdFailedToLoad: (ad, error) {
            googleAdLoaded = false;
            ad.dispose();
            setState(() {});
            print(error);
          },
          onAdLoaded: (ad) {
            print("AD: Google Native Loaded");
            googleAdLoaded = true;
            setState(() {});
          },
        ),
        request: AdRequest(
          extras: appLifeCycleController.isPersonalizedAds ? null : {'npa': '1'}
        ))
      ..load();
  }

  onFailedAd([String s = "F"]) {
    if (appLifeCycleController.adsConstant.adData?.bannerAd?.onFailed == true) {
      if (s == "F") {
        return FbBannerAd();
      } else if (s == "G") {
        return SizedBox.shrink();
      } else if (s == "C") {
        return CustomAds.getBannerAd();
      } else if (s == "U") {
        return UnityAdsClass.getBannerAd();
      } else {
        return SizedBox.shrink();
      }
    } else {
      return SizedBox.shrink();
    }
  }
}

class googleRemainAds {
  static bool isIndLoaded = false;
  static bool isRewadAdLoaded = false;
  // static String IndAd = "";
  // static String rewardAd = "";
  static InterstitialAd? _interstitialAd;
  static RewardedAd? _rewardedAd;

  
  
  static loadIndaD() async {
    InterstitialAd.load(
        adUnitId: Admanager.GIndAd,
        request:  AdRequest(
          extras: appLifeCycleController.isPersonalizedAds ? null : {'npa': '1'}
        ),
        adLoadCallback: InterstitialAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (ad) {
            debugPrint('$ad loaded.');
            // Keep a reference to the ad so you can show it later.
            _interstitialAd = ad;

            isIndLoaded = true;
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            debugPrint('InterstitialAd failed to load: $error');
          },
        ));
  }

  static loadRewardAd() async {
    RewardedAd.load(
        adUnitId: Admanager.GRewardAd,
        request: AdRequest(
          extras: appLifeCycleController.isPersonalizedAds ? null : {'npa': '1'}
        ),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (ad) {
            debugPrint('$ad loaded.');
            // Keep a reference to the ad so you can show it later.
            _rewardedAd = ad;

            isRewadAdLoaded = true;
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            isRewadAdLoaded = false;
            debugPrint('RewardedAd failed to load: $error');
          },
        ));
  }

  static showIndAd() async {
    if (_interstitialAd != null && isIndLoaded == true) {
      _interstitialAd?.show();
    } else {
      if (appLifeCycleController.adsConstant.adData?.indAd?.onFailed == true) {
        await FbAdClass.onFailedInd(appLifeCycleController
                .adsConstant.adData?.adIdConfig?.g?.onFailedInd ??
            "F");
      }
    }

    loadIndaD();
  }

  static showRewardAd(Future<void> cb) async {
    if (_rewardedAd != null && isRewadAdLoaded == true) {
      _rewardedAd?.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem rewardItem) {
          cb;
          // Reward the user for watching an ad.
        },
      );
    } else {
      if (appLifeCycleController.adsConstant.adData?.rewardAd?.onFailed ==
          true) {
        await FbAdClass.onFailedReward(
            appLifeCycleController
                    .adsConstant.adData?.adIdConfig?.g?.onFailedReward ??
                "F",
            cb);
      } else {
        cb;
      }
    }

    loadRewardAd();
  }
}
