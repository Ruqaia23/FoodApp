import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vendor/common/app_style.dart';
import 'package:multi_vendor/constants/constants.dart';

class EmilTextField extends StatelessWidget {
  const EmilTextField(
      {super.key,
      this.onEditingComplete,
      this.keyboardType,
      this.initialValue,
      this.controller,
      this.hintText,
      this.prefixIcon});

  final void Function()? onEditingComplete;
  final TextInputType? keyboardType;
  final String? initialValue;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      textInputAction: TextInputAction.next,
      onEditingComplete: onEditingComplete,
      keyboardType: keyboardType ?? TextInputType.emailAddress,
      initialValue: initialValue,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return ' Please enter valid data';
        } else {
          return null;
        }
      },
      style: appStyle(12, kgray, FontWeight.normal),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        isDense: true,
        contentPadding: EdgeInsets.all(6.h),
        hintStyle: appStyle(12, kgray, FontWeight.normal),
        errorBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: .5),
          borderRadius: BorderRadius.all(Radius.circular(9)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: kPrimary, width: .5),
          borderRadius: BorderRadius.all(Radius.circular(9)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: .5),
          borderRadius: BorderRadius.all(Radius.circular(9)),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: kgray, width: .5),
          borderRadius: BorderRadius.all(Radius.circular(9)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: kPrimary, width: .5),
          borderRadius: BorderRadius.all(Radius.circular(9)),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: kPrimary, width: .5),
          borderRadius: BorderRadius.all(Radius.circular(9)),
        ),
      ),
    );
  }
}
