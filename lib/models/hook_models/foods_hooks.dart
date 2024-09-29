import 'package:flutter/material.dart';
import 'package:multi_vendor/models/food_model.dart';

class FetcFoodds {
  final List<FoodsModel> data;
  final bool isLoading;
  final Exception? error;
  final VoidCallback? refetch;

  FetcFoodds({
    required this.data,
    required this.isLoading,
    required this.error,
    required this.refetch,
  });
}
