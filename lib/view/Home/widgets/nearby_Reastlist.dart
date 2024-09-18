import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vendor/constants/uidata.dart';
import 'package:multi_vendor/view/Home/widgets/restaurant_widget.dart';

class NearbyRestaurants extends StatelessWidget {
  const NearbyRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(restaurants.length, (i) {
          var restaurant = restaurants[i];
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: RestaurantWidget(
                image: restaurant['imageUrl'],
                logo: restaurant['logoUrl'],
                title: restaurant['title'],
                time: restaurant['time'],
                ratting: restaurant['ratingCount'],
              ));
        }),
      ),
    );
  }
}
