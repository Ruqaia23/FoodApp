import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vendor/common/app_style.dart';
import 'package:multi_vendor/common/reusable_text.dart';
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/constants/uidata.dart';
import 'package:multi_vendor/view/Home/widgets/food_tile.dart';

class Recommended extends StatelessWidget {
  const Recommended({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffwhite,
        title: ReusableText(
          text: 'Recomended',
          style: appStyle(20, kgray, FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: Padding(
          padding: EdgeInsets.all(12.h),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: List.generate(foods.length, (i) {
              var food = foods[i];
              return FoodTile(
                food: food,
              );
            }),
          ),
        ),
      ),
    );
  }
}
