import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../constants/colors.dart';
import '../../../data/remote/api_client.dart';
import '../../../data/remote/api_urls.dart';
import '../../login/views/login_view.dart';

class SignupController extends GetxController {
  var isSigningIn = false.obs;
  final fn = TextEditingController();
  final ln = TextEditingController();
  final email = TextEditingController();
  final pn = TextEditingController();

  final pw = TextEditingController();
  final confirmPw = TextEditingController();

  final signUpFormKey = GlobalKey<FormState>();

  final count = 0.obs;

  Future<void> signup(String fn, String ln, String pn, String email, String pw, String cpw) async {
    isSigningIn.value = true;
    Map<String, dynamic> requestBody = {
      "first_name": fn,
      "last_name": ln,
      "phone_number": pn,
      "email": email,
      "password": pw,
      "confirm_password": cpw
    };
    Future<http.Response> response = ApiClient().postRequestWithoutToken(ApiUrls.BASE_URL + ApiUrls.SIGNUP, requestBody);
    response.then((http.Response response) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        isSigningIn.value = false;
        Get.rawSnackbar(
            message: "Sign Up Successful",
            backgroundColor: AppColors.grey.shade800,
            duration: const Duration(seconds: 2),
            animationDuration: const Duration(milliseconds: 100),
            snackPosition: SnackPosition.BOTTOM);
        Get.offAll(() => LoginView());
      } else {
        isSigningIn.value = false;
      }
    });
  }
}
