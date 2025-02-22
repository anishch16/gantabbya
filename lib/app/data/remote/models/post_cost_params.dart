import 'dart:convert';
import 'package:intl/intl.dart'; // Import DateFormat for formatting DateTime

class PostCostParams {
  final int? userID;
  final String? title;
  final double? price;
  final DateTime? startDate;
  final DateTime? endDate;
  final int? destinationID;

  PostCostParams({
    this.userID,
    this.title,
    this.price,
    this.startDate,
    this.endDate,
    this.destinationID,
  });

  /// Convert object to JSON format for API requests
  Map<String, dynamic> toJson() {
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd'); // Format DateTime
    return {
      "userID": userID,
      "title": title,
      "price": price,
      "start_date": startDate != null ? dateFormat.format(startDate!) : null, // Convert DateTime to String
      "end_date": endDate != null ? dateFormat.format(endDate!) : null,       // Convert DateTime to String
      "destinationID": destinationID,
    };
  }

  /// Factory constructor to create object from JSON
  factory PostCostParams.fromJson(Map<String, dynamic> json) {
    return PostCostParams(
      userID: json["userID"] as int?,
      title: json["title"] as String?,
      price: (json["price"] as num?)?.toDouble(),
      startDate: json["start_date"] != null ? DateTime.parse(json["start_date"]) : null,
      endDate: json["end_date"] != null ? DateTime.parse(json["end_date"]) : null,
      destinationID: json["destinationID"] as int?,
    );
  }

  /// Convert object to JSON string
  String toJsonString() => jsonEncode(toJson());
}
