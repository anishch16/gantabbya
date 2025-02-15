import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/remote/api_client.dart';
import '../../../data/remote/models/bus_air_hotel_model.dart';
import 'package:http/http.dart' as http;

import '../../../data/remote/models/post_cost_params.dart';
import '../../../routes/app_pages.dart';

class SetDestinationController extends GetxController {
  final selectedBus = (-1).obs;
  final selectedLodge = (-1).obs;
  final selectedAirline = (-1).obs;
  final selectedLodgeModel = PostCostParams().obs;
  final selectedAirlineModel = PostCostParams().obs;
  final selectedBusesModel = PostCostParams().obs;
  var startDateFilled = false.obs;
  var endDateFilled = false.obs;
  // final individualController = TextEditingController();
  final startDate = TextEditingController();
  final endDate = TextEditingController();
  var hotelData = BusAirHotelModel().obs;
  var airlineData = BusAirHotelModel().obs;
  var busesData = BusAirHotelModel().obs;
  var hotelLoading = false.obs;
  var airlinesLoading = false.obs;
  var busesLoading = false.obs;

  var useId = GetStorage().read("user_id");
  final arguments = Get.arguments;
  var locationId = "".obs;

  var airlineSuccess = false.obs;
  var hotelSuccess = false.obs;
  var busSuccess = false.obs;
  var busOrAirline = false.obs;

  @override
  void onReady() {
    super.onReady();
    locationId.value = (arguments["location"]).toString();
    loadAirlines();
    loadHotels();
    loadBuses();
  }

  Future<void> loadHotels() async {
    hotelLoading.value = true;
    Future<http.Response> response = ApiClient()
        .getRequest("http://10.0.2.2:8000/api/destinations/$locationId/hotels");
    response.then((http.Response response) {
      if (response.statusCode == 200) {
        BusAirHotelModel hotelResponse =
            BusAirHotelModel.fromJson(jsonDecode(response.body));
        hotelData.value = hotelResponse;
        hotelLoading.value = false;
        log("Hotel: ${response.body}");
      } else {
        hotelLoading.value = false;
        Get.rawSnackbar(message: "Something went wrong");
      }
    });
  }

  Future<void> loadAirlines() async {
    airlinesLoading.value = true;
    Future<http.Response> response = ApiClient().getRequest(
        "http://10.0.2.2:8000/api/destinations/$locationId/airlines");
    response.then((http.Response response) {
      if (response.statusCode == 200) {
        BusAirHotelModel airlineResponse =
            BusAirHotelModel.fromJson(jsonDecode(response.body));
        airlineData.value = airlineResponse;
        airlinesLoading.value = false;
        log("Airlines: ${response.body}");
      } else {
        airlinesLoading.value = false;
        Get.rawSnackbar(message: "Something went wrong");
      }
    });
  }

  Future<void> loadBuses() async {
    busesLoading.value = true;
    Future<http.Response> response = ApiClient()
        .getRequest("http://10.0.2.2:8000/api/destinations/$locationId/buses");
    response.then((http.Response response) {
      if (response.statusCode == 200) {
        BusAirHotelModel busesResponse =
            BusAirHotelModel.fromJson(jsonDecode(response.body));
        busesData.value = busesResponse;
        busesLoading.value = false;
        log("Buses: ${response.body}");
      } else {
        busesLoading.value = false;
        Get.rawSnackbar(message: "Something went wrong");
      }
    });
  }

  Future<void> postLodgingChoices() async {
    hotelSuccess.value = false;
    try {
      var response = await ApiClient().postRequest(
          "http://10.0.2.2:8000/api/travel-cost",
          selectedLodgeModel.value.toJson());
      if (response.statusCode == 200) {
        hotelSuccess.value = true;
        Get.rawSnackbar(message: "Lodging success");
        log("Lodging Response: ${response.body}");
      } else {
        hotelSuccess.value = false;
        Get.rawSnackbar(message: "Lodging request failed");
      }
    } catch (e) {
      Get.rawSnackbar(message: "Error: $e");
    } finally {
      checkAndNavigate();
    }
  }

  Future<void> postAirlineChoices() async {
    airlineSuccess.value = false;
    try {
      var response = await ApiClient().postRequest(
          "http://10.0.2.2:8000/api/travel-cost",
          selectedAirlineModel.value.toJson());

      if (response.statusCode == 200) {
        airlineSuccess.value = true;
        Get.rawSnackbar(message: "Airline success");
        log("Airline Response: ${response.body}");
      } else {
        airlineSuccess.value = false;
        Get.rawSnackbar(message: "Airline request failed");
      }
    } catch (e) {
      Get.rawSnackbar(message: "Error: $e");
    } finally {
      checkAndNavigate();
    }
  }

  Future<void> postBusChoices() async {
    busSuccess.value = false;
    try {
      var response = await ApiClient().postRequest(
          "http://10.0.2.2:8000/api/travel-cost",
          selectedBusesModel.value.toJson());

      if (response.statusCode == 200) {
        busSuccess.value = true;
        Get.rawSnackbar(message: "Bus success");
        log("Bus Response: ${response.body}");
      } else {
        busSuccess.value = false;
        Get.rawSnackbar(message: "Bus request failed");
      }
    } catch (e) {
      Get.rawSnackbar(message: "Error: $e");
    } finally {
      checkAndNavigate();
    }
  }

  void checkAndNavigate() {
    if (busOrAirline.value) {
      if (airlineSuccess.value && hotelSuccess.value) {
        Get.offAllNamed(Routes.ESTIMATED_COST);
      }
    } else {
      if (busSuccess.value && hotelSuccess.value) {
        Get.offAllNamed(Routes.ESTIMATED_COST);
      }
    }
  }
}
