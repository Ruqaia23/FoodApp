// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vendor/common/app_style.dart';
import 'package:multi_vendor/common/reusable_text.dart';

import 'package:multi_vendor/constants/constants.dart';

class RestaurantTile extends StatelessWidget {
  const RestaurantTile({
    super.key,
    required this.restaurants,
  });
  final dynamic restaurants;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
                            restaurants['imageUrl'],
                            fit: BoxFit.cover,
                          ),
                        ),
                        // Positioned(
                        //   bottom: 0,
                        //   child: Container(
                        //     padding: EdgeInsets.only(left: 6.w, bottom: 2.h),
                        //     color: kgray.withOpacity(0.6),
                        //     height: 16.h,
                        //     width: width,
                        //     child: RatingBarIndicator(
                        //       rating: 5,
                        //       itemCount: 5,
                        //       itemBuilder: (context, i) => const Icon(
                        //         Icons.star,
                        //         color: KSecondary,
                        //       ),
                        //       itemSize: 15.h,
                        //     ),
                        //   ),
                        // ),
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
                            text: restaurants['title'],
                            style: appStyle(11, Colors.black, FontWeight.w400)),
                        ReusableText(
                            text: "Delivery time ${restaurants['time']}",
                            style: appStyle(11, kgray, FontWeight.w400)),
                        SizedBox(
                          width: width * 0.7,
                          child: Text(
                            restaurants['coords']['address'].toString(),
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
                color: restaurants['isAvailable'] == true ||
                        restaurants['isAvailable'] != null
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
