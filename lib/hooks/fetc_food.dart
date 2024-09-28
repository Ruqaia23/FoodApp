import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/models/hook_models/apierror.dart';
import 'package:multi_vendor/models/hook_models/food_model.dart';
import 'package:multi_vendor/models/hook_models/hook_result.dart';

FetcHook useFetcFood() {
  final foods = useState<List<FoodsModel>?>([]);
  final isLoading = useState<bool>(false);
  final error = useState<dynamic>(
      null); // Change to dynamic to handle different error types
  final appiError = useState<ApiErrorModel?>(null);

  Future<void> fetcData() async {
    isLoading.value = true;

    try {
      Uri url = Uri.parse('${appBaseUrl}/api/foods/recommendation/41007428');
      final response = await http.get(url);
      // print("${response.statusCode} gooddd food 1");
      // print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        foods.value = foodsModelFromJson(response.body);
      } else {
        appiError.value = apisModelFromJson(response.body);
      }
    } catch (e) {
      // Handle any error without casting it to Exception
      //  error.value = e is Exception ? e : Exception(e.toString());
      debugPrint(e.toString());
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
    data: foods.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
