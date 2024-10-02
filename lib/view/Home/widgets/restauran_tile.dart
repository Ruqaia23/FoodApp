import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vendor/common/app_style.dart';
import 'package:multi_vendor/common/reusable_text.dart';

import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/models/restaurant_model.dart';
import 'package:multi_vendor/view/restaurant/restaurant_page.dart';

// ignore: must_be_immutable
class RestaurantTile extends StatelessWidget {
  RestaurantTile({
    super.key,
    required this.restaurant,
  });
  RestaurantModel restaurant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => RestaurantPage(restaurent: restaurant));
      },
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8.h),
            height: 70.h,
            width: width,
            decoration: BoxDecoration(
              color: kOffwhite,
              borderRadius: BorderRadius.circular(9.r),
            ),
            child: Container(
              padding: EdgeInsets.all(4.r),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.r),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 70.w,
                          height: 70.h,
                          child: Image.network(
                            restaurant.imageUrl!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableText(
                            text: restaurant.title!,
                            style: appStyle(11, Colors.black, FontWeight.w400)),
                        ReusableText(
                            text: "Delivery time ${restaurant.time}",
                            style: appStyle(11, kgray, FontWeight.w400)),
                        SizedBox(
                          width: width * 0.7,
                          child: Text(
                            restaurant.coords!.address!,
                            overflow: TextOverflow.clip,
                            style: appStyle(9, kgray, FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: 5,
            top: 6.h,
            child: Container(
              width: 50.w,
              height: 20.h,
              decoration: BoxDecoration(
                color: restaurant.isAvailable == true ||
                        restaurant.isAvailable != false
                    ? const Color.fromARGB(113, 255, 164, 79)
                    : KSecondary,
                borderRadius: BorderRadius.circular(19.r),
              ),
              child: Center(
                  child: ReusableText(
                      text: 'Open',
                      style: appStyle(9, Colors.black, FontWeight.w500))),
            ),
          ),
        ],
      ),
    );
  }
}
