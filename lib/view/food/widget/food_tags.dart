import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vendor/common/app_style.dart';
import 'package:multi_vendor/common/reusable_text.dart';
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/view/food/food_page.dart';

class food_tags extends StatelessWidget {
  const food_tags({
    super.key,
    required this.widget,
  });

  final FoodPage widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 18.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(widget.food.foodTags!.length, (index) {
          final tag = widget.food.foodTags![index];
          return Container(
            margin: EdgeInsets.only(
              right: 5.w,
            ),
            decoration: BoxDecoration(
              color: kPrimary,
              borderRadius: BorderRadius.all(Radius.circular(15.r)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: ReusableText(
                text: tag,
                style: appStyle(11, Colors.white, FontWeight.w400),
              ),
            ),
          );
        }),
      ),
    );
  }
}
