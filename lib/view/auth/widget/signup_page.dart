import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vendor/common/app_style.dart';
import 'package:multi_vendor/common/custom_button.dart';
import 'package:multi_vendor/common/reusable_text.dart';
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/controllers/signup_controller.dart';
import 'package:multi_vendor/models/signup_model.dart';
import 'package:multi_vendor/view/auth/widget/emil_text.dart';
import 'package:multi_vendor/view/auth/widget/password_textFiled.dart';
import 'package:multi_vendor/view/Profile/widget/user_text.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();
  late final TextEditingController _userController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _userController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
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
              Image.asset('assets/anime/foodapp.gif'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    UserText(
                      hintText: "UserName",
                      prefixIcon: const Icon(
                        Icons.person,
                        size: 20,
                        color: kPrimary,
                      ),
                      controller: _userController,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    EmilTextField(
                      hintText: "Email",
                      prefixIcon: const Icon(
                        Icons.mail_outline,
                        size: 20,
                        color: kPrimary,
                      ),
                      controller: _emailController,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    PasswordTextfiled(
                      controller: _passwordController,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    SizedBox(
                      height: 46,
                      width: 368,
                      child: CustomButton(
                        onTap: () {
                          if (_emailController.text.isNotEmpty &&
                              _userController.text.isNotEmpty &&
                              _passwordController.text.length >= 8) {
                            SignupModel(
                                username: _userController.text,
                                email: _emailController.text,
                                password: _passwordController.text);

                            SignupModel model = SignupModel(
                                email: _emailController.text,
                                password: _passwordController.text,
                                username: _userController.text);

                            String data = signupModelToJson(model);
                            //signnup fun
                            controller.SignupFunction(data);
                          }
                        },
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
