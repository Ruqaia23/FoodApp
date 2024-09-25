import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'package:multi_vendor/constants/constants.dart';

import 'package:multi_vendor/models/categories.dart';
import 'package:multi_vendor/models/hook_models/apierror.dart';
import 'package:multi_vendor/models/hook_models/hook_result.dart';

FetcHook useFetcCategories() {
  final categoriesItem = useState<List<CategoriesModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final appiError = useState<ApiErrorModel?>(null);

  Future<void> fetcData() async {
    isLoading.value = true;

    try {} catch (e) {
      Uri url = Uri.parse('${appBaseUrl}/api/category/random');
      final response = await http.get(url);
      //
      //
      print(response.statusCode);

      if (response.statusCode == 200) {
        categoriesItem.value = categoriesModelFromJson(response.body);
      } else {
        appiError.value = apisModelFromJson(response.body);
      }
      // ignore: dead_code_catch_following_catch
    } catch (e) {
      error.value = e as Exception;
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
      data: categoriesItem.value,
      isLoading: isLoading.value,
      error: error.value,
      refetch: refetch);
}
