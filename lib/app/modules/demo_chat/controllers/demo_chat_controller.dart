import 'package:get/get.dart';

import '../../../data/remote/models/destination_model.dart';

class DemoChatController extends GetxController {

  DestinationResponse destinationData = Get.arguments;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
