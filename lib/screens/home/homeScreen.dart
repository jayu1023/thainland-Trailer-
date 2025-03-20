import 'package:camaramanmodmelon/ads/adsMainClause.dart';

import 'package:camaramanmodmelon/ads/applovinad.dart';
import 'package:camaramanmodmelon/ads/soCials.dart';
import 'package:camaramanmodmelon/screens/home/controller/HomeController.dart';
import 'package:camaramanmodmelon/screens/home/widgets/itemCard.dart';
import 'package:camaramanmodmelon/utils/ads.dart';
import 'package:camaramanmodmelon/utils/adsParameter.dart';
import 'package:camaramanmodmelon/utils/appColors.dart';

import 'package:camaramanmodmelon/utils/appRoutesString.dart';
import 'package:camaramanmodmelon/utils/appStrings.dart';
import 'package:camaramanmodmelon/utils/navigation.dart';
import 'package:camaramanmodmelon/widget/commonAppBar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';

import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      drawer: SafeArea(
        // maintainBottomViewPadding: true,
        // bottom: true,
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 128.0,
                  height: 128.0,
                  margin: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 64.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey, //New
                            blurRadius: 25.0,
                            offset: Offset(0, -10))
                      ],
                      borderRadius: BorderRadius.circular(10.sp)),
                  child: Image.asset(
                    'assets/logo.png',
                    // height: 128,
                    // width: 128,
                    fit: BoxFit.fill,
                  ),
                  // Container(
                  //   margin: const EdgeInsets.only(
                  //     top: 24.0,
                  //     bottom: 64.0,
                  //   ),
                  //   clipBehavior: Clip.antiAlias,
                  //   decoration: BoxDecoration(
                  //       color: Colors.black26,
                  //       borderRadius: BorderRadius.circular(10.sp)),
                  //   child: Image.asset(
                  //     'assets/logo.png',
                  //     // height: 128,
                  //     // width: 128,
                  //     fit: BoxFit.fill,
                  //   ),
                  // ),
                ),
                ListTile(
                  shape: Border(
                      bottom: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                          style: BorderStyle.solid)),
                  onTap: () {
                    controller.advancedDrawerController.toggleDrawer();
                  },
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                ),
                ListTile(
                  shape: Border(
                      bottom: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                          style: BorderStyle.solid)),
                  onTap: () {
                    launchUrl(Uri.parse(AppStrings.about_us_ulr));
                  },
                  leading: Icon(
                    Icons.description,
                  ),
                  title: Text('About us'),
                ),
                ListTile(
                  shape: Border(
                      bottom: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                          style: BorderStyle.solid)),
                  onTap: () async {
                    final InAppReview inAppReview = InAppReview.instance;
                    if (await inAppReview.isAvailable()) {
                      inAppReview.requestReview();
                    }
                  },
                  leading: Icon(Icons.star),
                  title: Text('Rate Our App'),
                ),
                ListTile(
                  title: Text("More Apps"),
                  leading: Icon(Icons.more),
                  onTap: () {
                    launchUrl(Uri.parse(
                        "https://play.google.com/store/apps/developer?id=Varni+apps&hl=en&gl=US"));
                  },
                ),
                ListTile(
                  shape: Border(
                      bottom: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                          style: BorderStyle.solid)),
                  onTap: () {
                    launchUrl(Uri.parse(AppStrings.privacy_policy_ulr));
                  },
                  leading: Icon(Icons.security),
                  title: Text('Privacy -Policy'),
                ),
                ListTile(
                  shape: Border(
                      bottom: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                          style: BorderStyle.solid)),
                  onTap: () {
                    // launchUrl(Uri.parse(Social))
                    Socials.onTapYT();
                  },
                  leading: Icon(
                    Icons.play_circle_outlined,
                    // color: Colors.red,
                    size: 20.sp,
                  ),
                  title: Text('Youtube Channel'),
                ),
              ],
            ),
          ),
        ),
      ),
      child: Scaffold(
        bottomNavigationBar: Container(
          child: AdMainClause.getBannerAd(),
        ),
        backgroundColor: AppColors.TextColor,
        appBar: AppBar(
          title: const Text(AppStrings.appName),
          leading: IconButton(
            onPressed: () {
              controller.advancedDrawerController.showDrawer();
            },
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: controller.advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            SingleChildScrollView(
              controller: controller.scCon,
              child: Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 25.h,
                      // aspectRatio: 16 / 9,
                      // aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      // autoPlay: kDebugMode ? false : true,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      // onPageChanged: (index, reason) {
                      //   controller.currentValue.value = index;
                      // },
                      scrollDirection: Axis.horizontal,
                    ),
                    items: controller.sliderData
                        .map((element) => Card(
                              elevation: 10.sp,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: Container(
                                width: 100.w,
                                height: 25.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image:
                                            NetworkImage(element.toString()))),
                              ),
                            ))
                        .toList(),
                  ),
                  Obx(() {
                    return SizedBox(
                      // height: controller.visibleSlider.value ? 65.h : 100.h,
                      width: 100.w,
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          controller.currentIndex.value = index;

                          if (index == controller.mods.length) {
                            return controller.isDataEnd.value == true
                                ? Text("Data Edned")
                                : Center(
                                    child: CircularProgressIndicator(),
                                  );
                          } else {
                            return ItemCard(
                              model: controller.mods[index],
                              image: controller.mods[index].images.toString(),
                            );
                          }
                        },
                        itemCount: controller.mods.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return AdMainClause.getNativeAd(index);
                          // controller.currentIndex.value = index;
                          // return ItemCard(index: ,);
                        },
                      ),
                    );
                  }),
                ],
              ),
            ),
            Positioned(
                right: 5.w,
                bottom: 5.h,
                child: Obx(() {
                  return InkWell(
                    onTap: () {
                      controller.isTop.value = true;
                      controller.scCon.animateTo(1,
                          duration: Duration(milliseconds: 850),
                          curve: Curves.fastOutSlowIn);
                    },
                    child: Visibility(
                      visible: controller.isTop.value == false ? true : false,
                      child: Card(
                        shape: CircleBorder(),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_upward_sharp,
                            color: AppColors.BlueColor,
                            size: 20.sp,
                          ),
                        ),
                      ),
                    ),
                  );
                })),
          ],
        ),
      ),
      controller: controller.advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueGrey, Colors.blueGrey.withOpacity(0.2)],
          ),
        ),
      ),
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 0.0,
        //   ),
        // ],
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
    );
  }
}
