import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:multi_vendor/common/shimmers/foodlist_shimmer.dart';
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/hooks/fetc_food.dart';
import 'package:multi_vendor/models/food_model.dart';
import 'package:multi_vendor/view/Home/widgets/food_tile.dart';

class RestaurantExplore extends HookWidget {
  const RestaurantExplore({super.key, required this.code});

  final String code;

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetcFood();
    final foods = hookResults.data;
    final isLoading = hookResults.isLoading;

    return Scaffold(
      backgroundColor: kOffwhite,
      body: isLoading
          ? const FoodsListShimmer()
          : SizedBox(
              height: height * 0.7,
              child: ListView(
                  padding: EdgeInsets.zero,
                  children: List.generate(foods.length, (index) {
                    final FoodsModel food = foods[index];
                    return FoodTile(food: food);
                  })),
            ),
    );
  }
}
