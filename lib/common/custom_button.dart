import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vendor/common/app_style.dart';
import 'package:multi_vendor/common/reusable_text.dart';
import 'package:multi_vendor/constants/constants.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      this.onTap,
      this.btnWidth,
      this.btnHeight,
      this.btncolor,
      this.radius,
      required this.text});
  final void Function()? onTap;
  final double? btnWidth;
  final double? btnHeight;
  final Color? btncolor;
  final double? radius;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: btnWidth ?? width,
          height: btnHeight ?? 28.h,
          decoration: BoxDecoration(
            color: btncolor ?? Color.fromARGB(147, 48, 185, 178),
            borderRadius: BorderRadius.circular(radius ?? 9.r),
          ),
          child: Center(
            child: ReusableText(
                text: text, style: appStyle(12, Colors.white, FontWeight.w500)),
          ),
        ));
  }
}
