import 'package:camaramanmodmelon/model/apiModel.dart';
import 'package:camaramanmodmelon/utils/appRoutes.dart';
import 'package:camaramanmodmelon/utils/appRoutesString.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Navigation {
  static navigateToHomeScreen([bool clearStack = false]) {
    if (clearStack) {
      Get.offNamed(AppRoutesString.homeRouteName);
    } else {
      Get.toNamed(AppRoutesString.homeRouteName);
    }
  }

  static navigateToDetaildScreen(
    ApiModel model, [
    bool clearStack = false,
    String name = "",
    String download = "",
    String image = "",
  ]) {
    if (clearStack) {
      Get.offNamed(AppRoutesString.detaildRouteName, arguments: {
        'image': image,
        "downloadFile": download,
        "name": name,
        "model": model
      });
    } else {
      Get.toNamed(AppRoutesString.detaildRouteName, arguments: {
        'image': image,
        "downloadFile": download,
        "name": name,
        "model": model
      });
    }
  }
}
