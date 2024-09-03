import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../../constants/colors.dart';
import '../../../data/remote/api_client.dart';
import '../../../data/remote/api_urls.dart';
import '../../bottomNav/views/bottom_nav_view.dart';
import '../models/login_response_model.dart';


class LoginController extends GetxController {
  //TODO: Implement LoginController

  final count = 0.obs;
  var isLogging=false.obs;
  var loginData = LoginResponseModel().obs;
  final localData = GetStorage();







  Future<void> login(String email, String pw) async {
    print("Login Tapped");
    isLogging.value = true;

    Map<String, dynamic> requestBody = {"email": email, "password": pw};
    Future<http.Response> response = ApiClient().postRequestWithoutToken(
        ApiUrls.BASE_URL + ApiUrls.LOGIN, requestBody);
    response.then((http.Response response) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(jsonDecode(response.body));
        loginData.value = LoginResponseModel(
            refresh: loginResponseModel.refresh,
            access: loginResponseModel.access,
            user: loginResponseModel.user);
        storeData();
      } else {
        isLogging.value = false;
      }
    });
  }



  void storeData() {
    localData.write("isLoggedIn", true);
    localData.write("access_token", loginData.value.access);
    localData.write("full_name", loginData.value.user!.fullName);
    localData.write("email", loginData.value.user!.email);
    localData.write("hasFilledProfile", loginData.value.user!.hasFilledProfileInfo);
    if(loginData.value.user!.roles!.contains("HospitalManager") || loginData.value.user!.roles!.contains("HospitalAdmin")){
      localData.write("isHospitalManager", true);
    }
    else{
      localData.write("isHospitalManager", false);
    }

    Get.rawSnackbar(
        message: "Successfully Logged In",
        backgroundColor: AppColors.grey.shade800,
        duration: const Duration(seconds: 2),
        animationDuration: const Duration(milliseconds: 100),
        snackPosition: SnackPosition.BOTTOM);
    print("access token:::"+localData.read("access_token"));
    isLogging.value = false;
    if(loginData.value.user!.hasFilledProfileInfo==false){
      // Get.offAll(() => UserDetailFormView(),arguments:0);
    }
    else{
      Get.offAll(() => BottomNavView());
    }
  }

}
