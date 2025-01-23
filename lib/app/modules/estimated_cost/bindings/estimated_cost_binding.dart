import 'package:get/get.dart';

import '../controllers/estimated_cost_controller.dart';

class EstimatedCostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EstimatedCostController>(
      () => EstimatedCostController(),
    );
  }
}
