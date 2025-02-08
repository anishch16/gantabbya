import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../data/remote/models/destination_model.dart';

class AllDestinationController extends GetxController {
  //TODO: Implement AllDestinationController

  final count = 0.obs;
  final isLoading = true.obs;
  final destinationData = DestinationResponse().obs;
  final TextEditingController searchController = TextEditingController();
  final RxList<Destination> filteredDestinations = <Destination>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

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
    try {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 2));
      final String jsonString = await rootBundle.loadString('assets/jsons/destination_list.json');
      DestinationResponse destinationResponse = DestinationResponse.fromJson(jsonString);
      destinationData.value = destinationResponse;
      filteredDestinations.value = destinationData.value.data ?? [];
    } catch (e) {
      log("Error loading destinations: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void _filterDestinations() {
    final query = searchController.text.toLowerCase();
    if (query.isEmpty) {
      filteredDestinations.value = destinationData.value.data ?? [];
    } else {
      filteredDestinations.value =
          (destinationData.value.data ?? []).where((destination) => (destination.name ?? "").toLowerCase().contains(query)).toList();
    }
  }
}
