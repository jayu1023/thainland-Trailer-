import 'dart:io';


import 'package:camaramanmodmelon/ads_copy/appLifeCyclecontroller.dart';
import 'package:camaramanmodmelon/utils/appRoutesString.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../adManager.dart';

class GOpenAd {
  AppOpenAd? _appOpenAd;
  bool _isShowingAd = false;

  final Duration maxCacheDuration = Duration(hours: 4);

  /// Keep track of load time so we don't show an expired ad.
  DateTime? _appOpenLoadTime;
bool isPersonalized=false;
  /// Load an AppOpenAd.
  loadAd() async {
    final prefs = await SharedPreferences.getInstance();
 isPersonalized = appLifeCycleController.isPersonalizedAds ?? false;

    print(Admanager.GopenAd);
    await AppOpenAd.load(
      adUnitId: Admanager.GopenAd,
      // orientation: AppOpenAd.orientationPortrait,
      request: AdRequest(
        extras: isPersonalized ? null : {'npa': '1'}
      ),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          print('$ad appOpen Ad loaded');
          _appOpenLoadTime = DateTime.now();
          _appOpenAd = ad;
        },
        onAdFailedToLoad: (error) {
          print('AppOpenAd failed to load: $error');
        },
      ),
    );
  }

  /// Whether an ad is available to be shown.
  /// Returns true if _appOpenAd is not null, indicating an ad is loaded and ready
  /// This getter is used to check ad availability before attempting to show it
  /// Used throughout the class to prevent showing ads when none are loaded
  bool get isAdAvailable {
    return _appOpenAd != null;
  }

  disposeAd() {
    if (isAdAvailable) {
      _appOpenAd?.dispose();
    }
  }

  showAdIfAvailable() async {
    if (!isAdAvailable) {
      print('Tried to show ad before available.');

      // if (AdConstant.appOpenAd == true) {
      loadAd();
      // }
      return;
    }
    if (_isShowingAd) {
      print('Tried to show ad while already showing an ad.');
      return;
    }

    if (DateTime.now().subtract(maxCacheDuration).isAfter(_appOpenLoadTime!)) {
      print('Maximum cache duration exceeded. Loading another ad.');
      _appOpenAd!.dispose();
      _appOpenAd = null;
      // if (AdConstant.appOpenAd == true) {
      loadAd();
      // }
      return;
    }
    // if (AdConstant.appOpenAd == true) {
    _appOpenAd?.show();
    // }

    // Set the fullScreenContentCallback and show the ad.
    _appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        _isShowingAd = true;
        print('$ad onAdShowedFullScreenContent');
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        _isShowingAd = false;
        ad.dispose();
        _appOpenAd = null;
      },
      onAdDismissedFullScreenContent: (ad) {
        print('$ad onAdDismissedFullScreenContent');
        _isShowingAd = false;
        ad.dispose();
        _appOpenAd = null;

        // if (AdConstant.appOpenAd == true) {
        loadAd();
        // }
      },
    );
  }

  Future<bool> showAdIfAvailable2() async {
    bool status = false;
    if (!isAdAvailable) {
      print('Tried to show ad before available.');
 Get.offNamed(AppRoutesString.homeRouteName);
      // if (AdConstant.appOpenAd == true) {
      // loadAd();
      // }
      status = true;
      return status;
    }

    if (DateTime.now().subtract(maxCacheDuration).isAfter(_appOpenLoadTime!)) {
      print('Maximum cache duration exceeded. Loading another ad.');
      _appOpenAd!.dispose();
      _appOpenAd = null;
      // if (AdConstant.appOpenAd == true) {
      // loadAd();
      // }
      status = true;
     Get.offNamed(AppRoutesString.homeRouteName);
      return status;
    }
    // if (AdConstant.appOpenAd == true) {
    _appOpenAd?.show();
    // }

    // Set the fullScreenContentCallback and show the ad.
    _appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        _isShowingAd = true;
        status = true;
        print('$ad onAdShowedFullScreenContent');
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        _isShowingAd = false;
        ad.dispose();
        status = true;
      Get.offNamed(AppRoutesString.homeRouteName);
        _appOpenAd = null;
      },
      onAdDismissedFullScreenContent: (ad) {
        print('$ad onAdDismissedFullScreenContent');
        _isShowingAd = false;
        status = true;
        ad.dispose();
        Get.offNamed(AppRoutesString.homeRouteName);
        _appOpenAd = null;

        // if (AdConstant.appOpenAd == true) {
        // loadAd();
        // }
      },
    );

    return status;
  }
}
