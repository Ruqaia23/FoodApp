import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/controllers/search_controller.dart';
import 'package:multi_vendor/models/food_model.dart';
import 'package:multi_vendor/view/food/widget/food_tile.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFoodControllerr());
    return Container(
      padding: EdgeInsets.fromLTRB(12.w, 10.h, 12.h, 0),
      height: height,
      child: ListView.builder(
          itemCount: controller.searchResilts!.length,
          itemBuilder: (context, i) {
            FoodsModel food = controller.searchResilts![i];
            return FoodTile(food: food);
          }),
    );
  }
}
