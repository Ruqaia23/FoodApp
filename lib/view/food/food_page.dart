import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vendor/common/app_style.dart';
import 'package:multi_vendor/common/custom_button.dart';
import 'package:multi_vendor/common/custom_text_field.dart';
import 'package:multi_vendor/common/reusable_text.dart';
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/controllers/food_controller.dart';
import 'package:multi_vendor/hooks/fetch_restarantt.dart';
import 'package:multi_vendor/models/food_model.dart';
import 'package:multi_vendor/view/food/widget/add_to_cart.dart';
import 'package:multi_vendor/view/food/widget/food_tags.dart';
import 'package:multi_vendor/view/restaurant/restaurant_page.dart';

class FoodPage extends StatefulHookWidget {
  const FoodPage({super.key, required this.food});
  final FoodsModel food;

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final TextEditingController _preferences = TextEditingController();
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final hookResult = fetchRestaurantt(widget.food.restaurant!);

    final controller = Get.put(FoodController());
    controller.loadAdditives(widget.food.additives!);
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
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
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
                          Get.to(() => RestaurantPage(
                                restaurent: hookResult.data!,
                              ));
                        },
                        btnWidth: 120.w,
                        text: 'Open Restaurant',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ReusableText(
                            text: widget.food.title!,
                            style: appStyle(15, Colors.black, FontWeight.w600),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        widget.food.description!,
                        textAlign: TextAlign.justify,
                        maxLines: 8,
                        style: appStyle(13, kgray, FontWeight.w400),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      food_tags(widget: widget),
                      SizedBox(
                        height: 20.h,
                      ),

                      //جزئيه تعديل والاضافه للطلب
                      ReusableText(
                        text: 'Additives and Toppings',
                        style: appStyle(15, Colors.black, FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Obx(
                        () => Column(
                          children: List.generate(
                              controller.additivesList.length, (index) {
                            final additive = controller.additivesList[index];

                            return CheckboxListTile(
                                contentPadding: EdgeInsets.zero,
                                visualDensity: VisualDensity.compact,
                                dense: true,
                                activeColor:
                                    const Color.fromARGB(147, 48, 185, 178),
                                value: additive.isChecked.value,
                                tristate: false,
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ReusableText(
                                      text: additive.title!,
                                      style: appStyle(
                                          11, Colors.black, FontWeight.w400),
                                    ),
                                    ReusableText(
                                      text: "  \$ ${additive.price.toString()}",
                                      style: appStyle(
                                          11, kPrimary, FontWeight.w600),
                                    ),
                                  ],
                                ),
                                onChanged: (bool? value) {
                                  additive.toggleChecked();
                                  controller.getTotalPrice();
                                  controller.getCartAdditive();
                                });
                          }),
                        ),
                      ),

                      SizedBox(
                        height: 20.h,
                      ),
                      ReusableText(
                        text: "Preferences",
                        style: appStyle(15, Colors.black, FontWeight.w600),
                      ),

                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 65.h,
                        child: CustomTextField(
                          controller: _preferences,
                          hintText: 'Add a note ',
                          maxLines: 3,
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),

                      AddToCart(widget: widget, controller: controller),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
