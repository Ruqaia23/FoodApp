import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vendor/common/app_style.dart';
import 'package:multi_vendor/common/custom_button.dart';
import 'package:multi_vendor/common/reusable_text.dart';
import 'package:multi_vendor/common/shimmers/foodlist_shimmer.dart';
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/hooks/fetch_address.dart';
import 'package:multi_vendor/models/address_respon.dart';
import 'package:multi_vendor/view/Profile/shipping.dart';
import 'package:multi_vendor/view/Profile/widget/address_list.dart';

class Addresses extends HookWidget {
  const Addresses({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetcAllAddresses();

    final List<AddressResponse> addresses = hookResult.data ?? [];
    final isLoading = hookResult.isLoading;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffwhite,
        title: ReusableText(
          text: 'My Addresses',
          style: appStyle(13.sp, kgray, FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: kOffwhite,
          child: Column(
            children: [
              Expanded(
                child: isLoading
                    ? const FoodsListShimmer()
                    : AddressListWidgt(addresses: addresses),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: CustomButton(
                  onTap: () {
                    Get.to(() => const ShippingAddress());
                  },
                  text: 'Add Address',
                  btncolor: kPrimary,
                  btnHeight: 45,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
