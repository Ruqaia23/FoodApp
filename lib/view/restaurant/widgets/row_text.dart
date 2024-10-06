import 'package:flutter/material.dart';
import 'package:multi_vendor/common/app_style.dart';
import 'package:multi_vendor/common/reusable_text.dart';
import 'package:multi_vendor/constants/constants.dart';

class RowText extends StatelessWidget {
  const RowText({super.key, required this.first, required this.second});

  final String first;
  final String second;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ReusableText(
          text: first,
          style: appStyle(10, kgray, FontWeight.w500),
        ),
        ReusableText(
          text: second,
          style: appStyle(10, kgray, FontWeight.w500),
        ),
      ],
    );
  }
}
