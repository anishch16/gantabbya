import 'dart:convert';
import 'dart:developer';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../data/remote/models/destination_model.dart';
import '../../../data/remote/models/weather_model.dart';

class DetailDestinationController extends GetxController {
 var imgList = [].obs;
  final imageIndex = 0.obs;
  final CarouselSliderController carouselController = CarouselSliderController();
  final PageController pageController = PageController();
  var weatherLoading = false.obs;
  var weatherData = WeatherData().obs;
  final Destination data = Get.arguments;

  @override
  void onReady() {
    super.onReady();
    getWeather(
      latitude: data.latitude.toString(),
      longitude: data.longitude.toString(),
    );

  }

 Future<void> getWeather({required String latitude, required String longitude}) async {
  weatherLoading.value = true;
  final String url = "https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&past_days=10&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m"; // Replace with your weather API endpoint
  try {
   final response = await http.get(Uri.parse(url));
   if (response.statusCode == 200) {
    WeatherData weatherResponseModel = WeatherData.fromJson(jsonDecode(response.body));
    weatherData.value = weatherResponseModel;
    weatherLoading.value = false;
   } else {
    weatherLoading.value = false;
    Get.rawSnackbar(message: "Failed to load weather data.");
   }
  } catch (error) {
   weatherLoading.value = false;
   log("An error occurred: $error");
   Get.rawSnackbar(message: "An error occurred: $error");
  }
 }
}
