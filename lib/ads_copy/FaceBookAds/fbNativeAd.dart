import 'dart:async';

import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../CustomAds/CustomAds.dart';
import '../adManager.dart';
import '../appLifeCyclecontroller.dart';
import '../googleAdx/googleNativeAd.dart';
import '../unityAds/unityAds.dart';

/*// class FBNativeAd extends StatefulWidget {
//   const FBNativeAd({super.key});

//   @override
//   State<FBNativeAd> createState() => _FBNativeAdState();
// }

// class _FBNativeAdState extends State<FBNativeAd> {
//   late FacebookNativeAd? fbnatriveAd;
//   bool facebookAdLoaded = false;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       // if (FbAds.key.currentWidget == null) {
//       print("Not Null");

//       fbnatriveAd = FacebookNativeAd(
//         placementId: kDebugMode
//             ? "IMG_16_9_APP_INSTALL#1114109403537309_1114110370203879"
//             : "722315089883347_722316886549834",
//         adType: NativeAdType.NATIVE_AD,
//         listener: (p0, p1) {
//           print("==>>>>${p0}");
//           if (p0 == NativeAdResult.LOADED) {
//             print("AD: FB Native Loaded");
//             setState(() {
//               facebookAdLoaded = true;
//             });
//           } else {
//             print("AD: FB Native error");
//             setState(() {
//               facebookAdLoaded = false;
//             });
//             // _loadNextAd(onFailure: widget.onFailedFacebook);
//           }
//           // completer.complete();
//         },
//       );
//       // } else {
//       //   print(FbAds.key.currentWidget);
//       // }
//     });
//     // loadAd();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return facebookAdLoaded ? fbnatriveAd : OnFailed("C");
//   }

//   loadAd() async {
//     Completer completer = Completer();

//     fbnatriveAd = FacebookNativeAd(
//       placementId: kDebugMode
//           ? "IMG_16_9_APP_INSTALL#1114109403537309_1114110370203879"
//           : "722315089883347_722316886549834",
//       adType: NativeAdType.NATIVE_AD,
//       listener: (p0, p1) {
//         print("==>>>>${p0}");
//         if (p0 == NativeAdResult.LOADED) {
//           print("AD: FB Native Loaded");
//           setState(() {
//             facebookAdLoaded = true;
//           });
//         } else {
//           print("AD: FB Native error");
//           setState(() {
//             facebookAdLoaded = false;
//           });
//           // _loadNextAd(onFailure: widget.onFailedFacebook);
//         }
//         completer.complete();
//       },
//     );

//     if (mounted) {
//       setState(() {});
//     }
//   }

//   OnFailed(String s) {
//     if (s == "F") {
//       return FBNativeAd();
//     } else if (s == "G") {
//       return SizedBox.shrink();
//     } else if (s == "C") {
//       return Text("Cstom");
//     } else {
//       return SizedBox.shrink();
//     }
//   }
// }*/

class FbNativeAd extends StatefulWidget {
  String adSize = "Large";
  static String adUnitId = 'ca-app-pub-3940256099942544/2247696110';
  FbNativeAd({super.key, this.adSize = "Large"});

  @override
  State<FbNativeAd> createState() => _FbNativeAdState();
}

