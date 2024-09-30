// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vendor/common/custom_text_field.dart';
import 'package:multi_vendor/common/shimmers/foodlist_shimmer.dart';
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/controllers/search_controller.dart';
import 'package:multi_vendor/view/Search/loading.dart';
import 'package:multi_vendor/view/Search/search_result.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFoodControllerr());
    return Obx(() => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            toolbarHeight: 74.h,
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: CustomTextField(
                controller: _searchController,
                keyboardType: TextInputType.text,
                hintText: 'Search For Food ',
                suffixIcon: GestureDetector(
                    onTap: () {
                      if (controller.searchResilts == null) {
                        controller.searchFoods(_searchController.text);
                      } else {
                        controller.searchResilts = null;
                        _searchController.clear();
                      }
                    },
                    child: controller.searchResilts == null
                        ? const Icon(
                            Icons.search,
                            color: kPrimary,
                          )
                        : const Icon(
                            Icons.close,
                            color: kPrimary,
                          )),
              ),
            ),
          ),
          body: SafeArea(
              child: controller.isLoading
                  ? const FoodsListShimmer()
                  : controller.searchResilts == null
                      ? const LoadingWidget()
                      : const SearchResult()),
        ));
  }
}
