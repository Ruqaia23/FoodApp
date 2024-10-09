import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:multi_vendor/controllers/login_controller.dart';
import 'package:multi_vendor/models/login_response.dart';
import 'package:multi_vendor/view/Profile/widget/login_redirect.dart';
import 'package:multi_vendor/view/auth/widget/verification.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();

    LoginResponse? user;
    final controller = Get.put(LoginController());

    String? token = box.read('token');
    if (token != null) {
      user = controller.getUserInfo();

      //print(user!.email);
    }

    if (token == null) {
      return const LoginRedirect();
    }
    if (user != null && user.verification == false) {
      return const VerificationPage();
    }

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.h),
          child: Container(
            height: 130.h,
          )),
      body: SafeArea(child: Container()
          //   CustomContainer(
          // content: Container(),
          ),
    );
  }
}
