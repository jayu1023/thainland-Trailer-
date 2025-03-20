import 'package:camaramanmodmelon/ads/adsMainClause.dart';
import 'package:camaramanmodmelon/ads/facebookAd.dart';
import 'package:camaramanmodmelon/api/api.dart';
import 'package:camaramanmodmelon/utils/ads.dart';
import 'package:camaramanmodmelon/utils/appRoutes.dart';
import 'package:camaramanmodmelon/utils/navigation.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit

    init();

    Future.delayed(Duration(milliseconds: 300), () {
      Navigation.navigateToHomeScreen(true);
    });
  }

  void init() async {
    AdMainClause.initAllLoaderAd();
    Ads.callAdsAPi();
    //askshay
    //   await Ads.loadFacebookInterstitialAd();
    //   await Ads.loadUnityInt();
    //   await Ads.loadUnityRewardedAd();
  }
}
