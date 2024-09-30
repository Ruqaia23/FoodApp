import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vendor/common/shimmers/foodlist_shimmer.dart';
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/hooks/fetc_category_food.dart';
import 'package:multi_vendor/models/food_model.dart';
import 'package:multi_vendor/view/Home/widgets/food_tile.dart';

class CategoryFoodList extends HookWidget {
  const CategoryFoodList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetcFoodByCategory('41007428');
    List<FoodsModel>? foods = hookResults.data;
    bool isLoading = hookResults.isLoading;

    return SizedBox(
        width: width,
        height: height,
        child: isLoading
            ? FoodsListShimmer()
            : Padding(
                padding: EdgeInsets.all(12.h),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: List.generate(foods.length, (i) {
                    FoodsModel food = foods[i];
                    return FoodTile(
                      food: food,
                    );
                  }),
                ),
              ));
  }
}
