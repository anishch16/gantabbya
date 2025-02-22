import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/remote/api_client.dart';
import '../../../data/remote/models/bus_air_hotel_model.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class SetDestinationController extends GetxController {
  final selectedBus = (-1).obs;
  final selectedLodge = (-1).obs;
  final selectedAirline = (-1).obs;

  //start and end date
  var startDateFilled = false.obs;
  var endDateFilled = false.obs;


  //endDate starting value
  var  startDateForEndValue = DateTime.now().obs;
  DateTime? parseStartDateText(String text) {
    DateTime? parsedDate;
    try {
      parsedDate = DateTime.parse(text);
    } on FormatException {
      parsedDate = null;
    }
    return parsedDate;
  }

  //continue button enabling
  var letsCalculateEnabled = false.obs;

  // final individualController = TextEditingController();
  var startDate = TextEditingController();
  var endDate = TextEditingController();
  var hotelData = BusAirHotelModel().obs;
  var airlineData = BusAirHotelModel().obs;
  var busesData = BusAirHotelModel().obs;

  //for loaders
  var hotelLoading = false.obs;
  var airlinesLoading = false.obs;
  var busesLoading = false.obs;

  //arguments
  final arguments = Get.arguments;

  //to fetch data according to location
  var locationId = "".obs;

  //bus or airline defining
  var busOrAirline = false.obs;

//optimal choices
  var highestRatedBus = BusAirHotelData().obs;
  var highestRatedAir = BusAirHotelData().obs;
  var highestRatedHotel = BusAirHotelData().obs;

//Selected models
  final selectedLodgeModel = BusAirHotelData().obs;
  final selectedAirlineModel = BusAirHotelData().obs;
  final selectedBusesModel = BusAirHotelData().obs;

  void letsCalculate() {
    log("calculate called");
    if (startDate.value.text.isNotEmpty &&
        endDate.value.text.isNotEmpty &&
        ((selectedBus.value != -1) || (selectedAirline.value != -1)) &&
        (selectedLodge.value != -1)) {
      letsCalculateEnabled.value = true;
      log("letsCalculateEnabled: ${letsCalculateEnabled.value}");
    } else {
      letsCalculateEnabled.value = false;
      log("letsCalculateDisabled: ${letsCalculateEnabled.value}");
    }
  }

  @override
  void onReady() {
    super.onReady();
    log("Location id: ${(arguments["location"]).toString()}");
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
        log("Hotels data: ${response.body}");
        BusAirHotelModel hotelResponse =
            BusAirHotelModel.fromJson(jsonDecode(response.body));
        hotelData.value = hotelResponse;
        // BusAirHotelData? highestHotel =
        //     greedySearchHighestRatedBus(hotelData.value.data ?? []);
        BusAirHotelData? highestHotel = optimalChoiceFind(
          hotelData.value.data ?? [],
          getPrice: (hotel) => hotel.price ?? double.infinity,
          getRating: (hotel) => hotel.rating ?? 0.0,
        );
        highestRatedHotel.value = highestHotel ?? BusAirHotelData();
        log("Highest Rated Hotel: ${highestRatedHotel.value.name}");

        hotelLoading.value = false;
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
      log("Airlines data: ${response.body}");
      if (response.statusCode == 200) {
        BusAirHotelModel airlineResponse =
            BusAirHotelModel.fromJson(jsonDecode(response.body));
        airlineData.value = airlineResponse;
        // BusAirHotelData? highestAir =
        //     greedySearchHighestRatedBus(airlineData.value.data ?? []);
        BusAirHotelData? highestAir = optimalChoiceFind(
          airlineData.value.data ?? [],
          getPrice: (airline) => airline.price ?? double.infinity,
          getRating: (airline) => airline.rating ?? 0.0,
        );
        highestRatedAir.value = highestAir ?? BusAirHotelData();
        log("Highest Rated Airlines: ${highestRatedAir.value}");
        airlinesLoading.value = false;
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
      log("Buses data: ${response.body}");
      if (response.statusCode == 200) {
        BusAirHotelModel busesResponse =
            BusAirHotelModel.fromJson(jsonDecode(response.body));
        busesData.value = busesResponse;
        // BusAirHotelData? highestBus =
        //     greedySearchHighestRatedBus(busesData.value.data ?? []);
        BusAirHotelData? highestBus = optimalChoiceFind(
          busesData.value.data ?? [],
          getPrice: (bus) => bus.price ?? double.infinity,
          getRating: (bus) => bus.rating ?? 0.0,
        );
        highestRatedBus.value = highestBus ?? BusAirHotelData();
        log("Highest Rated Bus: ${highestRatedBus.value}");

        busesLoading.value = false;
      } else {
        busesLoading.value = false;
        Get.rawSnackbar(message: "Something went wrong");
      }
    });
  }

