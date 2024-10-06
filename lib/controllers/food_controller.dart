import 'package:get/get.dart';
import 'package:multi_vendor/models/additive.obs.dart';
import 'package:multi_vendor/models/food_model.dart';

class FoodController extends GetxController {
  RxInt currentPage = 0.obs;
  bool initialCheckValue = false;
  var additivesList = <AdditivesObs>[].obs;

  void changePage(int index) {
    currentPage.value = index;
  }

  RxInt count = 1.obs;

  void increment() {
    count.value++;
  }

  void decrement() {
    if (count.value > 1) {
      count.value--;
    }
  }

  void loadAdditives(List<Additives> additives) {
    additivesList.clear();

    for (var additivesInfo in additives) {
      var additive = AdditivesObs(
          id: additivesInfo.id,
          title: additivesInfo.title,
          price: additivesInfo.price,
          Checked: initialCheckValue);
      if (additives.length == additivesList.length) {
      } else {
        additivesList.add(additive);
      }
    }
  }

  RxDouble _totalPrice = 0.0.obs;
  double get additivePrice => _totalPrice.value;
  set setTotalPrice(double newPrice) {
    _totalPrice.value = newPrice;
  }

  double getTotalPrice() {
    double totalPrice = 0.0;

    for (var additive in additivesList) {
      if (additive.isChecked.value) {
        totalPrice += double.tryParse(additive.price!) ?? 0.0;
      }
    }
    setTotalPrice = totalPrice;
    return totalPrice;
  }
}
