import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/models/apierror.dart';
import 'package:multi_vendor/models/food_model.dart';
import 'package:http/http.dart' as http;

class SearchFoodControllerr extends GetxController {
  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set setLoading(bool value) {
    _isLoading.value = value;
  }

  final RxBool _isTrigered = false.obs;

  bool get isTrigered => _isTrigered.value;

  set setTrigered(bool value) {
    _isLoading.value = value;
  }

  List<FoodsModel>? searchResilts;

  void searchFoods(String key) async {
    setLoading = true;

    Uri url = Uri.parse('$appBaseUrl/api/foods/search/$key');

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        searchResilts = foodsModelFromJson(response.body);
        setLoading = false;
      } else {
        setLoading = false;
        var error = apisModelFromJson(response.body);
      }
    } catch (e) {
      setLoading = false;
      debugPrint(e.toString());
    }
  }
}
