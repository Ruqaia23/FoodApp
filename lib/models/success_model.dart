import 'dart:convert';

SuccessModel apisModelFromJson(String str) =>
    SuccessModel.fromJson(json.decode(str));

String apisModelToJson(SuccessModel data) => json.encode(data.toJson());

class SuccessModel {
  final bool? status;
  final String? message;

  SuccessModel({required this.status, required this.message});

  factory SuccessModel.fromJson(Map<String, dynamic> json) {
    return SuccessModel(
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
