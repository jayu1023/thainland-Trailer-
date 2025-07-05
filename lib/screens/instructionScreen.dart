import 'package:camaramanmodmelon/ads/adsMainClause.dart';
import 'package:camaramanmodmelon/ads/facebookAd.dart';
import 'package:camaramanmodmelon/ads_copy/adManager.dart';
import 'package:camaramanmodmelon/ads_copy/appLifeCyclecontroller.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class InstructionScreen extends StatefulWidget {
  const InstructionScreen({super.key});

  @override
  State<InstructionScreen> createState() => _InstructionScreenState();
}

class _InstructionScreenState extends State<InstructionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Instructions to Install Mod"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Step 1 \n Download Mod",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 2.h,
            ),
            Facebook.getNativeAd(),
            SizedBox(
              height: 2.h,
            ),
            Image.asset(
              "assets/1.png",
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            Text(
              "Step 2 \n Open our best Game",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              height: 2.h,
            ),
            Image.asset("assets/2.png",
                height: MediaQuery.of(context).size.height * 0.3),
            Text(
              "Step 3 \n Then Click on Mod Button one dialog oppup",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 2.h,
            ),
            Facebook.getNativeAd(),
            SizedBox(
              height: 2.h,
            ),
            Image.asset("assets/2.png",
                height: MediaQuery.of(context).size.height * 0.3),
            Text(
              "step 4 \n in The Dialog Click on Import Mod Button Your internal storage will going to show",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 4.h,
            ),
            Image.asset("assets/3.png",
                height: MediaQuery.of(context).size.height * 0.3),
            Text(
              "step 5 \n Your Downloaded File must be present into Download Folder with bussidmod Extension",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 2.h,
            ),
            Facebook.getNativeAd(),
            SizedBox(
              height: 2.h,
            ),
            Image.asset("assets/4.png",
                height: MediaQuery.of(context).size.height * 0.3),
            Text(
              "Setp 6 \n Select This File and you mod will open into you dialog box",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              height: 2.h,
            ),
            Image.asset("assets/5.png",
                height: MediaQuery.of(context).size.height * 0.3),
            Text(
              "setp 7 \n Select Mod from List and click on Go to Garage You mod has been installed",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 2.h,
            ),
             Facebook.getNativeAd(),
            SizedBox(
              height: 2.h,
            ),
            Image.asset("assets/7.png",
                height: MediaQuery.of(context).size.height * 0.3),
            Text(
              "Congratulation !!! You have learnt successfully to install mod",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 2.h,),
            appLifeCycleController.adsConstant.adData?.nativeAd?.screens?.contains(3)==true?Admanager().getSmallNativeAd():SizedBox.shrink(),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
      bottomNavigationBar: appLifeCycleController.adsConstant.adData?.bannerAd?.screens?.contains(2)==true?Admanager().getBannerAd():SizedBox.shrink(),
    );
  }
}
