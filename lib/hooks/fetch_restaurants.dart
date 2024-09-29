import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/models/apierror.dart';
import 'package:multi_vendor/models/hook_models/hook_result.dart';
import 'package:multi_vendor/models/restaurant_model.dart';

FetcHook fetchRestaurants() {
  final restaurants = useState<List<RestaurantModel>?>([]);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiErrorModel?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;

    try {
      Uri url = Uri.parse('${appBaseUrl}/api/restaurant/41007428');
      final response = await http.get(url);

      // print("${response.statusCode} gooddd res");

      if (response.statusCode == 200) {
        restaurants.value = restaurantModelFromJson(response.body);
      } else {
        apiError.value = apisModelFromJson(response.body);
      }
    } catch (e) {
      // Handle any error without casting it to Exception
      //
      //error.value = e is Exception ? e : Exception(e.toString());

      // debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, []);

  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetcHook(
    data: restaurants.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
