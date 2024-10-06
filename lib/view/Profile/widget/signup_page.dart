import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:multi_vendor/common/app_style.dart';
import 'package:multi_vendor/common/custom_button.dart';
import 'package:multi_vendor/common/reusable_text.dart';
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/view/Profile/widget/emil_text.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

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
              Lottie.asset('assets/anime/delivery.json'),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    EmilTextField(
                      hintText: "Email",
                      prefixIcon: Icon(
                        Icons.mail_outline,
                        size: 20,
                        color: kPrimary,
                      ),
                      controller: _emailController,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    EmilTextField(
                      hintText: "PassWord",
                      prefixIcon: const Icon(
                        Icons.password_outlined,
                        size: 20,
                        color: kPrimary,
                      ),
                      controller: _emailController,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    SizedBox(
                      height: 46,
                      width: 368,
                      child: CustomButton(
                        onTap: () {},
                        btncolor: KSecondary,
                        text: "Sign Up",
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
