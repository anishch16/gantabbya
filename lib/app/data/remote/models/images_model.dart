import 'dart:convert';

class CategoryData {
  final String? category;
  final List<Place>? places;

  CategoryData({this.category, this.places});

  factory CategoryData.fromJson(Map<String, dynamic> json) {
    return CategoryData(
      category: json['category'] as String?,
      places: (json['places'] as List<dynamic>?)?.map((e) => Place.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'places': places?.map((e) => e.toJson()).toList(),
    };
  }
}

class Place {
  final String? image;
  final String? name;

  Place({this.image, this.name});

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      image: json['image'] as String?,
      name: json['text'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'text': name,
    };
  }
}

class NepalNatureResponse {
  final int? error;
  final String? message;
  final List<CategoryData>? data;

  NepalNatureResponse({
    this.error,
    this.message,
    this.data,
  });

  factory NepalNatureResponse.fromJson(String jsonString) {
    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return NepalNatureResponse(
      error: jsonMap['error'] as int?,
      message: jsonMap['message'] as String?,
      data: (jsonMap['data'] as List<dynamic>?)?.map((e) => CategoryData.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }

  String toJson() {
    return jsonEncode({
      'error': error,
      'message': message,
      'data': data?.map((category) => category.toJson()).toList(),
    });
  }
}