//greedy search for highest rated bus
  BusAirHotelData? greedySearchHighestRatedBus(List<BusAirHotelData> buses) {
    if (buses.isEmpty) return null;

    BusAirHotelData? lowestCostBus = buses[0];

    for (BusAirHotelData bus in buses) {
      if ((bus.price ?? double.infinity) <
          (lowestCostBus?.price ?? double.infinity)) {
        lowestCostBus = bus;
      } else if ((bus.price ?? double.infinity) ==
          (lowestCostBus?.price ?? double.infinity)) {
        if ((bus.rating ?? 0.0) > (lowestCostBus?.rating ?? 0.0)) {
          lowestCostBus = bus;
        }
      }
    }
    return lowestCostBus;
  }

//greedy search for highest rated hotel
  BusAirHotelData? greedySearchHighestRatedHotel(List<BusAirHotelData> buses) {
    if (buses.isEmpty) return null;

    BusAirHotelData? lowestCostBus = buses[0];

    for (BusAirHotelData bus in buses) {
      if ((bus.price ?? double.infinity) <
          (lowestCostBus?.price ?? double.infinity)) {
        lowestCostBus = bus;
      } else if ((bus.price ?? double.infinity) ==
          (lowestCostBus?.price ?? double.infinity)) {
        if ((bus.rating ?? 0.0) > (lowestCostBus?.rating ?? 0.0)) {
          lowestCostBus = bus;
        }
      }
    }
    return lowestCostBus;
  }

//greedy search for highest Airlines
  BusAirHotelData? greedySearchHighestRatedAirline(
      List<BusAirHotelData> buses) {
    if (buses.isEmpty) return null;

    BusAirHotelData? lowestCostBus = buses[0];

    for (BusAirHotelData bus in buses) {
      if ((bus.price ?? double.infinity) <
          (lowestCostBus?.price ?? double.infinity)) {
        lowestCostBus = bus;
      } else if ((bus.price ?? double.infinity) ==
          (lowestCostBus?.price ?? double.infinity)) {
        if ((bus.rating ?? 0.0) > (lowestCostBus?.rating ?? 0.0)) {
          lowestCostBus = bus;
        }
      }
    }
    return lowestCostBus;
  }


//Greedy Search Algorithm
//Takes that value which have the lowest price
//If the price is same then it takes the value which has the highest rating
  BusAirHotelData? optimalChoiceFind(
    List<BusAirHotelData> items, {
    required double Function(BusAirHotelData item) getPrice,
    required double Function(BusAirHotelData item) getRating,
  }) {
    if (items.isEmpty) return null;

    BusAirHotelData? optimalChoice = items[0];

    for (BusAirHotelData item in items) {
      if ((getPrice(item)) < (getPrice(optimalChoice!))) {
        optimalChoice = item;
      } else if ((getPrice(item)) == (getPrice(optimalChoice))) {
        if ((getRating(item)) > (getRating(optimalChoice))) {
          optimalChoice = item;
        }
      }
    }
    return optimalChoice;
  }
}
