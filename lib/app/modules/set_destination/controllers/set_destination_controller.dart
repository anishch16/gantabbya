import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SetDestinationController extends GetxController {
  //TODO: Implement SetDestinationController
  final destinations = const ['Pashupatinath', 'Mustang', 'Lumbini', 'Kalinchowk', 'Manakamana', 'Janakpur Temple', 'Pokhara'];
  final selectedDestination = "Pashupatinath".obs;
  final foodType = const ['Veg', 'Non-Veg', 'Vegan', 'Gluten-Free'];
  final selectedFoodType = "Veg".obs;
  final lodgingType = const ['Hotel', 'Guesthouse', 'Resort', 'Homestay'];
  final selectedLodgingType = "Hotel".obs;
  final count = 0.obs;
  final individualController = TextEditingController();
  final startDate = TextEditingController();
  final endDate = TextEditingController();


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
