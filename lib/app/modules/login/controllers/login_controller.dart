import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../../constants/colors.dart';
import '../../../data/remote/api_client.dart';
import '../../../data/remote/api_urls.dart';
import '../../../routes/app_pages.dart';
import '../../bottomNav/views/bottom_nav_view.dart';
import '../models/login_response_model.dart';

class LoginController extends GetxController {
  final count = 0.obs;
  var isLogging = false.obs;
  var loginData = LoginResponseModel().obs;
  final localData = GetStorage();
  var isPasswordVisible = false.obs;
  var isRememberMe = false.obs;
  final email = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final logInFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = localData.read("email") ?? "";
    username.text = localData.read("username") ?? "";
    super.onInit();
  }

  Future<void> login({required String email, required String pw, required String username}) async {
    isLogging.value = true;
    Map<String, dynamic> requestBody = {"email": email, "password": pw, "username": username};
    Future<http.Response> response = ApiClient().postRequestWithoutToken(ApiUrls.LOGIN, requestBody);
    response.then((http.Response response) {
      isLogging.value = false;
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(jsonDecode(response.body));
        loginData.value = LoginResponseModel(
          error: loginResponseModel.error,
          message: loginResponseModel.message,
          data: loginResponseModel.data,
        );
        storeData();
      } else {
        isLogging.value = false;
        Get.rawSnackbar(message: "Please input the correct credentials.");
      }
    });
  }
  // Future<void> login({required String email, required String pw, required String username}) async {
  //   isLogging.value = true;
  //   const String url = "http://10.0.2.2:8000/api/login";
  //   try {
  //     final response = await http.post(Uri.parse(url), headers: {
  //       'Content-Type': 'application/json',
  //     }, body: jsonEncode({
  //       "email": email,
  //       "password": pw,
  //       "username": username
  //     });
  //     if (response.statusCode == 200) {
  //       LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(jsonDecode(response.body));
  //             loginData.value = LoginResponseModel(
  //               error: loginResponseModel.error,
  //               message: loginResponseModel.message,
  //               data: loginResponseModel.data,
  //             );
  //             storeData();
  //       isLogging.value = false;
  //     } else {
  //       isLogging.value = false;
  //       Get.rawSnackbar(message: "Failed to Login");
  //     }
  //   } catch (error) {
  //     isLogging.value = false;
  //     log("An error occurred: $error");
  //     Get.rawSnackbar(message: "An error occurred: $error");
  //   }
  // }

  void storeData() {
    localData.write("access_token", loginData.value.data?.access ?? "");
    localData.write("isLoggedIn", true);
    localData.write("user", username.text);
    if (isRememberMe.value == true) {
      localData.write("username", username.text);
      localData.write("email", email.text);
    }
    Get.rawSnackbar(
        message: "Successfully Logged In",
        backgroundColor: AppColors.grey.shade800,
        duration: const Duration(seconds: 2),
        animationDuration: const Duration(milliseconds: 100),
        snackPosition: SnackPosition.BOTTOM);
    isLogging.value = false;
    Get.offAllNamed(Routes.HOME);
  }
}
