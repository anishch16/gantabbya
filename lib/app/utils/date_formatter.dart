import 'package:intl/intl.dart';

class TimeUtils{

  String formatDate(String inputDate) {
    // Parse the input string into a DateTime object
    DateTime parsedDate = DateTime.parse(inputDate);

    // Create a formatter for the desired output format
    DateFormat outputFormat = DateFormat('yyyy-MM-dd');

    // Format the date using the formatter
    String formattedDate = outputFormat.format(parsedDate);

    return formattedDate;
  }

  String formatDateInMonth(String input) {
    // Parse the input string into a DateTime object
    DateTime dateTime = DateTime.parse(input);

    // Format the DateTime object as "MMM dd" (e.g., "Dec 05")
    String formattedDate = DateFormat('MMM dd').format(dateTime);

    return formattedDate;
  }

  String formatDateInMonthYear(String input) {
    // Parse the input string into a DateTime object
    DateTime dateTime = DateTime.parse(input);

    // Format the DateTime object as "MMM dd" (e.g., "Dec 05")
    String formattedDate = DateFormat('MMM dd yyyy').format(dateTime);

    return formattedDate;
  }

  String timeGetter(String input) {
    DateTime date = DateTime.parse(input);
    String hour = date.hour.toString().padLeft(2, '0'); // Ensure two digits for hour
    String minute = date.minute.toString().padLeft(2, '0'); // Ensure two digits for minute
    String amPm = date.hour < 12 ? 'AM' : 'PM'; // Determine if it's AM or PM
    int hourIn12HourFormat = date.hour % 12;
    hourIn12HourFormat = hourIn12HourFormat == 0 ? 12 : hourIn12HourFormat;
    String time = "$hourIn12HourFormat:$minute$amPm";
    return time;
  }



  String calculateTimeDifference(String inputDate) {
    // Parse the input string into a DateTime object
    DateTime inputDateTime = DateTime.parse(inputDate);

    // Get the current time
    DateTime now = DateTime.now();
    // Calculate the time difference
    Duration difference = now.difference(inputDateTime);
    // Calculate days, hours, minutes, and seconds
    int days = difference.inDays;
    int hours = difference.inHours.remainder(24);
    int minutes = difference.inMinutes.remainder(60);
    int seconds = difference.inSeconds.remainder(60);

    // Build the result string
    if (days > 0) {
      return '$days day${days == 1 ? "" : "s"} ago';
    } else if (hours > 0) {
      return '$hours hour${hours == 1 ? "" : "s"} ago';
    } else if (minutes > 0) {
      return '$minutes minute${minutes == 1 ? "" : "s"} ago';
    } else {
      return 'just now';
    }
  }}