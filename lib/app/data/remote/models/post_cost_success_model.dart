import 'dart:convert';

class PostCostSuccessModel {
  final int? id;
  final String? title;
  final double? price;
  final String? startDate;
  final String? endDate;
  final int? destinationID;
  final int? userID;

  PostCostSuccessModel({
    this.id,
    this.title,
    this.price,
    this.startDate,
    this.endDate,
    this.destinationID,
    this.userID,
  });

  factory PostCostSuccessModel.fromJson(Map<String, dynamic> json) {
    return PostCostSuccessModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      destinationID: json['destinationID'] as int?,
      userID: json['userID'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'start_date': startDate,
      'end_date': endDate,
      'destinationID': destinationID,
      'userID': userID,
    };
  }
}

class PostCostSuccessModelResponse {
  final int? error;
  final String? message;
  final PostCostSuccessModel? data;

  PostCostSuccessModelResponse({
    this.error,
    this.message,
    this.data,
  });

  factory PostCostSuccessModelResponse.fromJson(Map<String, dynamic> jsonMap) {
    return PostCostSuccessModelResponse(
      error: jsonMap['error'] as int?,
      message: jsonMap['message'] as String?,
      data: jsonMap['data'] != null
          ? PostCostSuccessModel.fromJson(jsonMap['data'])
          : null,
    );
  }

  String toJson() {
    return jsonEncode({
      'error': error,
      'message': message,
      'data': data?.toJson(),
    });
  }
}
