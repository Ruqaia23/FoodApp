import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vendor/common/app_style.dart';
import 'package:multi_vendor/common/custom_button.dart';
import 'package:multi_vendor/common/reusable_text.dart';
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/controllers/user_location_controller.dart';
import 'package:multi_vendor/models/address_model.dart';
import 'package:multi_vendor/view/auth/widget/emil_text.dart';

class AddressInfo extends StatelessWidget {
  const AddressInfo({
    super.key,
    required TextEditingController searchController,
    required TextEditingController postalCodeController,
    required TextEditingController instructionController,
    required this.locationController,
  })  : _searchController = searchController,
        _postalCodeController = postalCodeController,
        _instructionController = instructionController;

  final TextEditingController _searchController;
  final TextEditingController _postalCodeController;
  final TextEditingController _instructionController;
  final UserLocationController locationController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      children: [
        SizedBox(height: 30.h),
        EmilTextField(
          controller: _searchController,
          hintText: "Address",
          prefixIcon: const Icon(Icons.location_on),
          keyboardType: TextInputType.streetAddress,
        ),
        SizedBox(height: 15.h),
        EmilTextField(
          controller: _postalCodeController,
          hintText: "Postal Code",
          prefixIcon: const Icon(Icons.location_on),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 15.h),
        EmilTextField(
          controller: _instructionController,
          hintText: "Delivery Instructions",
          prefixIcon: const Icon(Icons.add_circle),
          keyboardType: TextInputType.text,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ReusableText(
                text: 'Set address as default',
                style: appStyle(12, Colors.black, FontWeight.w600),
              ),
              Obx(() => CupertinoSwitch(
                    thumbColor: KSecondary,
                    trackColor: kgray,
                    value: locationController.isDefault,
                    onChanged: (value) {
                      locationController.setIsDefault = value;
                    },
                  )),
            ],
          ),
        ),
        SizedBox(height: 15.h),
        CustomButton(
          onTap: () {
            // التحقق  قبل إرسال البيانات
            if (_searchController.text.isNotEmpty &&
                _postalCodeController.text.isNotEmpty &&
                _instructionController.text.isNotEmpty) {
              AddressModel model = AddressModel(
                addressLine1: _searchController.text,
                postalCode: _postalCodeController.text,
                addressModelDefault: locationController.isDefault,
                deliveryInstructions: _instructionController.text,
              );

              String data = addressModelToJson(model);
              locationController.addAddress(data);

              Get.snackbar("Success", "Address added successfully!",
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: KSecondary);
            } else {
              Get.snackbar("Error", "All fields must be filled",
                  snackPosition: SnackPosition.BOTTOM,
                  colorText: kOffwhite,
                  backgroundColor: KSecondary);
            }
          },
          btnHeight: 45,
          btncolor: kPrimary,
          text: 'SUBMIT',
        ),
      ],
    );
  }
}
