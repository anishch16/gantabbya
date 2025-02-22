import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController {
  //TODO: Implement UserProfileController

  final count = 0.obs;
  final TextEditingController nameController = TextEditingController();
  var lisView = false.obs;

  void changelist() {
    lisView.value = !lisView.value;
  }



  void increment() => count.value++;
}
