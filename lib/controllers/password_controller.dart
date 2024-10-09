import 'package:get/get.dart';

class PasswordController extends GetxController {
  RxBool _pass = false.obs;

  bool get password => _pass.value;

  set setPasseord(bool newState) {
    _pass.value = newState;
  }
}
