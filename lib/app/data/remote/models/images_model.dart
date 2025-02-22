import 'dart:convert';

class NepalNatureResponse {
  final int? error;
  final String? message;
  final List<CategoryData>? data;
  final int? page;
  final int? size;
  final int? count;

  NepalNatureResponse({
    this.error,
    this.message,
    this.data,
    this.page,
    this.size,
    this.count,
  });

  // Update the fromJson method to handle a Map<String, dynamic> directly
  factory NepalNatureResponse.fromJson(Map<String, dynamic> jsonMap) {
    return NepalNatureResponse(
      error: jsonMap['error'] as int?,
      message: jsonMap['message'] as String?,
      data: (jsonMap['data'] as List<dynamic>?)
          ?.map((e) => CategoryData.fromJson(e as Map<String, dynamic>))
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
      'data': data?.map((category) => category.toJson()).toList(),
      'page': page,
      'size': size,
      'count': count,
    });
  }
}


class CategoryData {
  final int? id;
  final String? name;
  final String? url;
  final String? slug;
  final DateTime? createdAt;

  CategoryData({
    this.id,
    this.name,
    this.url,
    this.slug,
    this.createdAt,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) {
    return CategoryData(
      id: json['id'] as int?,
      name: json['name'] as String?,
      url: json['url'] as String?,
      slug: json['slug'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'url': url,
      'slug': slug,
      'created_at': createdAt?.toIso8601String(),
    };
  }
}
