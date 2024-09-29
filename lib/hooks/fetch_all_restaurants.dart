import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'package:multi_vendor/constants/constants.dart';

import 'package:multi_vendor/models/apierror.dart';
import 'package:multi_vendor/models/hook_models/hook_result.dart';
import 'package:multi_vendor/models/restaurant_model.dart';

FetcHook fetchAllRestaurants(String code) {
  final restaurants = useState<List<RestaurantModel>?>([]);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final appiError = useState<ApiErrorModel?>(null);

  Future<void> fetcData() async {
    isLoading.value = true;

    try {
      Uri url = Uri.parse('$appBaseUrl/api/restaurant/all/$code');
      final response = await http.get(url);
      // print("${response.statusCode} gooddd rest ");

      //
      //

      if (response.statusCode == 200) {
        restaurants.value = restaurantModelFromJson(response.body);
      } else {
        appiError.value = apisModelFromJson(response.body);
      }
    } catch (e) {
      //error.value = e as Exception;
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetcData();
    return null;
  }, []);

  void refetch() {
    isLoading.value = true;
    fetcData();
  }

  return FetcHook(
      data: restaurants.value,
      isLoading: isLoading.value,
      error: error.value,
      refetch: refetch);
}
