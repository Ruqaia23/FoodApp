import 'dart:convert';

ApiErrorModel apisModelFromJson(String str) =>
    ApiErrorModel.fromJson(json.decode(str));

String apisModelToJson(ApiErrorModel data) => json.encode(data.toJson());

class ApiErrorModel {
  final bool? status;
  final String? message;

  ApiErrorModel({required this.status, required this.message});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      status: json['status'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}
