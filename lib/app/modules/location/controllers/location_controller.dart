import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  // Rx variables for form state
  var startLocation = ''.obs;
  var endLocation = ''.obs;
  var startDate = DateTime.now().obs;
  var endDate = DateTime.now().obs;
  var transportation = ''.obs;
  var foodType = ''.obs;
  var hotelSelection = ''.obs;

  // Dummy data for dropdowns
  final List<String> locations = ['Kathmandu', 'Pokhara', 'Lumbini', 'Chitwan'];
  final List<String> transportationOptions = ['Bus', 'Car', 'Flight'];
  final List<String> foodTypes = ['Vegetarian', 'Non-Vegetarian', 'Vegan'];
  final List<String> hotelTypes = ['3-star', '4-star', '5-star'];

  // Date picker logic
  Future<void> selectDate(BuildContext context, Rx<DateTime> date) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      date.value = picked;
    }
  }

  // Submission Logic
  void submitForm() {
    print('Start Location: ${startLocation.value}');
    print('End Location: ${endLocation.value}');
    print('Start Date: ${startDate.value}');
    print('End Date: ${endDate.value}');
    print('Transportation: ${transportation.value}');
    print('Food Type: ${foodType.value}');
    print('Hotel Selection: ${hotelSelection.value}');
  }
}
