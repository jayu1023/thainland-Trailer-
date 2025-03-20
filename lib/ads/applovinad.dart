import 'package:applovin_max/applovin_max.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class Applovin {
  static MaxConfiguration? _sdkConfiguration;
  static String? _id = "";
  static String? _bannerId = "";
  static String? _NativeAd = "";
  static late double _mediaViewAspectRatio = 0.5;

  static late MaxNativeAdViewController _maxnativrController;
  Applovin() {
    _maxnativrController = MaxNativeAdViewController();
  }
  static initAppLovin() async {
    new Applovin();
    _sdkConfiguration = await AppLovinMAX.initialize(
      "8EOQxr19AskPQTrO4IMCwTlbogIxil2ZT5nduua2RurOJF2GslG6Crg0Uwo6VQVtEgkWp5uc3lrFnJyNgOfilf",
    );

// SDK is initialized, start loading ads
  }

  static showMrcAd() {
    return MaxAdView(
      adUnitId: _id ?? "",
      adFormat: AdFormat.mrec,
      isAutoRefreshEnabled: true,
    );
  }

  static nativeAd() {
    GlobalKey Key = GlobalKey();
    return Container(
      key: Key,
      margin: const EdgeInsets.all(8.0),
      height: 300,
      child: MaxNativeAdView(
        adUnitId: _NativeAd ?? "",
        width: 100.w,
        controller: _maxnativrController,
        listener: NativeAdListener(onAdLoadedCallback: (ad) {
          print('Native ad loaded from ${ad.networkName}');
          // Key.currentState!.setState(() {
          //   _mediaViewAspectRatio = ad.nativeAd?.mediaContentAspectRatio ?? 0.5;
          // });
        }, onAdLoadFailedCallback: (adUnitId, error) {
          print(
              'Native ad failed to load with error code ${error.code} and message: ${error.message}');
        }, onAdClickedCallback: (ad) {
          print('Native ad clicked');
        }, onAdRevenuePaidCallback: (ad) {
          print('Native ad revenue paid: ${ad.revenue}');
        }),
        child: Container(
          color: const Color(0xffefefef),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(4.0),
                    child: const MaxNativeAdIconView(
                      width: 48,
                      height: 48,
                    ),
                  ),
                  const Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MaxNativeAdTitleView(
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          maxLines: 1,
                          overflow: TextOverflow.visible,
                        ),
                        MaxNativeAdAdvertiserView(
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 10),
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                        ),
                        MaxNativeAdStarRatingView(
                          size: 10,
                        ),
                      ],
                    ),
                  ),
                  const MaxNativeAdOptionsView(
                    width: 20,
                    height: 20,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: MaxNativeAdBodyView(
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 14),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Expanded(
                child: AspectRatio(
                  aspectRatio: _mediaViewAspectRatio,
                  child: const MaxNativeAdMediaView(),
                ),
              ),
              const SizedBox(
                width: double.infinity,
                child: MaxNativeAdCallToActionView(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Color(0xff2d545e)),
                    textStyle: MaterialStatePropertyAll<TextStyle>(
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static showBanner() {
    return MaxAdView(
        adUnitId: _bannerId ?? "",
        adFormat: AdFormat.banner,
        listener: AdViewAdListener(
            onAdLoadedCallback: (ad) {
              print("add loaded!");
            },
            onAdLoadFailedCallback: (adUnitId, error) {
              print("add error!$error");
            },
            onAdClickedCallback: (ad) async {
              // await launchUrl(ad.)
            },
            onAdExpandedCallback: (ad) {},
            onAdCollapsedCallback: (ad) {}));
  }
}
