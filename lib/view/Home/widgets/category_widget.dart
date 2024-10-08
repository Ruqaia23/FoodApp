import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vendor/common/app_style.dart';
import 'package:multi_vendor/common/reusable_text.dart';
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/controllers/category_controller.dart';
import 'package:multi_vendor/models/categories.dart';
import 'package:multi_vendor/view/category/all.dart';

// ignore: must_be_immutable
class CategoryWidget extends StatelessWidget {
  CategoryWidget({
    super.key,
    required this.category,
  });

  CategoriesModel category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());

    return GestureDetector(
      onTap: () {
        if (controller.categoryValue == category.id) {
          controller.updateCategory = '';
          controller.updateTitle = '';
        } else if (category.value == 'more') {
          Get.to(() => const AllCategory(),
              transition: Transition.fadeIn,
              duration: const Duration(milliseconds: 900));
        } else {
          controller.updateCategory = category.id!;
          controller.updateTitle = category.title!;
        }
      },
      child: Obx(
        () => Container(
          margin: EdgeInsets.only(right: 5.w),
          padding: EdgeInsets.only(top: 4.h),
          width: width * 0.19,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                  color: controller.categoryValue == category.id
                      ? KSecondary
                      : kOffwhite,
                  width: .5.w)),
          child: Column(
            children: [
              SizedBox(
                height: 40.h,
                width: 40.w,
                child: Image.network(
                  category.imageUrl ?? "",
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              ReusableText(
                  text: category.title!,
                  style: appStyle(12, Colors.black, FontWeight.normal))
            ],
          ),
        ),
      ),
    );
  }
}
