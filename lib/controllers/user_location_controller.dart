import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:latlng/latlng.dart';
import 'package:http/http.dart' as http;
import 'package:multi_vendor/constants/constants.dart';

class UserLocationController extends GetxController {
  RxBool _isDefault = false.obs;

  bool get isDefault => _isDefault.value;
  set setIsDefault(bool value) {
    _isDefault.value = value;
  }

  RxInt _tabIndex = 0.obs;
  int get tabIndex => _tabIndex.value;
  set setTabIndex(int value) {
    _tabIndex.value = value;
  }

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
    //  print(
    //    'Latitude: ${position.latitude}, Longitude: ${position.longitude}'); // استخدام القيم مباشرة
    // print("position.latitude");
    // print(position.latitude);
    // print("position.latitude");
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude.radians},${position.longitude.radians}&key=$googleApiKey');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      if (responseBody['results'].isNotEmpty) {
        // تأكد من وجود نتائج
        final address = responseBody['results'][0]['formatted_address'];
        setAddress = address;

        final addressComponents =
            responseBody['rsults'][0]['address_components'];
        for (var component in addressComponents) {
          if (component['types'].contains('postal_code')) {
            setPostalCode = component['long_name'];
          }
        }
      } else {
        print('No results found');
      }
      // } else {
      //   print('Error: ${response.statusCode}');
      // }
    }
  }

  void addAddress(String data) async {
    final box = GetStorage();
    final accessToken = box.read('token');

    Uri url = Uri.parse('$appBaseUrl/api/address');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    Map<String, dynamic> body = {
      'address': data,
      'addressLine1': data,
      'latitude': position.latitude.radians,
      'longitude': position.longitude.radians,
      'postalCode': postalCode.isEmpty ? '0000' : postalCode,
      'postal_Code': postalCode.isEmpty ? '0000' : postalCode,
    };

    try {
      var response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        print('Address added successfully');
      } else {
        print('Failed to add address: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