class _FbNativeAdState extends State<FbNativeAd>
    with AutomaticKeepAliveClientMixin {
  late FacebookNativeAd? nativeAd;

  bool nativeAdIsLoaded = false;
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

    if (appLifeCycleController.adsConstant.adData?.adIdConfig?.f?.status ==
        true) {
      if (isloadingDone && !nativeAdIsLoaded) {
        return getFailedNativeAd(widget.adSize); // Trigger fallback logic here
      } else {
        return isloading
            ? Center(child: CircularProgressIndicator())
            : nativeAdIsLoaded
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

    if (nativeAdIsLoaded == true) {
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
    nativeAdIsLoaded = false;

    nativeAd = FacebookNativeAd(
      // key: FbAds.key,
      placementId: kDebugMode
          ? "IMG_16_9_APP_INSTALL#${Admanager.FBNativeAd}"
          : Admanager.FBNativeAd,
      adType: widget.adSize == "Large"
          ? NativeAdType.NATIVE_AD
          : NativeAdType.NATIVE_BANNER_AD,
      width: double.infinity,
      height: 250,
      backgroundColor: Colors.blue,
      titleColor: Colors.white,
      descriptionColor: Colors.white,
      buttonColor: Colors.deepPurple,
      buttonTitleColor: Colors.white,
      buttonBorderColor: Colors.white,
      keepAlive:
          false, //set true if you do not want adview to refresh on widget rebuild
      keepExpandedWhileLoading:
          false, // set false if you want to collapse the native ad view when the ad is loading
      expandAnimationDuraion:
          300, //in milliseconds. Expands the adview with animation when ad is loaded
      listener: (result, value) {
        print("helllooo");
        if (result == NativeAdResult.ERROR) {
          nativeAdIsLoaded = false;
          isloading = false;
          isloadingDone = true;
        }
        setState(() {});
        if (result == NativeAdResult.LOADED) {
          nativeAdIsLoaded = true;
          isloading = false;
          isloadingDone = true;
          setState(() {});
        }
        print("Fb Native Ad: $result --> $value");
      },
    );

    if (nativeAd != null) {
      isloading = false;
      isloadingDone = true;
      nativeAdIsLoaded = true;
      setState(() {});
    } else {
      isloading = false;
      isloadingDone = true;
      nativeAdIsLoaded = false;
      setState(() {});
    }

    // await nativeAd.load();
  }

  Widget getFailedNativeAd([String adSize = "Large"]) {
    switch (appLifeCycleController
        .adsConstant.adData?.adIdConfig?.f?.onFailedNative) {
      case "G":
        return gNativeAd();

      case "F":
        return SizedBox.shrink();
      // break;

      case "C":
        return CustomAds.getNativeAd();
      // break;

      default:
        return CustomAds.getNativeAd();
    }
  }

  getNativeAdAsync([String adSize = "Large"]) {
    return SizedBox();
  }
}

class FbAdClass {
  static bool isIndLoaded = false;
  static bool isRewadAdLoaded = false;
  // static String IndAd = ;
  // static String rewardAd = "";
  static FacebookInterstitialAd? _interstitialAd;
  static FacebookRewardedVideoAd? _rewardedAd;

  static loadIndaD() async {
    FacebookInterstitialAd.loadInterstitialAd(
      placementId: Admanager.FBIndAd,
      listener: (result, value) {
        if (result == InterstitialAdResult.LOADED) {
          isIndLoaded = true;
          // _interstitialAd?.show();
        }
      },
    );
  }

  static loadRewardAd() async {
    FacebookRewardedVideoAd.loadRewardedVideoAd(
      placementId: Admanager.FBRewardAd,
      listener: (result, value) {
        if (result == RewardedVideoAdResult.LOADED) {
          isRewadAdLoaded = true;
          // _rewardedAd?.show();
        }
      },
    );
  }

  static onFailedInd(String x) async {
    switch (x) {
      case "G":
        await googleRemainAds.showIndAd();
        break;

      case "F":
        await showIndAd();
        break;
      case "C":
        await CustomAds.showInterAd();
        break;

      case "U":
        await UnityAdsClass.showInterAd();
        break;
      default:
        break;
    }
  }

  static onFailedReward(String x, Future<void> cb) async {
    switch (x) {
      case "G":
        await googleRemainAds.showRewardAd(cb);
        break;

      case "F":
        await showRewardAd(cb);
        break;
      case "C":
        await CustomAds.showRewardAd(cb);
        break;

      case "U":
        await UnityAdsClass.showRewardAd(cb);
        break;
      default:
        break;
    }
  }

  static showIndAd() async {
    if (_interstitialAd != null && isIndLoaded == true) {
      FacebookInterstitialAd.showInterstitialAd();
    } else {
      if (appLifeCycleController.adsConstant.adData?.indAd?.onFailed == true) {
        await onFailedInd(appLifeCycleController
                .adsConstant.adData?.adIdConfig?.f?.onFailedInd ??
            "C");
      }
    }

    loadIndaD();
  }

  static showRewardAd(Future<void> cb) async {
    if (_rewardedAd != null && isRewadAdLoaded == true) {
      await FacebookRewardedVideoAd.showRewardedVideoAd();

      cb;
    } else {
      if (appLifeCycleController.adsConstant.adData?.rewardAd?.onFailed ==
          true) {
        await FbAdClass.onFailedReward(
            appLifeCycleController
                    .adsConstant.adData?.adIdConfig?.f?.onFailedReward ??
                "F",
            cb);
      } else {
        cb;
      }
    }
    loadRewardAd();
  }
}

class FbBannerAd extends StatefulWidget {
  String adSize = "Large";
  static String adUnitId = 'ca-app-pub-3940256099942544/2247696110';
  FbBannerAd({super.key, this.adSize = "Large"});

  @override
  State<FbBannerAd> createState() => _FbBannerAdState();
}

class _FbBannerAdState extends State<FbBannerAd>
    with AutomaticKeepAliveClientMixin {
  late FacebookBannerAd? nativeAd;

  bool nativeAdIsLoaded = false;
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

    if (appLifeCycleController.adsConstant.adData?.adIdConfig?.f?.status ==
        true) {
      if (isloadingDone && !nativeAdIsLoaded) {
        return getFailedBannerAd(widget.adSize); // Trigger fallback logic here
      } else {
        return isloading
            ? Center(child: CircularProgressIndicator())
            : nativeAdIsLoaded
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

    if (nativeAdIsLoaded == true) {
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
    nativeAdIsLoaded = false;

    nativeAd = FacebookBannerAd(
      listener: (result, value) {
        print("helllooo");
        if (result == BannerAdResult.ERROR) {
          nativeAdIsLoaded = false;
          isloading = false;
          isloadingDone = true;
        }
        setState(() {});
        if (result == BannerAdResult.LOADED) {
          nativeAdIsLoaded = true;
          isloading = false;
          isloadingDone = true;
          setState(() {});
        }
        print("Fb Native Ad: $result --> $value");
      },
      placementId: kDebugMode
          ? "IMG_16_9_APP_INSTALL#${Admanager.FBannerAd}"
          : Admanager.FBannerAd,
    );

    if (nativeAd != null) {
      isloading = false;
      isloadingDone = true;
      nativeAdIsLoaded = true;
      setState(() {});
    } else {
      isloading = false;
      isloadingDone = true;
      nativeAdIsLoaded = false;
      setState(() {});
    }

    // await nativeAd.load();
  }

  Widget getFailedBannerAd([String adSize = "Large"]) {
    if (appLifeCycleController.adsConstant.adData?.bannerAd?.onFailed == true) {
      switch (appLifeCycleController
          .adsConstant.adData?.adIdConfig?.f?.onFailedBanner) {
        case "G":
          return gBannerAd();

        case "F":
          return SizedBox.shrink();
        // break;

        case "C":
          return CustomAds.getBannerAd();
        // break;
        case "U":
          return UnityAdsClass.getBannerAd();
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
