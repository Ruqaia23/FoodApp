import 'package:flutter/material.dart';
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/models/address_respon.dart';
import 'package:multi_vendor/view/Profile/widget/address_tile.dart';

class AddressListWidgt extends StatelessWidget {
  const AddressListWidgt({super.key, required this.addresses});

  final List<AddressResponse> addresses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: addresses.length,
      itemBuilder: (context, index) {
        final address = addresses[index];
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(color: kgray, width: 0.5),
              top: BorderSide(color: kgray, width: 0.5),
            ),
          ),
          child: AddressTile(address: address),
        );
      },
    );
  }
}
