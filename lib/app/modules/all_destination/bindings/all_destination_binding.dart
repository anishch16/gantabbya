import 'package:get/get.dart';

import '../controllers/all_destination_controller.dart';

class AllDestinationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllDestinationController>(
      () => AllDestinationController(),
    );
  }
}
