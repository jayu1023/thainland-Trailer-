import 'package:flutter/material.dart';

import 'package:unity_ads_plugin/unity_ads_plugin.dart';

import '../CustomAds/CustomAds.dart';
import '../FaceBookAds/fbNativeAd.dart';
import '../adManager.dart';
import '../appLifeCyclecontroller.dart';
import '../googleAdx/googleNativeAd.dart';

class UnityAdsClass {
  static bool isIndLoaded = false;
  static bool isReewardAdLoaded = false;
  static loadInd() async {
    await UnityAds.load(
        placementId: Admanager.UBIndAd,
        onComplete: (p) {
          isIndLoaded = true;
        },
        onFailed: (x, error, message) {
          // Handle the error

          isIndLoaded = false;
        });
  }

  static loadReward() async {
    await UnityAds.load(
        placementId: Admanager.UBRewardAd,
        onComplete: (p) {
          isReewardAdLoaded = true;
        },
        onFailed: (x, error, message) {
          // Handle the error

          isReewardAdLoaded = false;
        });
  }

  static showInterAd() async {
    if (isIndLoaded) {
      await UnityAds.showVideoAd(placementId: Admanager.UBIndAd);
    } else {
      if (appLifeCycleController.adsConstant.adData?.indAd?.onFailed == true) {
        await FbAdClass.onFailedInd(appLifeCycleController
                .adsConstant.adData?.adIdConfig?.u?.onFailedInd ??
            "C");
      }
    }
    loadInd();
  }

  static showRewardAd(Future<void> cb) async {
    if (isIndLoaded) {
      await UnityAds.showVideoAd(
        placementId: Admanager.UBRewardAd,
        onComplete: (placementId) {
          cb;
        },
        onSkipped: (p) {
          cb;
        },
        onFailed: (placementId, error, errorMessage) {
          print(errorMessage);
          cb;
        },
      );
    } else {
      if (appLifeCycleController.adsConstant.adData?.rewardAd?.onFailed ==
          true) {
        await FbAdClass.onFailedReward(
            appLifeCycleController
                    .adsConstant.adData?.adIdConfig?.u?.onFailedReward ??
                "C",
            cb);
      } else {
        cb;
      }
    }
    loadReward();
  }

  static getBannerAd() {
    if (appLifeCycleController.adsConstant.adData?.adIdConfig?.u?.status ==
        true) {
      return UBannerAd();
    } else {
      return SizedBox.shrink();
    }
  }

  static Widget getNativAd() {
    if (appLifeCycleController.adsConstant.adData?.adIdConfig?.u?.status ==
        true) {
      return UNativeAd();
    } else {
      return SizedBox.shrink();
    }
  }
}

class UNativeAd extends StatefulWidget {
  String adSize = "Large";
  static String adUnitId = 'ca-app-pub-3940256099942544/2247696110';
  UNativeAd({super.key, this.adSize = "Large"});

  @override
  State<UNativeAd> createState() => _UNativeAdState();
}

