import 'package:flutter/material.dart';
import 'package:multi_vendor/common/app_style.dart';
import 'package:multi_vendor/constants/constants.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffwhite,
        title: Text(
          'Category Page',
          style: appStyle(20, kgray, FontWeight.w600),
        ),
      ),
      body: const Center(
        child: Text('Category Page'),
      ),
    );
  }
}
