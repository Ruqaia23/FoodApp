import 'package:flutter/material.dart';

class FetcHook {
  final dynamic data;
  final bool isLoading;
  final Exception? error;
  final VoidCallback? refetch;

  FetcHook({
    required this.data,
    required this.isLoading,
    required this.error,
    required this.refetch,
  });
}
