import 'dart:convert';

// AddressModel addressModelFromJson(String str) =>
//     AddressModel.fromJson(json.decode(str));

String addressModelToJson(AddressModel data) => json.encode(data.toJson());

class AddressModel {
  String addressLine1;
  String postalCode;
  bool addressModelDefault;
  String deliveryInstructions;

  AddressModel({
    required this.addressLine1,
    required this.postalCode,
    required this.addressModelDefault,
    required this.deliveryInstructions,
  });

  Map<String, dynamic> toJson() => {
        "addressLine1": addressLine1,
        "postalCode": postalCode,
        "addressModelDefault": addressModelDefault,
        "deliveryInstructions": deliveryInstructions,
      };
}
