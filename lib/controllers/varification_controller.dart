import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:multi_vendor/common/bottom_bar.dart';
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/models/login_response.dart';
import 'package:http/http.dart' as http;
import 'package:multi_vendor/models/success_model.dart';

class VarificationController extends GetxController {
  final box = GetStorage();
  String _code = '';
  String get code => _code;

  set setCode(String value) {
    _code = value;
  }

  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set setloading(bool value) {
    _isLoading.value = value;
  }

  // ignore: non_constant_identifier_names
  void varificationFunction() async {
    setloading = true;
    String accessToken = box.read('token');

    Uri url = Uri.parse('$appBaseUrl/api/users/verify/$code');
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    try {
      var response = await http.post(
        url,
        headers: headers,
      );

      if (response.statusCode == 200) {
        var data = loginResponseFromJson(response.body);

        String userId = data.id!;
        String userData = jsonEncode(data);

        box.write(userId, userData);
        box.write('token', data.userToken);
        box.write('userId', data.id);
        box.write('verification', data.verification);

        setloading = false;

        Get.snackbar('You are succefully verified ', 'Enjoy ',
            colorText: kOffwhite,
            backgroundColor: KSecondary,
            icon: const Icon(Icons.fastfood_outlined));

        if (data.verification == true) {
          Get.offAll(
            () => BottomBar(),
          );
        }

        // Get.offAll(() => const VerificationPage());
      } else {
        var error = apisModelFromJson(response.body);
        Get.snackbar('Failed to verify  ', error.message!,
            colorText: kOffwhite,
            backgroundColor: KSecondary,
            icon: const Icon(Icons.error_outline));

        Get.offAll(() => BottomBar());
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
