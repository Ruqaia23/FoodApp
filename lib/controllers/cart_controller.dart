import 'package:get/get.dart';

class CartController extends GetxController {
  RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set setisLoading(bool value) {
    _isLoading.value = value;
  }
}
