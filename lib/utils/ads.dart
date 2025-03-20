import 'dart:convert';
import 'dart:developer';
import 'package:camaramanmodmelon/ads/facebookAd.dart';
import 'package:camaramanmodmelon/ads/soCials.dart';
import 'package:camaramanmodmelon/utils/adsParameter.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';

import 'package:unity_ads_plugin/unity_ads_plugin.dart';
import 'package:http/http.dart' as http;

class Ads {
  static bool isRewardedAdLoaded = false;

  static Future<void> loadUnityInt() async {
    await UnityAds.load(
      placementId: 'Interstitial_Android',
      onComplete: (placementId) => print('Load Complete $placementId'),
      onFailed: (placementId, error, message) {
        print('Load Failed $placementId: $error $message');
      },
    );
  }

  static Future<void> showUnityInt(VoidCallback callback) async {
    await UnityAds.showVideoAd(
        placementId: 'Interstitial_Android',
        onStart: (placementId) => print('Video Ad $placementId started'),
        onClick: (placementId) => print('Video Ad $placementId click'),
        onSkipped: (placementId) async {
          await loadUnityInt();
          callback.call();
          log("onskipped");
          print('Video Ad $placementId skipped');
        },
        onComplete: (placementId) async {
          await loadUnityInt();
          callback.call();
          log("onCompleted");

          print('Video Ad $placementId completed');
        },
        onFailed: (placementId, error, message) async {
          await Facebook.showInd();
          await loadUnityInt();
          callback.call();
          log("onFailed");

          print('Video Ad $placementId failed: $error $message');
        });
  }

  static Future<void> loadUnityRewardedAd() async {
    await UnityAds.load(
      placementId: 'Rewarded_Android',
      onComplete: (placementId) => print('Load Complete $placementId'),
      onFailed: (placementId, error, message) {
        print('Load Failed $placementId: $error $message');
      },
    );
  }

  static Future<void> showUnityRewardedAd(VoidCallback callback) async {
    await UnityAds.showVideoAd(
        placementId: 'Rewarded_Android',
        onStart: (placementId) => print('Video Ad $placementId started'),
        onClick: (placementId) => print('Video Ad $placementId click'),
        onSkipped: (placementId) async {
          await loadUnityRewardedAd();
          callback.call();
          print('Video Ad $placementId skipped');
        },
        onComplete: (placementId) async {
          await loadUnityRewardedAd();
          callback.call();

          print('Video Ad $placementId completed');
        },
        onFailed: (placementId, error, message) async {
          await showInterstitialAd();
          await loadUnityRewardedAd();
          callback.call();

          print('Video Ad $placementId failed: $error $message');
        });
  }

  static bool _isInterstitialAdLoaded = false;

  static Future<void> loadFacebookInterstitialAd() async {
    await FacebookInterstitialAd.loadInterstitialAd(
      placementId: AdsParameter.fI,
      listener: (result, value) async {
        if (result == InterstitialAdResult.LOADED) {
          _isInterstitialAdLoaded = true;
          log("ad loded...");
        }

        if (result == InterstitialAdResult.DISMISSED &&
            value["invalidated"] == true) {
          _isInterstitialAdLoaded = false;
          await loadFacebookInterstitialAd();
        }
      },
    );
  }

  static Future<void> showInterstitialAd() async {
    if (_isInterstitialAdLoaded == true) {
      await FacebookInterstitialAd.showInterstitialAd();
    } else {
      log("Interstial Ad not yet loaded!");
      await loadFacebookInterstitialAd();
    }
  }

  static showFacebookBanner() {
    log("banner ad......");
    return FacebookBannerAd(
      // bannerSize: BannerSize.STANDARD,
      keepAlive: true,
      placementId: AdsParameter.fB,
    );
  }

