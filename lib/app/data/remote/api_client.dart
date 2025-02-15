import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../constants/colors.dart';
import '../../modules/login/views/login_view.dart';
import 'models/error_response_model.dart';

class ApiClient {
  final localData = GetStorage();

  var errorResponseData = ErrorResponseModel().obs;

  // var refreshTokenData = RefreshTokenModel().obs;
  // final localData = GetStorage();

  //get method
  Future<http.Response> getRequest(String url) async {
    try {
      String? accessToken = localData.read('access_token');
      if (accessToken == null || accessToken.isEmpty) {
        Get.offAll(() => const LoginView());
        Get.rawSnackbar(
          message: 'Session Expired. Please Login Again',
          backgroundColor: AppColors.grey.shade600,
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM,
        );
        throw Exception("Access token is missing.");
      }
      var response = await http.get(
        Uri.parse(url),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $accessToken",
          HttpHeaders.contentTypeHeader: "application/json",
        },
      );

      // Handle 401 (Unauthorized) - Token expired
      if (response.statusCode == 401) {
        localData.erase();
        Get.offAll(() => const LoginView());
        Get.rawSnackbar(
          message: 'Token Expired. Please Login Again',
          backgroundColor: AppColors.grey.shade600,
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM,
        );
        throw Exception("Unauthorized - Token expired.");
      }

      // Handle other errors (non-200 responses)
      if (response.statusCode != 200) {
        log("Error Response: ${response.body}");

        if (response.body.isNotEmpty) {
          var errorMap = jsonDecode(response.body);
          var errorMessage = extractErrorMessage(errorMap);
          showErrorMessage(errorMessage);
        } else {
          showErrorMessage("No Data Received from Server.");
        }
      }

      return response;
    } catch (error, stackTrace) {
      log('An error occurred: $error');
      log('Stack trace: $stackTrace');
      throw Exception("Network error: $error");
    }
  }


  //post method
  Future<http.Response> postRequest(String url, Map<String, dynamic> body) async {
    try {
      String? accessToken = localData.read('access_token');
      if (accessToken == null || accessToken.isEmpty) {
        _handleSessionExpired();
        throw Exception("Access token is missing.");
      }
      var response = await http.post(
        Uri.parse(url),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $accessToken",
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode(body),
      );

      log("Request: $url | Body: ${jsonEncode(body)} | Response: ${response.body}");
      if (response.statusCode == 401) {
        localData.erase();
        _handleSessionExpired();
        throw Exception("Unauthorized - Token expired.");
      }
      return response;
    } catch (error) {
      if (error is SocketException) {
        log('Network error: $error');
        throw Exception("Unable to connect to the server. Please check your internet or API server.");
      } else {
        log('An unexpected error occurred: $error');
        rethrow;
      }
    }
  }
  void _handleSessionExpired() {
    Get.offAll(() => const LoginView());
    Get.rawSnackbar(
      message: 'Session Expired. Please Login Again',
      backgroundColor: AppColors.grey.shade600,
      duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
  // Future<http.Response> postRequest(String url, Map<String, dynamic> body) async {
  //   try {
  //     String? accessToken = localData.read('access_token');
  //     if (accessToken == null || accessToken.isEmpty) {
  //       Get.offAll(() => const LoginView());
  //       Get.rawSnackbar(
  //         message: 'Session Expired. Please Login Again',
  //         backgroundColor: AppColors.grey.shade600,
  //         duration: const Duration(seconds: 2),
  //         snackPosition: SnackPosition.BOTTOM,
  //       );
  //       throw Exception("Access token is missing.");
  //     }
  //
  //     var response = await http.post(
  //       Uri.parse(url),
  //       headers: {
  //         HttpHeaders.authorizationHeader: "Bearer $accessToken",
  //         HttpHeaders.contentTypeHeader: "application/json",
  //       },
  //       body: jsonEncode(body),
  //     );
  //     if (response.statusCode == 401) {
  //       localData.erase();
  //       Get.offAll(() => const LoginView());
  //       Get.rawSnackbar(
  //         message: 'Token Expired. Please Login Again',
  //         backgroundColor: AppColors.grey.shade600,
  //         duration: const Duration(seconds: 2),
  //         snackPosition: SnackPosition.BOTTOM,
  //       );
  //       throw Exception("Unauthorized - Token expired.");
  //     }
  //     if (response.statusCode != 201) {
  //       log("Error Response: ${response.body}");
  //       if (response.body.isNotEmpty) {
  //         var errorMap = jsonDecode(response.body);
  //         var errorMessage = extractErrorMessage(errorMap);
  //         showErrorMessage(errorMessage);
  //       } else {
  //         showErrorMessage("No Data Received from Server.");
  //       }
  //     }
  //
  //     return response;
  //   } catch (error, stackTrace) {
  //     log('An error occurred: $error');
  //     log('Stack trace: $stackTrace');
  //     throw Exception("Network error: $error");
  //   }
  // }


  //delete method
  Future<http.Response> deleteRequest(String url) async {
    try {
      var response = await http.delete(
        Uri.parse(url),
        headers: {
          HttpHeaders.authorizationHeader:
              'Bearer ' + localData.read('access_token'),
        },
      );
      log("Response::::::::${response.body}");
      if (response.statusCode == 401) {
        // refreshToken();
        // Get.offAll(() => LoginView());
        Get.rawSnackbar(
          message: 'Token Expired Please Login Again',
          backgroundColor: AppColors.grey.shade600,
          duration: const Duration(seconds: 1),
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (response.statusCode != 204) {
        var errorMap = jsonDecode(response.body);
        var errorMessage = extractErrorMessage(errorMap);
        showErrorMessage(errorMessage);
      }
      return response;
    } catch (error, stackTrace) {
      log('An error occurred: $error');
      log('Stack trace: $stackTrace');
      rethrow; // Rethrow the error to propagate it to the caller
    }
  }

  //post request without token

  Future<http.Response> postRequestWithoutToken(
      String url, Map<String, dynamic> body) async {
    try {
      var jsonData = jsonEncode(body);
      var response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonData,
      );

      log("Response: ${response.body}");

      if (response.statusCode >= 400) {
        var errorMap = jsonDecode(response.body);
        var errorMessage = extractErrorMessage(errorMap);
        showErrorMessage(errorMessage);
      }

      return response;
    } catch (error) {
      if (error is SocketException) {
        log('Network error: $error');
        throw Exception("Unable to connect to the server. Please check your internet or API server.");
      } else {
        log('An unexpected error occurred: $error');
        throw error;
      }
    }
  }


  // patch method
  Future<http.Response> patchRequest(
      String url, Map<String, dynamic> body) async {
    try {
      var response = await http.patch(Uri.parse(url),
          headers: {
            HttpHeaders.authorizationHeader:
                'Bearer ' + localData.read('access_token'),
          },
          body: body);
      print("res:" + response.body);

      if (response.statusCode == 401) {
        Get.rawSnackbar(
          message: 'Token Expired Please Login Again',
          backgroundColor: AppColors.grey.shade600,
          duration: Duration(seconds: 1),
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (response.statusCode > 201) {
        var errorMap = jsonDecode(response.body);
        var errorMessage = extractErrorMessage(errorMap);
        showErrorMessage(errorMessage);
      }
      return response;
    } catch (error) {
      print('An error occurred: $error');
      throw error; // Rethrow the error to propagate it to the caller
    }
  }

  //method for refreshing token
  // Future<void> refreshToken() async {
  //   var json_body = {
  //     "access": localData.read('access_token'),
  //     "refresh": localData.read('refresh_token')
  //   };
  //   var response =
  //       await http.post(Uri.parse(Constants.BASE_URL + Constants.REFRESH_TOKEN),
  //           headers: {
  //             'x-api-key': Constants.API_KEY,
  //           },
  //           body: json_body);
  //   if (response.statusCode == 200) {
  //     RefreshTokenModel refreshTokenModel =
  //         RefreshTokenModel.fromJson(jsonDecode(response.body));
  //     refreshTokenData.value = refreshTokenModel;
  //     localData.write("access_token", refreshTokenData.value.access);
  //     localData.write("refresh_token", refreshTokenData.value.refresh);
  //   } else {
  //     Get.offAll(LoginView(), transition: Transition.fade);
  //     Get.rawSnackbar(
  //         message: 'Token Expired,Please Login Again',
  //         backgroundColor: AppColors.grey.shade800,
  //         duration: Duration(seconds: 2),
  //         animationDuration: Duration(milliseconds: 100),
  //         snackPosition: SnackPosition.BOTTOM);
  //   }
  // }

  String extractErrorMessage(dynamic errorMap) {
    // Check if the errorMap is a Map and has at least one key
    if (errorMap is Map<String, dynamic> && errorMap.isNotEmpty) {
      // Extract the error message from the first key-value pair in the map
      var errorMessage = errorMap.values.first.toString();
      return errorMessage;
    } else {
      return "An error occurred";
    }
  }

  void showErrorMessage(String errorMessage) {

    String errorResponse = errorMessage.replaceAll(RegExp(r'[\[\]]'), '');

    // Show the error message using SnackBar

    Get.rawSnackbar(
        message: errorResponse,
        backgroundColor: AppColors.grey.shade800,
        duration: Duration(seconds: 2),
        animationDuration: Duration(milliseconds: 100),
        snackPosition: SnackPosition.BOTTOM);

    print(errorMessage); // You can replace this with UI-specific code
  }
}
