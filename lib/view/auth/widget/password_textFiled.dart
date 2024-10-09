import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vendor/common/app_style.dart';
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/controllers/password_controller.dart';

class PasswordTextfiled extends StatelessWidget {
  const PasswordTextfiled({
    super.key,
    this.controller,
  });

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final passwordController = Get.put(PasswordController());
    return Obx(() => TextFormField(
          cursorColor: Colors.black,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.visiblePassword,
          controller: controller,
          obscureText: passwordController.password,
          validator: (value) {
            if (value!.isEmpty) {
              return ' Please enter valid data';
            } else {
              return null;
            }
          },
          style: appStyle(12, Colors.black, FontWeight.normal),
          decoration: InputDecoration(
            hintText: 'password',
            prefixIcon: const Icon(
              Icons.lock_outline,
              color: kPrimary,
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                passwordController.setPasseord = !passwordController.password;
              },
              child: Icon(
                passwordController.password
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: kPrimary,
              ),
            ),
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
            border: const OutlineInputBorder(
              borderSide: const BorderSide(color: kPrimary, width: .5),
              borderRadius: BorderRadius.all(Radius.circular(9)),
            ),
          ),
        ));
  }
}
