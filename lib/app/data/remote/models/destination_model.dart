import 'dart:convert';

class Destination {
  final int? id;
  final String? name;
  final String? description;
  final String? destinationType;
  final String? location;
  final String? image;
  final DateTime? createdAt;
  final String? popularity;

  Destination({
    this.id,
    this.name,
    this.description,
    this.destinationType,
    this.location,
    this.image,
    this.createdAt,
    this.popularity,
  });

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      destinationType: json['destination_type'] as String?,
      location: json['location'] as String?,
      image: json['image'] as String?,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'] as String) : null,
      popularity: json['popularity'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'destination_type': destinationType,
      'location': location,
      'image': image,
      'created_at': createdAt?.toIso8601String(),
      'popularity': popularity,
    };
  }

  static List<Destination> fromJsonList(String jsonString) {
    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    final List<dynamic> jsonData = jsonMap['data'] as List<dynamic>;
    return jsonData.map((json) => Destination.fromJson(json as Map<String, dynamic>)).toList();
  }
}

class DestinationResponse {
  final int? error;
  final String? message;
  final List<Destination>? data;

  DestinationResponse({
    this.error,
    this.message,
    this.data,
  });

  factory DestinationResponse.fromJson(String jsonString) {
    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return DestinationResponse(
      error: jsonMap['error'] as int?,
      message: jsonMap['message'] as String?,
      data: (jsonMap['data'] as List<dynamic>?)?.map((json) => Destination.fromJson(json as Map<String, dynamic>)).toList(),
    );
  }

  String toJson() {
    return jsonEncode({
      'error': error,
      'message': message,
      'data': data?.map((destination) => destination.toJson()).toList(),
    });
  }
}