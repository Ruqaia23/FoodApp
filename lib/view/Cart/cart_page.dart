import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:multi_vendor/common/app_style.dart';
import 'package:multi_vendor/common/reusable_text.dart';
import 'package:multi_vendor/common/shimmers/foodlist_shimmer.dart';
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/controllers/login_controller.dart';
import 'package:multi_vendor/hooks/fetch_cart.dart';
import 'package:multi_vendor/models/cart_response.dart';
import 'package:multi_vendor/models/login_response.dart';
import 'package:multi_vendor/view/Cart/widget/cart_tile.dart';
import 'package:multi_vendor/view/Profile/widget/login_redirect.dart';

class CartPage extends HookWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetcCart();
    final List<CartResponse> carts = hookResult.data ?? [];
    final isLoading = hookResult.isLoading;
    final refetch = hookResult.refetch;

    final box = GetStorage();

    LoginResponse? user;
    final controller = Get.put(LoginController());

    String? token = box.read('token');
    if (token != null) {
      user = controller.getUserInfo();

      //print(user!.email);
    }

    if (token == null) {
      return const LoginRedirect();
    }
    // if (user != null && user.verification == false) {
    //   return BottomBar();
    // }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kOffwhite,
        elevation: 0,
        title: ReusableText(
            text: 'Cart', style: appStyle(14, kgray, FontWeight.w600)),
      ),
      body: SafeArea(
          child: isLoading
              ? const FoodsListShimmer()
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    width: width,
                    height: height,
                    child: ListView.builder(
                        itemCount: carts.length,
                        itemBuilder: (context, index) {
                          var cart = carts[0];
                          CartTile(
                            cart: cart,
                          );
                        }),
                  ),
                )),
    );
  }
}