  static showFacebookNativeAd() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 0,
        color: Colors.grey.withOpacity(0.2),
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Text("Reserve For Ads Space"),
            ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: FacebookNativeAd(
                placementId: AdsParameter.fN,
                keepAlive: true,
                adType: NativeAdType.NATIVE_AD_VERTICAL,
                bannerAdSize: NativeBannerAdSize.HEIGHT_50,
                width: double.infinity,
                height: 250,
                backgroundColor: Colors.white,
                titleColor: Colors.black,
                descriptionColor: Colors.black,
                buttonColor: Colors.black,
                buttonTitleColor: Colors.white,
                buttonBorderColor: Colors.white,
                listener: (result, value) {
                  print("Native Ad: $result --> $value");
                },
                keepExpandedWhileLoading: true,
                expandAnimationDuraion: 00,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static callAdsAPi() async {
    try {
      http.Response? res = await http.get(
          Uri.parse('https://colonapps.in/Application_Api/weapons_jaycr.php'));

      if (res != null && res.statusCode == 200) {
        List<dynamic> temp = jsonDecode(res.body) as List<dynamic>;
        print(jsonDecode(res.body));
        Map<dynamic, dynamic> data = temp.first as Map<dynamic, dynamic>;
        // AdConstant.counterInd = int.parse(data['counter_ind'].toString());
        // AdConstant.id = int.parse(data['id'].toString());
        // AdConstant.ad_not_found_inList_of_alterNateAd =
        //     data['ad_not_found_inList_of_alterNateAd'] ?? "U";
        // AdConstant.on_Failed_of_Unity = data['on_Failed_of_Unity'] ?? "Q";
        // AdConstant.on_Failed_of_qureka = data['on_Failed_of_qureka'] ?? "U";
        // AdConstant.alternateadon =
        //     bool.parse(data['alternateadon'].toString()) ?? false;

        // AdConstant.alterNateAdOffAd = data['alterNateAdOffAd'] ?? "U";
        // AdConstant.app_Lovin_Native_id =
        //     data['app_Lovin_Native_id'] ?? "c27e4ba16e6efe01";
        // AdConstant.app_Lovin_Banner_id =
        //     data['app_Lovin_Banner_id'] ?? "0e4251ac82f5bfaf";

        // AdConstant.native_Ad_counter =
        //     int.parse(data['native_Ad_counter'].toString());
        // if (data['alterNateAds_of_Ind'] != "") {
        //   AdConstant.alterNateAds_of_Ind =
        //       data['alterNateAds_of_Ind'].toString().split(",").toList();
        // } else {
        //   AdConstant.alterNateAds_of_Ind = ["U", "U"];
        // }

        // if (data['list_of_links'] != "") {
        //   QurekaAdClass.list_Of_links =
        //       data['list_of_links'].toString().split(",").toList();
        //   print(data['list_of_links']);
        // } else {
        //   QurekaAdClass.list_Of_links = [
        //     "https://335.go.qureka.com/intro/question",
        //     "https://335.go.qureka.com/intro/question"
        //   ];
        // }

        // // if (data['alterNate_Native_ads'] != "") {
        // //   AdConstant.alterNateAds_of_Ind =
        // //       data['alterNate_Native_ads'].toString().split(",").toList();
        // // } else {
        // //   AdConstant.alterna = ["A", "Q"];
        // // }

        // AdConstant.qurekaon = data['qurekaon'] ?? false;
        // //*init socialLinks*//

        // Socials.first_inAppReview_on =
        //     bool.parse(data['first_inAppReview_on'].toString());

        if (data['youtube_video_links'] != " " &&
            data['youtube_video_links'] != null) {
          Socials.youtube_video_links =
              data['youtube_video_links'].toString().split(",");
        } else {
          Socials.youtube_video_links = [
            "https://www.youtube.com/watch?v=DEdV-yq7KG8",
            "https://www.youtube.com/watch?v=3WvD9oRUpFc",
            "https://www.youtube.com/watch?v=YJd6tGgfJmU",
            "https://www.youtube.com/watch?v=beCHqr-TGcM",
            "https://www.youtube.com/watch?v=CjmyjmJV4uQ",
            "https://www.youtube.com/watch?v=h6rqcRPfMro",
            "https://www.youtube.com/watch?v=DdqQmW-1PRY",
            "https://www.youtube.com/watch?v=DEdV-yq7KG8",
            "https://www.youtube.com/watch?v=ZMHp7qXT5lk",
            "https://www.youtube.com/watch?v=ynRkoBM-vJc",
            "https://www.youtube.com/watch?v=ZSyZYgD_Sx0",
            "https://www.youtube.com/watch?v=xOfQWVEDMyQ",
            "https://www.youtube.com/watch?v=JZbOvXc118I",
            "https://www.youtube.com/watch?v=GHlhuX3VE_s",
            "https://www.youtube.com/watch?v=LFtKns3Txmk",
            "https://www.youtube.com/watch?v=Eo9_BcZDqFU",
          ];
        }

        Socials.intsagram =
            data['instagram'] ?? "https://www.instagram.com/mr.joker_1023/";

        if (data['instagram_on'] != null) {
          Socials.instagram_on =
              bool.parse(data['instagram_on'].toString()) ?? false;
        } else {}

        // // socialLinks.isRandomSocialYoutube =
        // //     bool.parse(data['isRandomSocialYoutube'].toString()) ?? false;
        if (data['subscribe_Channel_on'] != null) {
          Socials.subscribe_Channel_on =
              bool.parse(data['subscribe_Channel_on'].toString()) ?? true;
        }

        // socialLinks.youtube_video_links_on =
        //     bool.parse(data['youtube_video_links_on'].toString()) ?? true;

        // socialLinks.channel_url = data['channel_url'].toString();

        // socialLinks.subs_channel_endPoints =
        //     data['subs_channel_endPoints'].toString();

        // socialLinks.subsribe_on_tapping_channel =
        //     bool.parse(data['subsribe_on_tapping_channel'].toString()) ?? true;

        //ui manager api calling
        // uiSocialLinks.expansion_social_link =
        //     bool.parse(data['expansion_social_link'].toString()) ?? false;

        //ui manager api calling

        //*social connection is Closed*//
      }
    } catch (e) {
      // AdConstant.alternateadon = false;
      print(e.toString());
    }
  }
}
