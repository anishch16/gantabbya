import 'package:get/get.dart';

import '../controllers/favorite_trips_controller.dart';

class FavoriteTripsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoriteTripsController>(
      () => FavoriteTripsController(),
    );
  }
}
