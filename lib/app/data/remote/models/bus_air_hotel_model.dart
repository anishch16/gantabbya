class BusAirHotelModel {
  final int? error;
  final String? message;
  final List<BusAirHotelData>? data;
  final int? page;
  final int? size;
  final int? count;

  BusAirHotelModel({
    this.error,
    this.message,
    this.data,
    this.page,
    this.size,
    this.count,
  });

  factory BusAirHotelModel.fromJson(Map<String, dynamic> json) {
    return BusAirHotelModel(
      error: json['error'],
      message: json['message'],
      data: json['data'] != null
          ? List<BusAirHotelData>.from(json['data'].map((x) => BusAirHotelData.fromJson(x)))
          : null,
      page: json['page'],
      size: json['size'],
      count: json['count'],
    );
  }
}

class BusAirHotelData {
  final int? id;
  final String? createdAt;
  final String? name;
  final double? price;
  final double? rating;
  final double? timeTaken;
  final String? remarks;
  final int? destinationID;

  BusAirHotelData({
    this.id,
    this.createdAt,
    this.name,
    this.price,
    this.rating,
    this.timeTaken,
    this.remarks,
    this.destinationID,
  });

  factory BusAirHotelData.fromJson(Map<String, dynamic> json) {
    return BusAirHotelData(
      id: json['id'],
      createdAt: json['createdAt'],
      name: json['name'],
      price: json['price'],
      rating: json['rating'],
      timeTaken: json['timeTaken'],
      remarks: json['remarks'],
      destinationID: json['destinationID'],
    );
  }
}

