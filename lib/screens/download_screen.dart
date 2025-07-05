import 'package:camaramanmodmelon/ads/adsMainClause.dart';
import 'package:camaramanmodmelon/ads/facebookAd.dart';
import 'package:camaramanmodmelon/ads_copy/adManager.dart';
import 'package:camaramanmodmelon/ads_copy/appLifeCyclecontroller.dart';
import 'package:camaramanmodmelon/utils/ads.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class DownloadScreen extends StatefulWidget {
  String name;
  String link;
  String image;
  DownloadScreen(
      {super.key, required this.image, required this.name, required this.link});

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      bottomNavigationBar: appLifeCycleController.adsConstant.adData?.bannerAd?.screens?.contains(3)==true?Admanager().getBannerAd():SizedBox.shrink(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              "${widget.image}",
              width: 100.w,
              height: 30.h,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 3.h,
            ),
            Facebook.getNativeAd(),
            SizedBox(
              height: 3.h,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.sp)
                      ),
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp
                      ),
                      backgroundColor: Colors.lightBlue,foregroundColor: Colors.white
                    ),
                      onPressed: () async {
                        appLifeCycleController.adsConstant.adData?.rewardAd?.functions?.contains(1)==true?Admanager.getRewardAd(  launchUrl(Uri.parse(widget.link),
                              mode: LaunchMode.externalApplication)): await launchUrl(Uri.parse(widget.link),
                              mode: LaunchMode.externalApplication);
                  
                      },
                      child: Text("Donwload Mod!",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 15.sp
                      ),)),
                        SizedBox(
                height: 5.h,
              ),
                ],
              ),
            ),
          
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Download This Mod ${widget.name}"),
      ),
    );
  }
}
