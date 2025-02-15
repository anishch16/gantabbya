import 'dart:convert';
import 'dart:developer';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/remote/api_client.dart';
import '../../../data/remote/api_urls.dart';
import '../../../data/remote/models/destination_model.dart';
import '../../../data/remote/models/images_model.dart';
import 'package:http/http.dart' as http;


class HomeController extends GetxController {
  final localData = GetStorage();

  final isGrid = false.obs;
  final imageIndex = 0.obs;
  var isLoading = true.obs;
  var isImageLoading = true.obs;
  final destinationData = DestinationResponse().obs;
  final nepalNatureData = NepalNatureResponse().obs;
  CarouselSliderController carouselController = CarouselSliderController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    loadPopularDestinations();
    loadImages();

  }
  Future<void> loadPopularDestinations() async {
    isLoading.value = true;
    Future<http.Response> response = ApiClient().getRequest(ApiUrls.DESTINATIONS);
    response.then((http.Response response) {
      if (response.statusCode == 200) {
        DestinationResponse destinationResponse = DestinationResponse.fromJson(jsonDecode(response.body));
        destinationData.value = destinationResponse;
        destinationData.value = DestinationResponse(
          error: destinationResponse.error,
          message: destinationResponse.message,
          data: destinationResponse.data,
        );
        isLoading.value = false;
      } else {
        isLoading.value = false;
        Get.rawSnackbar(message: "Please input the correct credentials.");
      }
    });
  }
  // Future<void> loadPopularDestinations() async {
  //   try {
  //     isLoading.value = true;
  //     await Future.delayed(const Duration(seconds: 2));
  //     final String jsonString = await rootBundle.loadString('assets/jsons/destination_list.json');
  //     DestinationResponse destinationResponse = DestinationResponse.fromJson(jsonString);
  //     destinationData.value = destinationResponse;
  //   } catch (e) {
  //     log("Error loading destinations: $e");
  //   } finally {
  //     isLoading.value = false;
  //     log("Loading completed ${destinationData.value.data}");
  //   }
  // }
  Future<void> loadImages() async {
    try {
      isImageLoading.value = true;
      await Future.delayed(const Duration(seconds: 2));
      final String jsonString = await rootBundle.loadString('assets/jsons/images.json');
      NepalNatureResponse nepalNature = NepalNatureResponse.fromJson(jsonString);
      nepalNatureData.value = nepalNature;
    } catch (e) {
      log("Error loading destinations: $e");
    } finally {
      isImageLoading.value = false;
      log("Loading completed ${nepalNatureData.value}");
    }
  }
}
