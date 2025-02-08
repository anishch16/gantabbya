import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  final controller = Get.put(SplashController());
   SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  Center(
        child: Image.asset("assets/images/gantabyaLogo.png", height: 100,
        color: Colors.black,
        ),
      ),
    );
  }
}
