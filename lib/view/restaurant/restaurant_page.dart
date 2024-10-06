import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vendor/common/app_style.dart';
import 'package:multi_vendor/common/reusable_text.dart';
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/models/restaurant_model.dart';
import 'package:multi_vendor/view/restaurant/widgets/restaurant_explore.dart';
import 'package:multi_vendor/view/restaurant/widgets/restaurant_manu.dart';
import 'package:multi_vendor/view/restaurant/widgets/restaurant_tsbs.dart';
import 'package:multi_vendor/view/restaurant/widgets/row_text.dart';
import 'package:multi_vendor/view/restaurant/widgets/directionsa_rest.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({
    super.key,
    required this.restaurent,
  });

  final RestaurantModel restaurent;

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 2, vsync: this);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: kOffwhite,
            // appBar: AppBar(),
            body: ListView(padding: EdgeInsets.zero, children: [
              Stack(
                children: [
                  SizedBox(
                    height: 230.h,
                    width: width,
                    child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: widget.restaurent.imageUrl!),
                  ),
                  Positioned(
                      left: 0,
                      right: 0,
                      top: 40,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.back(); // Navigate back
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8.w),
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(147, 48, 185, 178),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 20.w,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => const DirectionsaRest());
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8.w),
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(147, 48, 185, 178),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.add_location,
                                    color: Colors.white,
                                    size: 20.w,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 35.h,
                            width: 35.w,
                            child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: widget.restaurent.logoUrl!),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          ReusableText(
                            text: widget.restaurent.title!,
                            style: appStyle(15, Colors.black, FontWeight.w600),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const RowText(
                          first: 'Distance to Restaurant', second: '2.7 km'),
                      const RowText(first: 'Estimated Price', second: '\$2.7'),
                      const RowText(first: 'Estimated Time', second: '30 min'),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        thickness: 0.7,
                      )
                    ],
                  ),
                ),
              ),
              RestaurantTsbs(tabController: _tabController),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  height: height,
                  child: TabBarView(controller: _tabController, children: [
                    RestaurantManu(
                      restaurantId: widget.restaurent.sId!,
                    ),
                    RestaurantExplore(code: widget.restaurent.code!)
                  ]),
                ),
              )
            ])));
  }
}
