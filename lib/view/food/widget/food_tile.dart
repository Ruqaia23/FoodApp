import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vendor/common/app_style.dart';
import 'package:multi_vendor/common/reusable_text.dart';

import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/controllers/cart_controller.dart';
import 'package:multi_vendor/models/cart_request.dart';
import 'package:multi_vendor/models/food_model.dart';
import 'package:multi_vendor/view/food/food_page.dart';

class FoodTile extends StatelessWidget {
  FoodTile({
    super.key,
    required this.food,
  });
  FoodsModel food;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    return GestureDetector(
      onTap: () {
        Get.to(() => FoodPage(food: food));
      },
      child: Column(
        // clipBehavior: Clip.hardEdge,
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
              padding: EdgeInsets.all(2.r),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                          food.imageUrl![0],
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
                          text: food.title!,
                          style: appStyle(11, Colors.black, FontWeight.w400)),
                      ReusableText(
                          text: "Delivery time ${food.time}",
                          style: appStyle(11, kgray, FontWeight.w400)),
                      ReusableText(
                          text: "\$ ${food.price.toString()}",
                          style: appStyle(9, KSecondary, FontWeight.bold)),
                      SizedBox(
                        width: width * 0.8,
                        height: 16.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: food.additives!.length,
                          itemBuilder: (context, i) {
                            Additives addittive = food.additives![i];
                            return Container(
                              margin: EdgeInsets.only(right: 5.w),
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(130, 255, 164, 79),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(9.r))),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(2.h),
                                  child: ReusableText(
                                      text: addittive.title!,
                                      style:
                                          appStyle(10, kgray, FontWeight.w400)),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Column(children: [
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        var data = CartRequestModel(
                          productId: food.sId!,
                          additives: [],
                          quantity: 1,
                          totalPrice: food.price!,
                        );

                        String cart = cartRequestModelToJson(data);

                        controller.addToCart(cart);
                      },
                      child: Icon(
                        Icons.add,
                        size: 20.h,
                      ),
                    ),
                  ),
                ]),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
