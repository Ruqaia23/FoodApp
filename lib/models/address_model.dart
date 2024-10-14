import 'dart:convert';

AddressModel addressModelFromJson(String str) =>
    AddressModel.fromJson(json.decode(str));

String addressModelToJson(AddressModel data) => json.encode(data.toJson());

class AddressModel {
  String? addressLine1;
  String? city;
  String? district;
  String? state;
  String? postalCode;
  bool? addressModelDefault;
  String? country;
  String? deliveryInstructions;

  AddressModel({
    required this.addressLine1,
    this.city,
    this.district,
    this.state,
    required this.postalCode,
    required this.addressModelDefault,
    this.country,
    required this.deliveryInstructions,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        addressLine1: json["addressLine1"],
        city: json["city"],
        district: json["district"],
        state: json["state"],
        postalCode: json["postalCode"],
        addressModelDefault: json["default"],
        country: json["country"],
        deliveryInstructions: json["deliveryInstructions"],
      );

  Map<String, dynamic> toJson() => {
        "addressLine1": addressLine1,
        "city": city,
        "district": district,
        "state": state,
        "postalCode": postalCode,
        "default": addressModelDefault,
        "country": country,
        "deliveryInstructions": deliveryInstructions,
      };
}
