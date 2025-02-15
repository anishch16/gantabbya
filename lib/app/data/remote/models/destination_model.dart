import 'dart:convert';

class Destination {
  final int? id;
  final String? name;
  final String? description;
  final String? destinationType;
  final String? location;
  final String? image;
  final double? latitude;
  final double? longitude;
  final DateTime? createdAt;
  final double? popularity;

  Destination({
    this.id,
    this.name,
    this.description,
    this.destinationType,
    this.location,
    this.image,
    this.latitude,
    this.longitude,
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
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      popularity: (json['popularity'] as num?)?.toDouble(),
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
      'latitude': latitude,
      'longitude': longitude,
      'created_at': createdAt?.toIso8601String(),
      'popularity': popularity,
    };
  }
}

class DestinationResponse {
  final int? error;
  final String? message;
  final List<Destination>? data;
  final int? page;
  final int? size;
  final int? count;

  DestinationResponse({
    this.error,
    this.message,
    this.data,
    this.page,
    this.size,
    this.count,
  });

  factory DestinationResponse.fromJson(Map<String, dynamic> jsonMap) {
    return DestinationResponse(
      error: jsonMap['error'] as int?,
      message: jsonMap['message'] as String?,
      data: (jsonMap['data'] as List<dynamic>?)
          ?.map((json) => Destination.fromJson(json as Map<String, dynamic>))
          .toList(),
      page: jsonMap['page'] as int?,
      size: jsonMap['size'] as int?,
      count: jsonMap['count'] as int?,
    );
  }


  String toJson() {
    return jsonEncode({
      'error': error,
      'message': message,
      'data': data?.map((destination) => destination.toJson()).toList(),
      'page': page,
      'size': size,
      'count': count,
    });
  }
}
