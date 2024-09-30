import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vendor/common/custom_button.dart';
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/controllers/food_controller.dart';
import 'package:multi_vendor/models/food_model.dart';
import 'package:multi_vendor/view/restaurant/restaurant_page.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key, required this.food});
  final FoodsModel food;

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FoodController());
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(30),
                ),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox(
                      height: 230.h,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: widget.food.imageUrl?.length ?? 0,
                        onPageChanged: (i) {
                          controller.changePage(i);
                        },
                        itemBuilder: (context, i) {
                          return Container(
                            height: 230.h,
                            width: double.infinity,
                            color: Colors.white,
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: widget.food.imageUrl![i],
                              placeholder: (context, url) => Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          );
                        },
                      ),
                    ),
                    // Page indicator
                    Positioned(
                      bottom: 10.h,
                      child: Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            widget.food.imageUrl?.length ?? 0,
                            (index) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 4.w),
                                width: controller.currentPage == index
                                    ? 12.w
                                    : 8.w,
                                height: controller.currentPage == index
                                    ? 12.h
                                    : 8.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: controller.currentPage == index
                                      ? kPrimary // Highlight active indicator
                                      : Colors.grey.withOpacity(0.5),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),

                    // Back button
                    Positioned(
                      top: 40.h,
                      left: 12.w,
                      child: GestureDetector(
                        onTap: () {
                          Get.back(); // Navigate back
                        },
                        child: Container(
                          padding: EdgeInsets.all(8.w),
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(147, 48, 185, 178),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 20.w,
                          ),
                        ),
                      ),
                    ),

                    // Go to Restaurant button
                    Positioned(
                      bottom: 10.h,
                      right: 12.w,
                      child: CustomButton(
                        onTap: () {
                          Get.to(() => const RestaurantPage());
                        },
                        btnWidth: 120.w,
                        text: 'Open Restaurant',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
