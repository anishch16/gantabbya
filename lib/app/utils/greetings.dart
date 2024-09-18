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
