import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


import '../../../data/remote/api_client.dart';
import '../../../data/remote/api_urls.dart';
import '../../../data/remote/models/destination_model.dart';

class AllDestinationController extends GetxController {
  //TODO: Implement AllDestinationController

  final count = 0.obs;
  final isLoading = true.obs;
  final destinationData = DestinationResponse().obs;
  final TextEditingController searchController = TextEditingController();
  final RxList<Destination> filteredDestinations = <Destination>[].obs;


  @override
  void onReady() {
    super.onReady();
    loadPopularDestinations();
    searchController.addListener(_filterDestinations);
  }

  @override
  void onClose() {
    searchController.removeListener(_filterDestinations);
    searchController.dispose();
    super.onClose();
  }
  Future<void> loadPopularDestinations() async {
    isLoading.value = true;
    Future<http.Response> response = ApiClient().getRequest(ApiUrls.DESTINATIONS);
    response.then((http.Response response) {
      if (response.statusCode == 200) {
        log("Destination: ${response.body}");
        DestinationResponse destinationResponse = DestinationResponse.fromJson(jsonDecode(response.body));
        destinationData.value = destinationResponse;
        destinationData.value = DestinationResponse(
          error: destinationResponse.error,
          message: destinationResponse.message,
          data: destinationResponse.data,
        );
        filteredDestinations.value = destinationData.value.data ?? [];
        isLoading.value = false;
      } else {
        isLoading.value = false;
        Get.rawSnackbar(message: "Please input the correct credentials.");
      }
    });
  }
  void _filterDestinations() {
  final query = searchController.text.toLowerCase();
  List<Destination> results = [];
  
  if (query.isEmpty) {
    results = destinationData.value.data ?? [];
  } else {
    final destinations = destinationData.value.data ?? [];
    for (final destination in destinations) {
      // Convert each field to lowercase for case-insensitive matching.
      final name = (destination.name ?? "").toLowerCase();
      final description = (destination.description ?? "").toLowerCase();
      final location = (destination.location ?? "").toLowerCase();
      
      // Check if the query is contained in any of these fields.
      if (name.contains(query) ||
          description.contains(query) ||
          location.contains(query)) {
        results.add(destination);
      }
    }
  }
  
  filteredDestinations.value = results;
}
  // void _filterDestinations() {
  //   final query = searchController.text.toLowerCase();
  //   if (query.isEmpty) {
  //     filteredDestinations.value = destinationData.value.data ?? [];
  //   } else {
  //     filteredDestinations.value =
  //         (destinationData.value.data ?? []).where((destination) => (destination.name ?? "").toLowerCase().contains(query)).toList();
  //   }
  // }
}
