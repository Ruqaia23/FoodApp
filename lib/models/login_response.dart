// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  String? id;
  String? username;
  String? email;
  String? fcm;
  bool? verification;
  String? phone;
  bool? phoneVerification;
  String? userType;
  String? profile;
  int? totalPoints;
  String? userToken;

  LoginResponse({
    this.id,
    this.username,
    this.email,
    this.fcm,
    this.verification,
    this.phone,
    this.phoneVerification,
    this.userType,
    this.profile,
    this.totalPoints,
    this.userToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        id: json["_id"] ?? '',
        username: json["username"] ?? '',
        email: json["email"] ?? '',
        fcm: json["fcm"] ?? '',
        verification: json["verification"] ?? false,
        phone: json["phone"] ?? '',
        phoneVerification: json["phoneVerification"] ?? false,
        userType: json["userType"] ?? '',
        profile: json["profile"] ?? '',
        totalPoints: json["totalPoints"] ?? 0,
        userToken: json["userToken"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": email,
        "fcm": fcm,
        "verification": verification,
        "phone": phone,
        "phoneVerification": phoneVerification,
        "userType": userType,
        "profile": profile,
        "totalPoints": totalPoints,
        "userToken": userToken,
      };
}
