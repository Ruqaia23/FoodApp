import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/models/apierror.dart';
import 'package:multi_vendor/models/food_model.dart';
import 'package:multi_vendor/models/hook_models/foods_hooks.dart';

FetcFoodds useRestaurantFoods(String id) {
  final foods = useState<List<FoodsModel>?>([]);
  final isLoading = useState<bool>(false);
  final error = useState<dynamic>(null);
  final appiError = useState<ApiErrorModel?>(null);

  Future<void> fetcData() async {
    isLoading.value = true;

    try {
      Uri url = Uri.parse('$appBaseUrl/api/foods/restaurant-foods/$id');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        foods.value = foodsModelFromJson(response.body);
      } else {
        appiError.value = apisModelFromJson(response.body);
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    Future.delayed(const Duration(seconds: 3));
    fetcData();

    return null;
  }, []);

  void refetch() {
    isLoading.value = true;
    fetcData();
  }

  return FetcFoodds(
    data: foods.value!,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
