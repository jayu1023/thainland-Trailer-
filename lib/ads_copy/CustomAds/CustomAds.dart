import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import 'package:url_launcher/url_launcher.dart';

import '../appLifeCyclecontroller.dart';

class CustomAds {
  static getNativeAd() {
    if (appLifeCycleController.adsConstant.adData?.adIdConfig?.q?.status ==
        true) {
      int rand = Random().nextInt(int.parse(appLifeCycleController
                  .adsConstant.adData?.adIdConfig?.q?.adsQureka?.length
                  .toString() ??
              2.toString()) -
          1);

      print(rand);

      return InkWell(
        onTap: () async {
          if (!await launchUrl(
              Uri.parse(appLifeCycleController.adsConstant.adData?.adIdConfig?.q
                      ?.adsQureka?[rand].loadurl ??
                  ""),
              mode: LaunchMode.inAppBrowserView)) {
            throw Exception('Could not launch');
          } else {
            appLifeCycleController.isQurekashown = true;
          }
        },
        child: Container(
          // height: Get.height * 0.2,
          width: Get.width,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 2.0)),
          padding: EdgeInsets.all(3.0),
          margin:
              EdgeInsets.only(left: 2.5.w, right: 2.5.w, top: 0, bottom: 10),
          child: Banner(
            message: 'Ad',
            location: BannerLocation.topStart,
            child: Column(
              // alignment: Alignment.bottomCenter,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.network(
                  "${appLifeCycleController.adsConstant.adData?.adIdConfig?.q?.adsQureka?[rand].imageUrl}",
                  width: Get.width,
                  height: Get.height * 0.15,
                  fit: BoxFit.fill,
                ),

                ListTile(
                  contentPadding: EdgeInsets.zero,
                  trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.sp)),
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white),
                      onPressed: () async {
                        if (!await launchUrl(
                            Uri.parse(appLifeCycleController.adsConstant.adData
                                    ?.adIdConfig?.q?.adsQureka?[rand].loadurl ??
                                ""),
                            mode: LaunchMode.inAppBrowserView)) {
                          throw Exception('Could not launch');
                        } else {
                          appLifeCycleController.isQurekashown = true;
                        }
                      },
                      child: Text(
                          "${appLifeCycleController.adsConstant.adData?.adIdConfig?.q?.adsQureka?[rand].btnText}")),
                  leading: Image.network(
                    "${appLifeCycleController.adsConstant.adData?.adIdConfig?.q?.adsQureka?[rand].logoUrl}",
                    height: 35,
                    width: 35,
                  ),
                  title: Text(
                    "${appLifeCycleController.adsConstant.adData?.adIdConfig?.q?.adsQureka?[rand].name}",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                      "${appLifeCycleController.adsConstant.adData?.adIdConfig?.q?.adsQureka?[rand].title}"),
                ),

                // ColoredBox(
                //   color: Colors.white,
                //   child: Row(
                //     children: [
                // Image.network(
                //   "${AppData.c.data![rand].logoUrl}",
                //   height: 70,
                //   width: 70,
                // )
                //         ,Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [

                //             Text()
                //           ],
                //         )

                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      );
    } else {
      return SizedBox.shrink();
    }
    ;
  }

  static getBannerAd() {
    if (appLifeCycleController.adsConstant.adData?.adIdConfig?.q?.status ==
        true) {
      int rand = Random().nextInt(int.parse(appLifeCycleController
                  .adsConstant.adData?.adIdConfig?.q?.adsQureka?.length
                  .toString() ??
              2.toString()) -
          1);

      return ListTile(
        onTap: () async {
          if (!await launchUrl(
              Uri.parse(appLifeCycleController.adsConstant.adData?.adIdConfig?.q
                      ?.adsQureka?[rand].loadurl ??
                  ""),
              mode: LaunchMode.inAppBrowserView)) {
            throw Exception('Could not launch');
          } else {
            appLifeCycleController.isQurekashown = true;
          }
        },
        tileColor: Colors.grey.shade200,
        // contentPadding: EdgeInsets.,
        trailing: ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.sp)),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white),
            onPressed: () async {
              if (!await launchUrl(
                  mode: LaunchMode.inAppBrowserView,
                  Uri.parse(appLifeCycleController.adsConstant.adData
                          ?.adIdConfig?.q?.adsQureka?[rand].loadurl ??
                      ""))) {
                throw Exception('Could not launch');
              } else {
                appLifeCycleController.isQurekashown = true;
              }
            },
            child: Text(
                "${appLifeCycleController.adsConstant.adData?.adIdConfig?.q?.adsQureka?[rand].btnText}")),
        leading: Image.network(
          "${appLifeCycleController.adsConstant.adData?.adIdConfig?.q?.adsQureka?[rand].logoUrl}",
          height: 35,
          width: 35,
        ),
        title: Text(
          "(AD)  ${appLifeCycleController.adsConstant.adData?.adIdConfig?.q?.adsQureka?[rand].name}",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
            "${appLifeCycleController.adsConstant.adData?.adIdConfig?.q?.adsQureka?[rand].title}"),
      );
    } else {
      return SizedBox.shrink();
    }
  }

  static showInterAd() async {
    if (!await launchUrl(Uri.parse(appLifeCycleController
            .adsConstant.adData?.adIdConfig?.q?.adsQureka?.first.loadurl ??
        "https://969.play.online.thopgames.in/#gsc.tab=0"))) {
      throw Exception('Could not launch ');
    } else {
      appLifeCycleController.isQurekashown = true;
    }
  }

  static showRewardAd(Future<void> downloadMods) async {
    if (!await launchUrl(Uri.parse(appLifeCycleController
            .adsConstant.adData?.adIdConfig?.q?.adsQureka?.first.loadurl ??
        "https://969.play.online.thopgames.in/#gsc.tab=0"))) {
      throw Exception('Could not launch ');
    } else {
      appLifeCycleController.isQurekashown = true;
    }
    Future.delayed(Duration(milliseconds: 200), () {
      downloadMods;
    });
  }
}
