import 'dart:convert';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/models/address_respon.dart';
import 'package:multi_vendor/models/apierror.dart';
import 'package:multi_vendor/models/hook_models/hook_result.dart';

FetcHook useFetcdefaultAddresses() {
  final box = GetStorage();
  final addresses = useState<AddressResponse?>(null);
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
      Uri url = Uri.parse('$appBaseUrl/api/address/default');
      final response = await http.get(url, headers: headers);
      print("Status Code: ${response.statusCode}");
      print("URL: $url");
      print("Response: ${response.body}");

      if (response.statusCode == 200) {
        var data = response.body;
        var decoded = jsonDecode(data);
        addresses.value = AddressResponse.fromJson(decoded);
        apiError.value = null; // Clear previous errors if any
      } else {
        apiError.value = apisModelFromJson(response.body);
        addresses.value = null; // Clear data if API error occurs
      }
    } catch (e) {
      error.value = e as Exception;
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
    data: addresses.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
