import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/models/apierror.dart';
import 'package:http/http.dart' as http;
import 'package:multi_vendor/view/auth/widget/login_page.dart';

class SignupController extends GetxController {
  final box = GetStorage();

  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set setloading(bool newState) {
    _isLoading.value = newState;
  }

  void SignupFunction(String data) async {
    setloading = true;

    Uri url = Uri.parse('$appBaseUrl/register');
    Map<String, String> headers = {'Content-Type': 'application/json'};

    try {
      var response = await http.post(url, headers: headers, body: data);
      print(response.statusCode);

      if (response.statusCode == 201) {
        var data = apisModelFromJson(response.body);
        setloading = false;

        Get.snackbar('You are succefully signUp   ', data.message!,
            colorText: kOffwhite,
            backgroundColor: KSecondary,
            icon: const Icon(
              Icons.celebration_outlined,
              color: Colors.red,
            ));

        Get.offAll(() => const LoginPage());
      } else {
        var error = apisModelFromJson(response.body);
        Get.snackbar('Failed to Signup  ', error.message!,
            colorText: kOffwhite,
            backgroundColor: KSecondary,
            icon: const Icon(Icons.error_outline));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
