import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vendor/common/shimmers/nearby_shimmer.dart';
import 'package:multi_vendor/hooks/fetc_food.dart';
import 'package:multi_vendor/models/hook_models/food_model.dart';
import 'package:multi_vendor/view/Home/widgets/food_widget.dart';

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
              children: List.generate(foods!.length, (i) {
                FoodsModel food = foods[i];
                return FoodWidget(
                  image: food.imageUrl![0],
                  title: food.title!,
                  time: food.time?.toString() ??
                      'N/A', // Convert int? to String with fallback
                  price: food.price?.toString() ?? 'N/A',
                );
              }),
            ),
    );
  }
}
