import 'package:gantabbya/app/modules/set_destination/controllers/args_model.dart';
import 'package:get/get.dart';

class EstimatedCostController extends GetxController {
  //TODO: Implement EstimatedCostController

  final count = 0.obs;
  TravelCostDetails args = Get.arguments;



  void increment() => count.value++;
}
