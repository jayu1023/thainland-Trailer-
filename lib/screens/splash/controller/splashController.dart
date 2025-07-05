import 'package:camaramanmodmelon/ads/adsMainClause.dart';
import 'package:camaramanmodmelon/ads/facebookAd.dart';
import 'package:camaramanmodmelon/ads_copy/FaceBookAds/fbNativeAd.dart';
import 'package:camaramanmodmelon/ads_copy/appLifeCyclecontroller.dart';
import 'package:camaramanmodmelon/ads_copy/googleAdx/GOpenAd.dart';
import 'package:camaramanmodmelon/ads_copy/googleAdx/googleNativeAd.dart';
import 'package:camaramanmodmelon/ads_copy/unityAds/unityAds.dart';
import 'package:camaramanmodmelon/api/api.dart';
import 'package:camaramanmodmelon/utils/ads.dart';
import 'package:camaramanmodmelon/utils/appRoutes.dart';
import 'package:camaramanmodmelon/utils/navigation.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
   GOpenAd gOpenAd = GOpenAd();
  @override
  void onInit() {
    // TODO: implement onInit

    // init();

    // Future.delayed(Duration(milliseconds: 300), () {
    //   Navigation.navigateToHomeScreen(true);
    // });
  }

  void init() async {
    AdMainClause.initAllLoaderAd();
    Ads.callAdsAPi();
    //askshay
    //   await Ads.loadFacebookInterstitialAd();
    //   await Ads.loadUnityInt();
    //   await Ads.loadUnityRewardedAd();
  }

  void initAds() async{
      if (appLifeCycleController.adsConstant.adData?.adIdConfig?.g?.status ==
        true) {
      if (appLifeCycleController.adsConstant.adData?.appOpenAd?.status ==
          true) {
        if (appLifeCycleController.adsConstant.adData?.spalshAdData?.status ==
                true &&
            appLifeCycleController.adsConstant.adData?.spalshAdData?.ad == 1) {
          await gOpenAd.loadAd();
        }
        await Get.find<appLifeCycleController>().init();
      }
      if (appLifeCycleController.adsConstant.adData?.indAd?.status == true) {
        await googleRemainAds.loadIndaD();
      }

      if (appLifeCycleController.adsConstant.adData?.rewardAd?.status == true) {
        await googleRemainAds.loadRewardAd();
      }
    }

    if (appLifeCycleController.adsConstant.adData?.adIdConfig?.f?.status ==
        true) {
      if (appLifeCycleController.adsConstant.adData?.indAd?.status == true) {
        await FbAdClass.loadIndaD();
      }

      if (appLifeCycleController.adsConstant.adData?.rewardAd?.status == true) {
        await FbAdClass.loadRewardAd();
      }
    }

    if (appLifeCycleController.adsConstant.adData?.adIdConfig?.u?.status ==
        true) {
      if (appLifeCycleController.adsConstant.adData?.indAd?.status == true) {
        await UnityAdsClass.loadInd();
      }

      if (appLifeCycleController.adsConstant.adData?.rewardAd?.status == true) {
        await UnityAdsClass.loadReward();
      }
    }


    Future.delayed(Duration(seconds: 2),(){
    gOpenAd.showAdIfAvailable2();
    }); 
  }
}
