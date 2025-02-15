import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../data/remote/api_client.dart';
import '../../../data/remote/api_urls.dart';
import '../../../routes/app_pages.dart';
import '../models/signup_response_model.dart';

class SignupController extends GetxController {
  var isSigningUp = false.obs;
  final fn = TextEditingController();
  final ln = TextEditingController();
  final email = TextEditingController();
  final pn = TextEditingController();
  var signupData = SignupResponseModel().obs;
  final pw = TextEditingController();
  final confirmPw = TextEditingController();

  final signUpFormKey = GlobalKey<FormState>();

  final count = 0.obs;

  Future<void> signup({required String email, required String pw, required String username}) async {
    isSigningUp.value = true;
    Map<String, dynamic> requestBody = {"email": email, "password": pw, "username": username};
    Future<http.Response> response = ApiClient().postRequestWithoutToken(ApiUrls.SIGNUP, requestBody);
    response.then((http.Response response) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        SignupResponseModel signupResponseModel = SignupResponseModel.fromJson(jsonDecode(response.body));
        signupData.value = SignupResponseModel(message: signupResponseModel.message);
        Get.toNamed(Routes.LOGIN);
        isSigningUp.value = false;
      } else {
        isSigningUp.value = false;
        Get.rawSnackbar(message: jsonDecode(response.body)["message"]);
      }
    });
  }
}
