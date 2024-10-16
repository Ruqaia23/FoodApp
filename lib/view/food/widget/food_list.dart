import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vendor/common/shimmers/nearby_shimmer.dart';
import 'package:multi_vendor/hooks/fetc_food.dart';
import 'package:multi_vendor/models/food_model.dart';
import 'package:multi_vendor/view/Home/widgets/food_widget.dart';
import 'package:multi_vendor/view/food/food_page.dart';

class FoodList extends HookWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetcFood();
    List<FoodsModel>? foods = hookResults.data;
    final isLoading = hookResults.isLoading;

    return Container(
      height: 184.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: isLoading
          ? const NearbyShimmer()
          : ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(foods.length, (i) {
                FoodsModel food = foods[i];
                return FoodWidget(
                  onTap: () {
                    Get.to(() => FoodPage(food: food));
                  },
                  image: food.imageUrl![0],
                  title: food.title!,
                  time: food.time!,
                  price: food.price.toString(),
                );
              }),
            ),
    );
  }
}
