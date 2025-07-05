import 'dart:convert';


import 'package:camaramanmodmelon/ads_copy/adModel.dart';
import 'package:camaramanmodmelon/ads_copy/appLifeCycleReactor.dart';
import 'package:camaramanmodmelon/ads_copy/googleAdx/GOpenAd.dart';
import 'package:camaramanmodmelon/screens/splash/controller/splashController.dart';
import 'package:camaramanmodmelon/utils/appStrings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart' ;
import 'package:user_messaging_platform/user_messaging_platform.dart';

import 'adManager.dart';

// import 'package:user_messaging_platform/user_messaging_platform.dart';

class appLifeCycleController extends GetxController
    with WidgetsBindingObserver {
  static late adModel adsConstant = adModel();
  late AppLifecycleReactor _appLifecycleReactor;
  RxString appState = 'App is running'.obs;
  static int alternateNativeCounter = 0;
  final String version = "1.0.0";
  static int lengthNativeCounter = 0;

  static var isQurekashown = false;

  static bool isRequired = false;
  static bool isPersonalizedAds = true;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) async {
 
        

// ConsentInformation.instance.requestConsentInfoUpdate(ConsentRequestParameters(
//   tagForUnderAgeOfConsent: true,
//   consentDebugSettings: ConsentDebugSettings(
//     debugGeography: DebugGeography.debugGeographyEea
//   )
// ), (){

// }, (error){
//   print(error.message);
// });

// print(await ConsentInformation.instance.isConsentFormAvailable());
// await ConsentForm.showPrivacyOptionsForm((e){},);
//  ConsentForm.loadConsentForm((form){
//   print(form);

// }, (error){
//   print(error.message);
// });
// ConsentForm.loadAndShowConsentFormIfRequired((error){
//   print(error!.message);
// });

        final prefs = await SharedPreferences.getInstance();
        if (prefs.getBool("isShown") == false) {
          await prefs.setBool("isShown", true);
          await UserMessagingPlatform.instance.showConsentForm();
          var info = await UserMessagingPlatform.instance
              .requestConsentInfoUpdate(ConsentRequestParameters(
                  debugSettings:
                      ConsentDebugSettings(geography: DebugGeography.EEA)));

          // // // Show the consent form if consent is required.
          if (info.consentStatus == ConsentStatus.required) {
            await prefs.setBool('isRequired', true);
            // `showConsentForm` returns the latest consent info, after the consent from has been closed.
            var info1 = await UserMessagingPlatform.instance.showConsentForm();

            if (info1.consentStatus == ConsentStatus.obtained) {
              await prefs.setBool('isPersonalizedAds', true);
              isPersonalizedAds = true;

              // bool personalized = info.;
              // await prefs.setBool('isPersonalizedAds', personalized);
            } else {
              await prefs.setBool('isPersonalizedAds', false);
              isPersonalizedAds = false;
              // await prefs.setBool('isPersonalizedAds', false);
            }
          } else {
            await prefs.setBool('isRequired', false);
            isRequired = false;
          }
        } else {
          isRequired = prefs.getBool("isRequired") ?? false;
          isPersonalizedAds = prefs.getBool("isPersonalizedAds") ?? true;
        }
        Get.find<SplashController>().initAds();
        //    ConsentInformation consentInfo = await FlutterFundingChoices.requestConsentInformation();
        // if (consentInfo.isConsentFormAvailable && consentInfo.consentStatus == ConsentStatus.required) {
        //   await FlutterFundingChoices.showConsentForm();
        //   // You can check the result by calling `FlutterFundingChoices.requestConsentInformation()` again !
        // }
     

      // InitialBindings().dependencies();
    });

    // callApi();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Update app state based on lifecycle changes

    print("===>>>?${state}");
    if (state == AppLifecycleState.paused) {
      appState.value = 'App is in background';
      print("===>>${appState.value}");
    } else if (state == AppLifecycleState.resumed) {
      appState.value = 'App is in foreground';
      print("===>>${appState.value}");
    } else if (state == AppLifecycleState.inactive) {
      appState.value = 'App is inactive';
      print("===>>${appState.value}");
    } else if (state == AppLifecycleState.detached) {
      appState.value = 'App is detached';
      print("===>>${appState.value}");

      Get.delete<appLifeCycleController>();
    } else {
      print("nulll");
    }
  }

  init() async {
    GOpenAd appOpenAdManager = GOpenAd()..loadAd();
    _appLifecycleReactor =
        AppLifecycleReactor(appOpenAdManager: appOpenAdManager);
    _appLifecycleReactor.listenToAppStateChanges();
  }

  callApi() async {
    
    String  url =
          "https://adminappdata.mediagamers.com/Jaylimbani/thailandads.json";
    

    try {
      final response = await Dio().get(url);
      print(response);
      if (response.statusCode == 200) {
        adsConstant = adModel.fromJson(response.data);

        // Get.put(Splash_PageController()).navigationToScreen();
      }
    } catch (e) {
      // Get.put(Splash_PageController()).navigationToScreen();
      print(e.toString());
    }

    // Decode the JSON string into a Map

    // adsConstant = adModel.fromJson(jsonDecode(jsonString));

    //set all ids into one admanager thing

    ///Fb Ads ID
    Admanager.FBIndAd = adsConstant.adData?.indAd?.fbIndId ?? "";
    Admanager.FBNativeAd = adsConstant.adData?.nativeAd?.fbNativeId ?? "";
    Admanager.FBRewardAd = adsConstant.adData?.rewardAd?.fbRewardId ?? "";
    Admanager.FBannerAd = adsConstant.adData?.bannerAd?.fbBannerId ?? "";

    ///Google Ads ID

    Admanager.GIndAd = adsConstant.adData?.indAd?.admobIndId ?? "";
    Admanager.GNativeAd = adsConstant.adData?.nativeAd?.admobNativeId ?? "";
    Admanager.GRewardAd = adsConstant.adData?.rewardAd?.admobRewardId ?? "";
    Admanager.GbannerAd = adsConstant.adData?.bannerAd?.admobBannerId ?? "";
    Admanager.GopenAd = adsConstant.adData?.appOpenAd?.adId ?? "";

    AppStrings.privacy_policy_ulr =
        adsConstant.appData?.appStringsData?.privacyPolicy ?? "";

    
    AppStrings.shareAppUrl =
        adsConstant.appData?.appStringsData?.shareUs ?? AppStrings.shareAppUrl;

    lengthNativeCounter = adsConstant?.adData?.nativeAd?.nativeArrayLength ?? 3;

    // _jsonData = jsonDecode(jsonString);
  }
}
