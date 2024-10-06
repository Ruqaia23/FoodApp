import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vendor/common/app_style.dart';
import 'package:multi_vendor/constants/constants.dart';

class RestaurantTsbs extends StatelessWidget {
  const RestaurantTsbs({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: Container(
        height: 25.h,
        width: width,
        decoration: BoxDecoration(
            color: kOffwhite, borderRadius: BorderRadius.circular(25.r)),
        child: TabBar(
          controller: _tabController,
          indicator: BoxDecoration(
              color: kPrimary, borderRadius: BorderRadius.circular(25.r)),
          labelPadding: EdgeInsets.zero,
          labelColor: Colors.white,
          labelStyle: appStyle(12, Colors.white, FontWeight.normal),
          tabs: [
            Tab(
              child: SizedBox(
                width: width * 2,
                height: 25,
                child: const Center(
                  child: Text('Manu'),
                ),
              ),
            ),
            Tab(
              child: SizedBox(
                width: width * 2,
                height: 25,
                child: const Center(
                  child: Text('Explore'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
