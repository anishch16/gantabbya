import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/remote/api_client.dart';
import '../../../data/remote/api_urls.dart';
import '../../../data/remote/models/bus_air_hotel_model.dart';
import 'package:http/http.dart' as http;


class SetDestinationController extends GetxController {
  //TODO: Implement SethotelController
  final destinations = const ['Pashupatinath', 'Mustang', 'Lumbini', 'Kalinchowk', 'Manakamana', 'Janakpur Temple', 'Pokhara'];
  final selectedDestination = "Pashupatinath".obs;
  final foodType = const ['Veg', 'Non-Veg', 'Vegan', 'Gluten-Free'];
  final selectedFoodType = "Veg".obs;
  final lodgingType = const ['Hotel', 'Guesthouse', 'Resort', 'Homestay'];
  final selectedLodgingType = "Hotel".obs;
  final count = 0.obs;
  final selectedFood = 0.obs;
  final selectedLodge = 0.obs;
  final selectedTravel = 0.obs;
  final individualController = TextEditingController();
  final startDate = TextEditingController();
  final endDate = TextEditingController();
  var hotelData = BusAirHotelModel().obs;
  var airlineData = BusAirHotelModel().obs;
  var busesData = BusAirHotelModel().obs;
  var hotelLoading = false.obs;
  var airlinesLoading = false.obs;
  var busesLoading = false.obs;

  @override
  void onReady() {
    super.onReady();
    loadAirlines();
    loadHotels();
    loadBuses();
  }
  Future<void> loadHotels() async {
    hotelLoading.value = true;
    Future<http.Response> response = ApiClient().getRequest("http://10.0.2.2:8000/api/destinations/1/hotels");
    response.then((http.Response response) {
      if (response.statusCode == 200) {
        BusAirHotelModel hotelResponse = BusAirHotelModel.fromJson(jsonDecode(response.body));
        hotelData.value = hotelResponse;
        hotelLoading.value = false;
      } else {
        hotelLoading.value = false;
        Get.rawSnackbar(message: "Something went wrong");
      }
    });
  }
  Future<void> loadAirlines() async {
    airlinesLoading.value = true;
    Future<http.Response> response = ApiClient().getRequest("http://10.0.2.2:8000/api/destinations/1/airlines");
    response.then((http.Response response) {
      if (response.statusCode == 200) {
        BusAirHotelModel airlineResponse = BusAirHotelModel.fromJson(jsonDecode(response.body));
        airlineData.value = airlineResponse;
        airlinesLoading.value = false;
      } else {
        airlinesLoading.value = false;
        Get.rawSnackbar(message: "Something went wrong");
      }
    });
  }
  Future<void> loadBuses() async {
    busesLoading.value = true;
    Future<http.Response> response = ApiClient().getRequest("http://10.0.2.2:8000/api/destinations/1/buses");
    response.then((http.Response response) {
      if (response.statusCode == 200) {
        BusAirHotelModel busesResponse = BusAirHotelModel.fromJson(jsonDecode(response.body));
        busesData.value = busesResponse;
        busesLoading.value = false;
      } else {
        busesLoading.value = false;
        Get.rawSnackbar(message: "Something went wrong");
      }
    });
  }
}
