import 'package:flutter/material.dart';
import 'package:multi_vendor/models/address_respon.dart';

class FetcAddress {
  final List<AddressResponse>? data;
  final bool isLoading;
  final Exception? error;
  final VoidCallback? refetch;

  FetcAddress({
    required this.data,
    required this.isLoading,
    required this.error,
    required this.refetch,
  });
}
