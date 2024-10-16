import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vendor/common/appbar.dart';
import 'package:multi_vendor/common/heading.dart';
import 'package:multi_vendor/controllers/category_controller.dart';
import 'package:multi_vendor/view/Home/all_nearby_restaurants.dart';
import 'package:multi_vendor/view/Home/fast_food.dart';
import 'package:multi_vendor/view/Home/recommended.dart';
import 'package:multi_vendor/view/Home/widgets/category_list.dart';
import 'package:multi_vendor/view/food/widget/food_list.dart';
import 'package:multi_vendor/view/Home/widgets/nearby_Reastlist.dart';

import 'widgets/category_Food_List.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(130.h), child: const CustomAppBar()),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
            children: [
              const CategoryList(),
              Obx(
                () => controller.categoryValue == ''
                    ? Column(
                        children: [
                          Heading(
                              text: 'Try Something New',
                              onTap: () {
                                Get.to(() => const Recommended(),
                                    transition: Transition.cupertino,
                                    duration:
                                        const Duration(milliseconds: 900));
                              }),
                          const FoodList(),
                          Heading(
                              text: 'Nearby Restaurants',
                              onTap: () {
                                Get.to(() => const AllNearbyRestaurants(),
                                    transition: Transition.cupertino,
                                    duration:
                                        const Duration(milliseconds: 900));
                              }),
                          const NearbyRestaurants(),
                          Heading(
                              text: ' Food closer to you',
                              onTap: () {
                                Get.to(() => const FastFood(),
                                    transition: Transition.cupertino,
                                    duration:
                                        const Duration(milliseconds: 900));
                              }),
                          const FoodList(),
                          const SizedBox(
                            height: 70,
                          ),
                        ],
                      )
                    : Container(
                        child: Column(
                          children: [
                            Heading(
                                more: true,
                                text:
                                    ' Explore ${controller.titleValue} Category',
                                onTap: () {
                                  Get.to(() => const Recommended(),
                                      transition: Transition.cupertino,
                                      duration:
                                          const Duration(milliseconds: 900));
                                }),
                            const CategoryFoodList()
                          ],
                        ),
                      ),
              ),
            ],
          )),
        ));
  }
}
