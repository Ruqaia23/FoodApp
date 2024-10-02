import 'package:flutter/material.dart';
import 'package:multi_vendor/models/restaurant_model.dart';

class FetcResturant {
  final RestaurantModel? data;
  final bool isLoading;
  final Exception? error;
  final VoidCallback? refetch;

  FetcResturant({
    required this.data,
    required this.isLoading,
    required this.error,
    required this.refetch,
  });
}
