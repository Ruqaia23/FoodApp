import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vendor/common/app_style.dart';
import 'package:multi_vendor/common/reusable_text.dart';
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/models/address_respon.dart';

class AddressTile extends StatelessWidget {
  const AddressTile({super.key, required this.address});

  final AddressResponse address;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        //
      },
      visualDensity: VisualDensity.compact,
      leading: Icon(
        Icons.location_pin,
        color: kPrimary,
        size: 28.h,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      title: ReusableText(
        text: address.addressLine1,
        style: appStyle(11, Colors.black, FontWeight.w500),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReusableText(
            text: address.postalCode,
            style: appStyle(11, kgray, FontWeight.w500),
          ),
          ReusableText(
            text: 'Tap to set as default',
            style: appStyle(8, kgray, FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
