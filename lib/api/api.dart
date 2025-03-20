import 'dart:convert';
import 'dart:io';

import 'package:camaramanmodmelon/ads/interAdConstant.dart';
import 'package:camaramanmodmelon/ads/nativeAdConstnat.dart';
import 'package:camaramanmodmelon/model/adsControllerModel.dart';
import 'package:camaramanmodmelon/model/apiModel.dart';

import 'package:camaramanmodmelon/utils/adsParameter.dart';
import 'package:camaramanmodmelon/utils/apiEndPoints.dart';

import 'package:http/http.dart' as http;

class Apis {
  Future<List<ApiModel>> getSubData(
      {required String type, required int pack, required int from}) async {
    List<ApiModel> skibidiModMelon = [];

    try {
      var res = await http.post(Uri.parse(
          '${ApiEndPoints.baseUrl}/subCategoryWithNineData.php?type=$type&pack=$pack&to=4&from=$from'));
      print(
          '${ApiEndPoints.baseUrl}/subCategoryWithNineData.php?type=$type&pack=$pack&to=4&from=$from');
      var datas = json.decode(res.body.toString());
      if (res.statusCode == 200) {
        print(res.body);
        for (Map<String, dynamic> ii in datas) {
          skibidiModMelon.add(ApiModel.fromJson(ii));
        }
      } else {}
    } catch (e) {}
    return skibidiModMelon;
  }

  Future<List<AdsControllerModel>> adsIdData() async {
    List<AdsControllerModel> adsConstants = [];
    try {
      var response = await http.get(Uri.parse(
          'https://colonapps.in/Application_Api/Aus_account_Cameraman_Mod_Melon_Playground.php'));

      var data = json.decode(response.body.toString());

      if (response.statusCode == 200) {
        for (Map<String, dynamic> i in data) {
          adsConstants.add(AdsControllerModel.fromJson(i));
        }

        if (adsConstants.isNotEmpty) {
          NativeAdConstant.nativeAdCounter =
              int.tryParse(adsConstants[0].homeNativePosition ?? "5") ?? 5;
          InterAdconstant.interAdCounter =
              int.tryParse(adsConstants[0].intCount ?? "3") ?? 2;
          AdsParameter.intCount = AdsParameter.intAdsInterval;
        }

        return adsConstants;
      } else {
        return adsConstants;
      }
    } on SocketException {
      print("SocketException");
    } catch (e) {
      print(e);
    }
    return adsConstants;
  }

  Future<List<AdsControllerModel>> AdsIDDATA() async {
    List<AdsControllerModel> adsConstants = [];
    try {
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              'https://users-25032000.v3gameplay.com/AkshayTestApp/adsappdata.php'));
      request.fields
          .addAll({'packagename': 'com.varniapps.bussidmodthailandtruck'});

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        Map<String, dynamic> data =
            jsonDecode(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
    } on SocketException {
      print("SocketException");
    } catch (e) {
      print(e);
    }
    return adsConstants;
  }
}
