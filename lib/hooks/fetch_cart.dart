import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/models/apierror.dart';
import 'package:multi_vendor/models/cart_response.dart';
import 'package:multi_vendor/models/hook_models/hook_result.dart';

FetcHook useFetcCart() {
  final box = GetStorage();
  final cart = useState<List<CartResponse>?>([]);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiErrorModel?>(null);

  Future<void> fetchData() async {
    final accessToken = box.read('token');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };
    isLoading.value = true;

    try {
      Uri url = Uri.parse('$appBaseUrl/api/cart');
      final response = await http.get(url, headers: headers);
      // print("Status Code: ${response.statusCode}");
      // print("URL: $url");
      // print("Response: ${response.body}");

      if (response.statusCode == 200) {
        cart.value = cartResponseFromJson(response.body);
        apiError.value = null;
      } else {
        apiError.value = apisModelFromJson(response.body);
        cart.value = null;
      }
    } catch (e) {
      error.value = e is Exception ? e : null;
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, []);

  void refetch() {
    fetchData();
  }

  return FetcHook(
    data: cart.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
