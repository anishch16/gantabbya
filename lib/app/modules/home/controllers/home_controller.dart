import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:carousel_slider/carousel_slider.dart';


class HomeController extends GetxController {
  final localData = GetStorage();

  final isGrid = false.obs;

  @override
  void onInit() {
    super.onInit();
  }
}
