import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final localData = GetStorage();

  @override
  void onInit()  async{
    bool firstLogin = localData.read("isLoggedIn") ?? false;
    super.onInit();
    if(firstLogin){
      await Future.delayed(const Duration(seconds: 3));
      Get.offAllNamed(Routes.HOME);
    } else {
      await Future.delayed(const Duration(seconds: 3));
      Get.offAllNamed(Routes.LOGIN);
    }
  }


}
