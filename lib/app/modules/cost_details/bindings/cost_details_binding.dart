import 'package:get/get.dart';

import '../controllers/cost_details_controller.dart';

class CostDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CostDetailsController>(
      () => CostDetailsController(),
    );
  }
}
