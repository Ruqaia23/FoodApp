import 'package:flutter/material.dart';
import 'package:multi_vendor/common/app_style.dart';
import 'package:multi_vendor/common/reusable_text.dart';
import 'package:multi_vendor/constants/constants.dart';

class FastFood extends StatelessWidget {
  const FastFood({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffwhite,
        title: ReusableText(
          text: 'Fastest Food',
          style: appStyle(20, kgray, FontWeight.w600),
        ),
      ),
    );
  }
}
