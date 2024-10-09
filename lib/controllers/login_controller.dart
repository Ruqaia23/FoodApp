import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:multi_vendor/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:multi_vendor/main.dart';
import 'package:multi_vendor/models/apierror.dart';
import 'package:multi_vendor/models/login_response.dart';
import 'package:multi_vendor/view/auth/widget/verification.dart';

class LoginController extends GetxController {
  final box = GetStorage();

  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set setloading(bool newState) {
    _isLoading.value = newState;
  }

  void loginFunction(String data) async {
    print('login data : $data');
    setloading = true;

    Uri url = Uri.parse('$appBaseUrl/login');
    Map<String, String> headers = {' Content-Type': 'application/json'};

    try {
      var response = await http.post(url, headers: headers, body: data);
      print(response.statusCode);

      if (response.statusCode == 200) {
        var data = loginResponseFromJson(response.body);
        String userId = data.id!;
        String userData = jsonEncode(data);

        box.write(userId, userData);
        box.write('token', data.userToken);
        box.write('userId', data.id);
        box.write('verification', data.verification);

        setloading = false;

        Get.snackbar('You are logged in  ', 'Enjoy ',
            colorText: kOffwhite,
            backgroundColor: KSecondary,
            icon: const Icon(Icons.fastfood_outlined));
        if (data.verification == false) {
          Get.offAll(
            () => const VerificationPage(),
          );
        }
        if (data.verification == true) {
          Get.offAll(
            () => const MyApp(),
          );
        }

        Get.offAll(() => const MyApp());
      } else {
        var error = apisModelFromJson(response.body);
        Get.snackbar('Failed to login  ', error.message!,
            colorText: kOffwhite,
            backgroundColor: KSecondary,
            icon: const Icon(Icons.error_outline));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void logout() {
    box.erase();
    Get.offAll(() => const MyApp());
  }

  LoginResponse? getUserInfo() {
    String? userId = box.read("userId");
    String? data;
    if (userId != null) {
      data = box.read(userId.toString());
    }

    if (data != null) {
      return loginResponseFromJson(data);
    }
    return null;
  }
}
