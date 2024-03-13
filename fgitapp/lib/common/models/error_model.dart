// ignore_for_file: prefer_collection_literals

class ErrorModel {
  int? code;
  bool? success;
  String? message;
  dynamic details;

  ErrorModel({this.code, this.success, this.message, this.details});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
    message = json['message'];
    details = json['details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = code;
    data['success'] = success;
    data['message'] = message;
    data['details'] = details;
    return data;
  }
}
