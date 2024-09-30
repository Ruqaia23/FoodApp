import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vendor/common/app_style.dart';
import 'package:multi_vendor/common/reusable_text.dart';
import 'package:multi_vendor/common/shimmers/foodlist_shimmer.dart';
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/controllers/category_controller.dart';
import 'package:multi_vendor/hooks/fetc_category_food.dart';
import 'package:multi_vendor/models/food_model.dart';
import 'package:multi_vendor/view/Home/widgets/food_tile.dart';

class CategoryPage extends HookWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    final hookResults = useFetcFoodByCategory('41007428');
    List<FoodsModel>? foods = hookResults.data;
    bool isLoading = hookResults.isLoading;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffwhite,
        //هذي الجزئيه عشان يرجع للصفحه الرئيسيه
        leading: IconButton(
            onPressed: () {
              controller.updateCategory = '';
              controller.updateTitle = '';
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: ReusableText(
          text: controller.titleValue,
          style: appStyle(20, kgray, FontWeight.w600),
        ),
      ),
      body: Container(
          //  padding: EdgeInsets.only(left: 12.w, top: 20.h),
          height: height,
          child: isLoading
              ? const FoodsListShimmer()
              : Padding(
                  padding: EdgeInsets.all(12.h),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: List.generate(foods.length, (i) {
                      FoodsModel food = foods[i];
                      return FoodTile(
                        food: food,
                      );
                    }),
                  ),
                )),
    );
  }
}
