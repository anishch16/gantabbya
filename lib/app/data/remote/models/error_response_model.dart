class ErrorResponseModel {
  int? error;
  String? message;
  dynamic data;

  ErrorResponseModel({this.error, this.message, this.data});

  ErrorResponseModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['message'] = message;
    data['data'] = this.data;
    return data;
  }
}