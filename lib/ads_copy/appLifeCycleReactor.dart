
import 'package:camaramanmodmelon/ads_copy/googleAdx/GOpenAd.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';



import 'appLifeCyclecontroller.dart';

class AppLifecycleReactor {
  final GOpenAd appOpenAdManager;

  AppLifecycleReactor({required this.appOpenAdManager});

  void listenToAppStateChanges() {
    AppStateEventNotifier.startListening();
    AppStateEventNotifier.appStateStream
        .forEach((state) => _onAppStateChanged(state));
  }

  void _onAppStateChanged(AppState appState) {
    // Try to show an app open ad if the app is being resumed and
    // we're not already showing an app open ad.
    if (appState == AppState.foreground) {
      if (appLifeCycleController.adsConstant.adData?.appOpenAd?.status ==
          true) {
        if (appLifeCycleController.isQurekashown == true) {
          if (appLifeCycleController
                  .adsConstant.adData?.appOpenAd?.adShowAfterQureka ==
              true) {
            appOpenAdManager.showAdIfAvailable();
          }
          appLifeCycleController.isQurekashown = false;
        } else {
          print("False");
          appOpenAdManager.showAdIfAvailable();
        }
        // if (appLifeCycleController.isQurekashown == true) {
        //   if (appLifeCycleController
        //           .adsConstant.adData?.appOpenAd?.adShowAfterQureka ==
        //       true) {
        //     appLifeCycleController.isQurekashown = false;
        //     appOpenAdManager.showAdIfAvailable();
        //   } else {
        //     appLifeCycleController.isQurekashown = false;
        //   }
        // } else {}
      }
    }
  }
}
