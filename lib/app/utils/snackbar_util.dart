import 'package:flutter/material.dart';
import 'package:get/get.dart';

///This class is used to show show custom snackbar messages
class SnackBarUtil {
  static void showSnackBar(
          {required String message,
          Color? bgColor,
          IconData? leadingIcon,
          int? seconds}) =>

      Get.snackbar("Message", message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.grey.shade200,
          duration: Duration(seconds: seconds ?? 1));
}
