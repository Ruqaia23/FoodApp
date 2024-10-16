import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vendor/common/app_style.dart';
import 'package:multi_vendor/common/reusable_text.dart';
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/controllers/cart_controller.dart';
import 'package:multi_vendor/models/cart_response.dart';

class CartTile extends StatelessWidget {
  CartTile({
    super.key,
    required this.cart,
    this.refetch,
  });
  CartResponse cart;
  final Function()? refetch;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());

    return GestureDetector(
      onTap: () {},
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
                          cart.productId.imageUrl.firstOrNull ?? '',
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
                          text: cart.productId.title,
                          style: appStyle(11, Colors.black, FontWeight.w400)),
                      ReusableText(
                          text: "\$ ${cart.totalPrice.toString()}",
                          style: appStyle(9, KSecondary, FontWeight.bold)),
                      SizedBox(
                        width: width * 0.8,
                        height: 16.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: cart.additives.length,
                          itemBuilder: (context, i) {
                            var addittive = cart.additives[i];
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
                                      text: addittive,
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
                  Container(
                    width: 10.w,
                    height: 19.h,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          controller.removeFromCart(cart.id, refetch!);
                        },
                        child: Icon(
                          Icons.delete_outline,
                          size: 20.h,
                        ),
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
