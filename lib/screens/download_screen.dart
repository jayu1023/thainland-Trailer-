import 'package:camaramanmodmelon/ads/adsMainClause.dart';
import 'package:camaramanmodmelon/ads/facebookAd.dart';
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
      bottomNavigationBar: AdMainClause.getBannerAd(),
      body: Column(
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
          Column(
            children: [
              ElevatedButton(
                  onPressed: () async {
                    Ads.showUnityRewardedAd(() async {
                      await launchUrl(Uri.parse(widget.link),
                          mode: LaunchMode.externalApplication);
                    });
                  },
                  child: Text("Donwload Mod!"))
            ],
          )
        ],
      ),
      appBar: AppBar(
        title: Text("Download This Mod ${widget.name}"),
      ),
    );
  }
}
