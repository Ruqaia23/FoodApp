import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vendor/common/app_style.dart';
import 'package:multi_vendor/common/reusable_text.dart';
import 'package:multi_vendor/common/shimmers/foodlist_shimmer.dart';
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/hooks/fetc_all_categories.dart';
import 'package:multi_vendor/models/categories.dart';
import 'package:multi_vendor/view/category/widgets/category_tile.dart';

class AllCategory extends HookWidget {
  const AllCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetcAllCategories();
    List<CategoriesModel>? categories = hookResult.data;
    final isLoading = hookResult.isLoading;
    // final error = hookResult.error;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffwhite,
        title: ReusableText(
          text: 'Categories',
          style: appStyle(20, kgray, FontWeight.w600),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 12.w, top: 20.h),
        height: height,
        child: isLoading
            ? FoodsListShimmer()
            : ListView(
                scrollDirection: Axis.vertical,
                children: List.generate(categories!.length, (i) {
                  CategoriesModel category = categories[i];
                  return CategoryTile(category: category);
                }),
              ),
      ),
    );
  }
}
