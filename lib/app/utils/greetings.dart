import 'package:flutter/material.dart';

String getGreetingMessage() {
  // Get the current time
  final DateTime now = DateTime.now();
  final int hour = now.hour;

  // Define greeting based on the current hour
  if (hour >= 5 && hour < 12) {
    return "Good morning";
  } else if (hour >= 12 && hour < 17) {
    return "Good afternoon";
  } else if (hour >= 17 && hour < 20) {
    return "Good evening";
  } else {
    return "Good night";
  }
}
IconData getGreetingIcon() {
  // Get the current time
  final DateTime now = DateTime.now();
  final int hour = now.hour;

  // Define icon based on the current hour
  if (hour >= 5 && hour < 12) {
    return Icons.wb_sunny; // Morning icon
  } else if (hour >= 12 && hour < 17) {
    return Icons.wb_cloudy; // Afternoon icon
  } else if (hour >= 17 && hour < 20) {
    return Icons.sunny_snowing; // Evening icon (optional)
  } else {
    return Icons.nights_stay; // Night icon
  }
}

Color getGreetingColor() {
  // Get the current time
  final DateTime now = DateTime.now();
  final int hour = now.hour;

  // Define color based on the current hour
  if (hour >= 5 && hour < 12) {
    return Colors.orangeAccent; // Morning color
  } else if (hour >= 12 && hour < 17) {
    return Colors.blueAccent; // Afternoon color
  } else if (hour >= 17 && hour < 20) {
    return Colors.purpleAccent; // Evening color
  } else {
    return Colors.indigo; // Night color
  }
}
