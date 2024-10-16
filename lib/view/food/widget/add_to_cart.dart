import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vendor/common/app_style.dart';
import 'package:multi_vendor/common/reusable_text.dart';
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/controllers/cart_controller.dart';
import 'package:multi_vendor/controllers/food_controller.dart';
import 'package:multi_vendor/hooks/fetch_restarantt.dart';
import 'package:multi_vendor/models/cart_request.dart';
import 'package:multi_vendor/models/order_request.dart';
import 'package:multi_vendor/models/restaurant_model.dart';
import 'package:multi_vendor/view/food/food_page.dart';
import 'package:multi_vendor/view/food/widget/increment_decremen_box.dart';
import 'package:multi_vendor/view/order/order_page.dart';

class AddToCart extends HookWidget {
  AddToCart({
    super.key,
    required this.widget,
    required this.controller,
  });

  final FoodPage widget;
  final FoodController controller;
  final TextEditingController _preferences = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final hookResult = fetchRestaurantt(widget.food.restaurant!);

    final cartController = Get.put(CartController());
    final RestaurantModel? resraurentdata = hookResult.data;

    return Padding(
      padding: const EdgeInsets.only(left: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Add to Cart Button
          Container(
            height: 48.h,
            width: 230.w,
            decoration: BoxDecoration(
              color: kPrimary,
              borderRadius: BorderRadius.circular(9.r),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GestureDetector(
                onTap: () {
                  // Prepare Cart Request
                  var data = CartRequestModel(
                    productId: widget.food.sId!,
                    additives: controller.getCartAdditive(),
                    quantity: controller.count.value,
                    totalPrice:
                        (widget.food.price! + controller.additivePrice) *
                            controller.count.value,
                  );

                  // Convert to JSON
                  String cart = cartRequestModelToJson(data);

                  // Add to Cart
                  cartController.addToCart(cart);

                  OrderItem item = OrderItem(
                      foodId: widget.food.sId!,
                      quantity: controller.count.value,
                      price: (widget.food.price! + controller.additivePrice) *
                          controller.count.value,
                      additives: controller.getCartAdditive(),
                      instructions: _preferences.text);

                  // Navigate to the OrderPage after adding to cart
                  //

                  Get.to(() => OrderPage(
                        restaurant: resraurentdata,
                        food: widget.food,
                        item: item,
                      ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableText(
                      text: 'Add To Cart',
                      style: appStyle(15, Colors.black, FontWeight.w600),
                    ),
                    Obx(() => ReusableText(
                          text:
                              "\$ ${(widget.food.price! + controller.additivePrice) * controller.count.value}",
                          style: appStyle(15, kwhite, FontWeight.w600),
                        )),
                  ],
                ),
              ),
            ),
          ),
          increment_decremen_box(controller: controller),
        ],
      ),
    );
  }
}
