class WeatherData {
  double? latitude;
  double? longitude;
  double? generationtimeMs;
  int? utcOffsetSeconds;
  String? timezone;
  String? timezoneAbbreviation;
  int? elevation;
  HourlyUnits? hourlyUnits;
  Hourly? hourly;

  WeatherData({
    this.latitude,
    this.longitude,
    this.generationtimeMs,
    this.utcOffsetSeconds,
    this.timezone,
    this.timezoneAbbreviation,
    this.elevation,
    this.hourlyUnits,
    this.hourly,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      latitude: json['latitude']?.toDouble(), // Ensure latitude is a double
      longitude: json['longitude']?.toDouble(), // Ensure longitude is a double
      generationtimeMs: json['generationtime_ms']?.toDouble(), // Ensure this is a double
      utcOffsetSeconds: json['utc_offset_seconds'],
      timezone: json['timezone'],
      timezoneAbbreviation: json['timezone_abbreviation'],
      elevation: json['elevation']?.toInt(), // Ensure elevation is an int
      hourlyUnits: json['hourly_units'] != null ? HourlyUnits.fromJson(json['hourly_units']) : null,
      hourly: json['hourly'] != null ? Hourly.fromJson(json['hourly']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'generationtime_ms': generationtimeMs,
      'utc_offset_seconds': utcOffsetSeconds,
      'timezone': timezone,
      'timezone_abbreviation': timezoneAbbreviation,
      'elevation': elevation,
      'hourly_units': hourlyUnits?.toJson(),
      'hourly': hourly?.toJson(),
    };
  }
}

class HourlyUnits {
  String? time;
  String? temperature2m;
  String? relativeHumidity2m;
  String? windSpeed10m;

  HourlyUnits({
    this.time,
    this.temperature2m,
    this.relativeHumidity2m,
    this.windSpeed10m,
  });

  factory HourlyUnits.fromJson(Map<String, dynamic> json) {
    return HourlyUnits(
      time: json['time'],
      temperature2m: json['temperature_2m'],
      relativeHumidity2m: json['relative_humidity_2m'],
      windSpeed10m: json['wind_speed_10m'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'temperature_2m': temperature2m,
      'relative_humidity_2m': relativeHumidity2m,
      'wind_speed_10m': windSpeed10m,
    };
  }
}

class Hourly {
  List<String>? time;
  List<dynamic>? temperature2m;
  List<dynamic>? relativeHumidity2m;
  List<dynamic>? windSpeed10m;

  Hourly({
    this.time,
    this.temperature2m,
    this.relativeHumidity2m,
    this.windSpeed10m,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) {
    return Hourly(
      time: List<String>.from(json['time'] ?? []),
      temperature2m: _convertListToType(json['temperature_2m'], double),
      relativeHumidity2m: _convertListToType(json['relative_humidity_2m'], int),
      windSpeed10m: _convertListToType(json['wind_speed_10m'], double),
    );
  }

  // Helper method to handle conversion for lists with mixed types
  static List<T> _convertListToType<T>(dynamic data, Type type) {
    if (data == null) return [];
    if (type == double) {
      return List<T>.from(data.map((item) => (item is int) ? item.toDouble() : item));
    } else if (type == int) {
      return List<T>.from(data.map((item) => (item is double) ? item.toInt() : item));
    }
    return [];
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'temperature_2m': temperature2m,
      'relative_humidity_2m': relativeHumidity2m,
      'wind_speed_10m': windSpeed10m,
    };
  }
}
