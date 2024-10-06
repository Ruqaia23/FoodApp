import 'package:get/get.dart';

class AdditivesObs extends GetxController {
  int? id;
  String? title;
  String? price;
  RxBool isChecked = false.obs;

  AdditivesObs({
    required this.id,
    required this.title,
    required this.price,
    bool Checked = false,
  }) {
    isChecked.value = Checked;
  }

  void toggleChecked() {
    isChecked.value = !isChecked.value;
  }
}
