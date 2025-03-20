import 'package:camaramanmodmelon/model/apiModel.dart';
import 'package:camaramanmodmelon/screens/home/controller/HomeController.dart';
import 'package:get/get.dart';

class DetaildController extends GetxController {
  RxString currentImage = "0".obs;
  RxString currentDownloadFile = "0".obs;
  RxString currentName = "0".obs;
  Rx<ApiModel> model = ApiModel().obs;

  HomeController con = Get.put(HomeController());
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    init();
  }

  void init() {
    if (Get.arguments != null) {
      currentImage.value = Get.arguments['image'] as String ?? "";
      currentDownloadFile.value = Get.arguments['downloadFile'] as String ?? "";
      currentName.value = Get.arguments['name'] as String ?? "";
      model.value = Get.arguments['model'] as ApiModel;

      // print(currentIndex.value);
    }
  }
}
