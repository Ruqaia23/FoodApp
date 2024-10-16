import 'package:flutter/material.dart';
import 'package:multi_vendor/common/app_style.dart';
import 'package:multi_vendor/common/reusable_text.dart';
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/models/food_model.dart';
import 'package:multi_vendor/models/order_request.dart';
import 'package:multi_vendor/models/restaurant_model.dart';

class OrderPage extends StatefulWidget {
  OrderPage(
      {super.key, this.restaurant, required this.food, required this.item});

  final RestaurantModel? restaurant;
  final FoodsModel food;
  final OrderItem item;

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.item.additives);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kOffwhite,
        elevation: 0,
        title: ReusableText(
            text: "Coumplete Your Order",
            style: appStyle(14, kgray, FontWeight.w600)),
      ),
      body: Container(),
    );
  }
}
