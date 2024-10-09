import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vendor/common/app_style.dart';
import 'package:multi_vendor/common/custom_button.dart';
import 'package:multi_vendor/common/reusable_text.dart';
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/view/auth/widget/login_page.dart';
import 'package:multi_vendor/view/auth/widget/signup_page.dart';

class LoginRedirect extends StatelessWidget {
  const LoginRedirect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Center(
          child: ReusableText(
              text: "QuickBite",
              style: appStyle(20, Colors.black, FontWeight.bold)),
        ),
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 30.h,
            ),
            Image.asset('assets/anime/q.gif'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ReusableText(
                      text: 'OOPS!!',
                      style: appStyle(13, Colors.black, FontWeight.bold)),
                  ReusableText(
                      text: 'You have to login Or Sign to see this page ',
                      style: appStyle(13, kgray, FontWeight.normal)),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    height: 46,
                    width: 368,
                    child: CustomButton(
                      text: "Login",
                      onTap: () {
                        Get.to(() => LoginPage());
                      },
                      btncolor: KSecondary,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                height: 46,
                width: 368,
                child: CustomButton(
                  onTap: () {
                    Get.to(() => const SignupPage());
                  },
                  btncolor: KSecondary,
                  text: "Sign Up",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
