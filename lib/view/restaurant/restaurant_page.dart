import 'package:flutter/material.dart';
import 'package:multi_vendor/models/restaurant_model.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({required this.restaurent, super.key});

  final RestaurantModel restaurent;

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}
