import 'package:get/get.dart';

import '../controllers/demo_chat_controller.dart';

class DemoChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DemoChatController>(
      () => DemoChatController(),
    );
  }
}
