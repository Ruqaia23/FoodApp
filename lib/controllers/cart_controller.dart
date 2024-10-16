import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/models/success_model.dart';

class CartController extends GetxController {
  final box = GetStorage();
  RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set setisLoading(bool value) {
    _isLoading.value = value;
  }

  void addToCart(String cart) async {
    setisLoading = true;

    String accessToken = box.read('token');

    var url = Uri.parse('$appBaseUrl/api/cart');
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    try {
      var response = await http.post(url, headers: headers, body: cart);
      if (response.statusCode == 201) {
        setisLoading = false;

        Get.snackbar('Added to cart ', '✨',
            colorText: kOffwhite,
            snackPosition: SnackPosition.TOP,
            backgroundColor: KSecondary);
      } else {
        var error = apisModelFromJson(response.body);
        Get.snackbar('Error', error.message!,
            colorText: kOffwhite,
            snackPosition: SnackPosition.TOP,
            backgroundColor: KSecondary);
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setisLoading = false;
    }
  }

  void removeFromCart(String productId, Function refetch) async {
    setisLoading = true;

    String accessToken = box.read('token');

    var url = Uri.parse('$appBaseUrl/api/cart/delete/$productId');
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    try {
      var response = await http.delete(
        url,
        headers: headers,
      );
      if (response.statusCode == 200) {
        setisLoading = false;

        //   Get.snackbar('Pr ', '✨',
        //       colorText: kOffwhite,
        //       snackPosition: SnackPosition.TOP,
        //       backgroundColor: KSecondary);
        // } else {
        //   var error = apisModelFromJson(response.body);
        //   Get.snackbar('Error', error.message!,
        //       colorText: kOffwhite,
        //       snackPosition: SnackPosition.TOP,
        //       backgroundColor: KSecondary);
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setisLoading = false;
    }
  }
}
