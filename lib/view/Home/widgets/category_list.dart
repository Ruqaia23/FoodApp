import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vendor/common/shimmers/categories_shimmer.dart';
import 'package:multi_vendor/hooks/fetc_categories.dart';
import 'package:multi_vendor/models/categories.dart';
import 'package:multi_vendor/view/Home/widgets/category_widget.dart';

class CategoryList extends HookWidget {
  const CategoryList({Key? key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetcCategories();
    List<CategoriesModel>? categoriesList = hookResult.data;
    final isLoading = hookResult.isLoading;
    final error = hookResult.error;

    return isLoading
        ? const CatergoriesShimmer()
        : Container(
            height: 80.h,
            padding: EdgeInsets.only(left: 12.w, top: 10.h),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(categoriesList!.length, (index) {
                CategoriesModel category = categoriesList[index];
                return CategoryWidget(category: category);
              }),
            ),
          );
  }
}