class _UNativeAdState extends State<UNativeAd>
    with AutomaticKeepAliveClientMixin {
  late UnityBannerAd? nativeAd;

  bool bannerAdIsLoaded = false;
  bool isloading = false;
  bool isloadingDone = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // if (FbAds.key.currentWidget == null) {
      print("Not Null");

      loadNativeAd();
      // } else {
      //   print(FbAds.key.currentWidget);
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print("===>>>>BUILD CALLLED+>>>>>>>>>Repeat");

    // Check if ad failed to load and trigger fallback

    if (appLifeCycleController.adsConstant.adData?.adIdConfig?.u?.status ==
        true) {
      if (isloadingDone && !bannerAdIsLoaded) {
        return getFailedBannerAd(widget.adSize); // Trigger fallback logic here
      } else {
        return isloading
            ? Center(child: CircularProgressIndicator())
            : bannerAdIsLoaded
                ? nativeAd ?? SizedBox.shrink()
                : SizedBox.shrink();
      }
    } else {
      return SizedBox.shrink();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose

    if (bannerAdIsLoaded == true) {
      // nativeAd.dispose();

      print("GNativeAd Disposed");
    }
    super.dispose();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  void loadNativeAd() async {
    isloading = true;
    bannerAdIsLoaded = false;

    nativeAd = UnityBannerAd(
      size: BannerSize.leaderboard,
      placementId: Admanager.UBannerAd,
      onLoad: (placementId) {},
    );
    if (nativeAd != null) {
      isloading = false;
      isloadingDone = true;
      bannerAdIsLoaded = true;
      setState(() {});
    } else {
      isloading = false;
      isloadingDone = true;
      bannerAdIsLoaded = false;
      setState(() {});
    }

    // await nativeAd.load();
  }

  Widget getFailedBannerAd([String adSize = "Large"]) {
    if (appLifeCycleController.adsConstant.adData?.nativeAd?.onFailed == true) {
      switch (appLifeCycleController
          .adsConstant.adData?.adIdConfig?.u?.onFailedNative) {
        case "G":
          return gNativeAd();

        case "F":
          return FbBannerAd();
        // break;

        case "C":
          return CustomAds.getNativeAd();
        // break;
        case "U":
          return SizedBox.shrink();
        default:
          return CustomAds.getNativeAd();
      }
    } else {
      return SizedBox.shrink();
    }
  }

  getNativeAdAsync([String adSize = "Large"]) {
    return SizedBox();
  }
}

class UBannerAd extends StatefulWidget {
  String adSize = "Large";
  static String adUnitId = 'ca-app-pub-3940256099942544/2247696110';
  UBannerAd({super.key, this.adSize = "Large"});

  @override
  State<UBannerAd> createState() => _UBannerAdState();
}

class _UBannerAdState extends State<UBannerAd>
    with AutomaticKeepAliveClientMixin {
  late UnityBannerAd? nativeAd;

  bool bannerAdIsLoaded = false;
  bool isloading = false;
  bool isloadingDone = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // if (FbAds.key.currentWidget == null) {
      print("Not Null");

      loadNativeAd();
      // } else {
      //   print(FbAds.key.currentWidget);
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print("===>>>>BUILD CALLLED+>>>>>>>>>Repeat");

    // Check if ad failed to load and trigger fallback

    if (appLifeCycleController.adsConstant.adData?.adIdConfig?.u?.status ==
        true) {
      if (isloadingDone && !bannerAdIsLoaded) {
        return getFailedBannerAd(widget.adSize); // Trigger fallback logic here
      } else {
        return isloading
            ? Center(child: CircularProgressIndicator())
            : bannerAdIsLoaded
                ? nativeAd ?? SizedBox.shrink()
                : SizedBox.shrink();
      }
    } else {
      return SizedBox.shrink();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose

    if (bannerAdIsLoaded == true) {
      // nativeAd.dispose();

      print("GNativeAd Disposed");
    }
    super.dispose();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  void loadNativeAd() async {
    isloading = true;
    bannerAdIsLoaded = false;

    nativeAd = UnityBannerAd(
      placementId: Admanager.UBannerAd,
      onLoad: (placementId) {},
    );
    if (nativeAd != null) {
      isloading = false;
      isloadingDone = true;
      bannerAdIsLoaded = true;
      setState(() {});
    } else {
      isloading = false;
      isloadingDone = true;
      bannerAdIsLoaded = false;
      setState(() {});
    }

    // await nativeAd.load();
  }

  Widget getFailedBannerAd([String adSize = "Large"]) {
    if (appLifeCycleController.adsConstant.adData?.bannerAd?.onFailed == true) {
      switch (appLifeCycleController
          .adsConstant.adData?.adIdConfig?.u?.onFailedBanner) {
        case "G":
          return gBannerAd();

        case "F":
          return FbBannerAd();
        // break;

        case "C":
          return CustomAds.getBannerAd();
        // break;
        case "U":
          return SizedBox.shrink();
        default:
          return CustomAds.getBannerAd();
      }
    } else {
      return SizedBox.shrink();
    }
  }

  getNativeAdAsync([String adSize = "Large"]) {
    return SizedBox();
  }
}
