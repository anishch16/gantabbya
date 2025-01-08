import 'package:get/get.dart';

import '../controllers/detail_destination_controller.dart';

class DetailDestinationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailDestinationController>(
      () => DetailDestinationController(),
    );
  }
}
