import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vendor/common/shimmers/nearby_shimmer.dart';
import 'package:multi_vendor/hooks/fetch_restaurants.dart';
import 'package:multi_vendor/models/hook_models/restaurant_model.dart';
import 'package:multi_vendor/view/Home/widgets/restaurant_widget.dart';

class NearbyRestaurants extends HookWidget {
  const NearbyRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = fetchRestaurants();
    List<RestaurantModel>? restaurants = hookResults.data;
    final isLoading = hookResults.isLoading;

    return Container(
      height: 200.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: isLoading
          ? const NearbyShimmer()
          : ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(restaurants!.length, (i) {
                RestaurantModel restaurant = restaurants[i];
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RestaurantWidget(
                      image: restaurant.imageUrl!,
                      logo: restaurant.logoUrl!,
                      title: restaurant.title!,
                      time: restaurant.time!,
                      ratting: restaurant.ratingCount!,
                    ));
              }),
            ),
    );
  }
}
