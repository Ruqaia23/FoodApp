import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vendor/common/app_style.dart';
import 'package:multi_vendor/common/reusable_text.dart';
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/controllers/category_controller.dart';
import 'package:multi_vendor/models/categories.dart';
import 'package:multi_vendor/view/category/category_page.dart';

class CategoryTile extends StatelessWidget {
  CategoryTile({
    super.key,
    required this.category,
  });

  CategoriesModel category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return ListTile(
      onTap: () {
        controller.updateCategory = category.id!;
        controller.updateTitle = category.title!;
        Get.to(() => const CategoryPage(),
            transition: Transition.fadeIn,
            duration: const Duration(milliseconds: 900));
      },
      leading: CircleAvatar(
        radius: 23.r,
        backgroundColor: kgrayLight,
        child: Image.network(
          category.imageUrl!,
          fit: BoxFit.contain,
        ),
      ),
      title: ReusableText(
          text: category.title!, style: appStyle(12, kgray, FontWeight.normal)),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: kgray,
        size: 15.r,
      ),
    );
  }
}
