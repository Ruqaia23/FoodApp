import 'dart:convert';
import 'package:get/get.dart';
import 'package:latlng/latlng.dart';

import 'package:http/http.dart' as http;
import 'package:multi_vendor/constants/constants.dart';

class UserLocationController extends GetxController {
  LatLng position = LatLng.degree(0, 0);

  void setPosition(LatLng value) {
    position = value;
    update();
  }

  RxString _address = ''.obs;
  String get address => _address.value;

  set setAddress(String value) {
    _address.value = value;
  }

  RxString _postalCode = ''.obs;
  String get postalCode => _postalCode.value;

  set setPostalCode(String value) {
    _postalCode.value = value;
  }

  void getUserAddress(LatLng position) async {
    // طباعة الإحداثيات
    print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');

    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$googleApiKey');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);

      final address = responseBody['results'][0]['formatted_address'];
      setAddress = address;

      final addressComponents =
          responseBody['results'][0]['address_components'];

      for (var component in addressComponents) {
        if (component['types'].contains('postal_code')) {
          setPostalCode = component['long_name'];
        }
      }
    }
  }
}
