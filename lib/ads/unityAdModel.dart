import 'package:unity_ads_plugin/unity_ads_plugin.dart';

class UnityAdModel {
  static String gameId = "5544318";

  static initUnityAd() async {
    await UnityAds.init(gameId: gameId);
  }
}
