import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vendor/common/app_style.dart';
import 'package:multi_vendor/common/reusable_text.dart';
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/controllers/food_controller.dart';

class increment_decremen_box extends StatelessWidget {
  const increment_decremen_box({
    super.key,
    required this.controller,
  });

  final FoodController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      width: 100,
      decoration: BoxDecoration(
          color: kPrimary, borderRadius: BorderRadius.circular(20.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            width: 2,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  controller.increment();
                },
                child: const Icon(Icons.add_rounded),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Obx(
                  () => ReusableText(
                      text: "${controller.count.value}",
                      style: appStyle(14, Colors.black, FontWeight.w600)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.decrement();
                },
                child: const Icon(Icons.remove),
              ),
            ],
          ),
          const SizedBox(
            width: 2,
          )
        ],
      ),
    );
  }
}
