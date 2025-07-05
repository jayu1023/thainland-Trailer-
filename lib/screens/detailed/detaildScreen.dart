import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:camaramanmodmelon/ads/adsMainClause.dart';
import 'package:camaramanmodmelon/ads/facebookAd.dart';
import 'package:camaramanmodmelon/ads/soCials.dart';
import 'package:camaramanmodmelon/ads_copy/adManager.dart';
import 'package:camaramanmodmelon/ads_copy/appLifeCyclecontroller.dart';
import 'package:camaramanmodmelon/screens/detailed/controller/detaildController.dart';
import 'package:camaramanmodmelon/screens/download_screen.dart';
import 'package:camaramanmodmelon/screens/instructionScreen.dart';
import 'package:camaramanmodmelon/utils/ads.dart';
import 'package:camaramanmodmelon/utils/apiEndPoints.dart';
import 'package:camaramanmodmelon/utils/appColors.dart';
import 'package:camaramanmodmelon/widget/commonAppBar.dart';
import 'package:facebook_audience_network/ad/ad_native.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class DetaildScreen extends GetView<DetaildController> {
  DetaildScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{

        if(appLifeCycleController.adsConstant.adData?.onBak?.screens?.contains(1)==true){
              
         await Admanager.getBackOn();
         return true;
        }else{
          return true;
        }
        
        },
      child: Scaffold(
        backgroundColor: AppColors.TextColor,
        bottomNavigationBar: appLifeCycleController.adsConstant.adData?.bannerAd?.screens?.contains(2)==true?Admanager().getBannerAd():SizedBox.shrink(),
        appBar: getCommonAppBar(controller.currentName.toString(), true),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 1.h,
                ),
                Hero(
                  tag: controller.currentImage.value.toString(),
                  child: Image.network(
                    "${ApiEndPoints.baseImageUrl}${controller.currentImage.value}",
                    width: 100.w,
                    height: 30.h,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Visibility(
                  visible: Socials.subscribe_Channel_on,
                  child: ElevatedButton(
                      onPressed: () async {
                        print(Socials.youtube_video_links.length);
                        int rand = Random()
                            .nextInt(Socials.youtube_video_links.length - 1);
      
                        // if (AdConstant.AlterNate_Native_Ad_On == true) {
                        if (await launchUrl(
                            Uri.parse(Socials.youtube_video_links[rand]))) {}
                        // } else {
                        //   Share.shareUri(
                        //       Uri.parse(Socials.youtube_video_links[rand]));
                        // }
                      },
                      child: Text(
                        " Watch Youtube Video",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.sp,
                        ),
                      )),
                ),
                SizedBox(
                  height: 6.h,
                ),
                ElevatedButton(
                    onPressed: () async{
                    await  appLifeCycleController.adsConstant?.adData?.indAd?.screens?.contains(2)==true?Admanager.getIndAd():null;
                      
                        Get.to(InstructionScreen());
                      
                    },
                    child: Text(
                      "Instruction to \nInstall Mod in Game",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17.sp,
                      ),
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Visibility(
                      visible:
                          controller.model.value.livery!.isEmpty ? false : true,
                      child: Text(
                        "*Livery*",
                        style: TextStyle(
                            fontSize: 25.sp, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Visibility(
                      visible:
                          controller.model.value.livery!.isEmpty ? false : true,
                      child: SizedBox(
                        height: 22.h,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 35.w,
                              margin: EdgeInsets.symmetric(horizontal: 2.w),
                              alignment: Alignment.center,
                              // color: Colors.black,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Image.network(
                                    "${ApiEndPoints.baseImageLiveryUrl}{controller.model.value.livery![index].toString()}",
                                    height: 16.h,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        Ads.showUnityRewardedAd(() async {
                                          await launchUrl(
                                              Uri.parse(
                                                  "${ApiEndPoints.baseImageLiveryUrl}{controller.model.value.livery![index].toString()}"),
                                              mode:
                                                  LaunchMode.externalApplication);
                                        });
                                      },
                                      child: Text(
                                        "Download",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12.sp),
                                      ))
                                ],
                              ),
                            );
                          },
                          itemCount: controller.model.value.livery!.length,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Padding(
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
                        SizedBox(height: 250,width: Get.width,),
                        appLifeCycleController.adsConstant.adData?.nativeAd?.screens?.contains(2)==true? Admanager().getNativeAd():SizedBox(height: 250,width: Get.width,)
                        /*
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6.0),
                          child: FacebookNativeAd(
                            placementId: "806443504242872_838897967664092",
                            // placementId: kDebugMode
                            //     ? "IMG_16_9_LINK#${native_ids[nativeCounter]}"
                            //     : native_ids[nativeCounter],
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
                              // if (nativeCounter == native_ids.length - 1) {
                              //   nativeCounter = 0;
                              // } else {
                              //   nativeCounter = nativeCounter + 1;
                              // }
                              print("Native Ad: $result --> $value");
                            },
                            keepExpandedWhileLoading: true,
                            expandAnimationDuraion: 00,
                          ),
                        ),
                      */
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () async{
                          await  appLifeCycleController.adsConstant.adData?.indAd?.screens?.contains(2)==true?Admanager.getIndAd():null;
                            
                              Get.to(DownloadScreen(
                                  image:
                                      "${ApiEndPoints.baseImageUrl}${controller.currentImage.value}",
                                  name: controller.model.value.name.toString(),
                                  link:
                                      "${ApiEndPoints.baseUrl}/file/${controller.model.value.download}"));
                     
                            // Ads.showUnityRewardedAd(() async {
                            //   await launchUrl(
                            //       Uri.parse(
                            //           "${ApiEndPoints.baseUrl}/file/${controller.model.value.download}"),
                            //       mode: LaunchMode.externalApplication);
                            // });
                          },
                          child: Text("Install Mod")),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
