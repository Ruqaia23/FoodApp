import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vendor/common/app_style.dart';
import 'package:multi_vendor/common/custom_button.dart';
import 'package:multi_vendor/common/reusable_text.dart';
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/controllers/login_controller.dart';
import 'package:multi_vendor/models/login_model.dart';
import 'package:multi_vendor/view/auth/widget/emil_text.dart';
import 'package:multi_vendor/view/auth/widget/password_textFiled.dart';
import 'package:multi_vendor/view/auth/widget/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    final controller = Get.put(LoginController());
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
                        text: "Login",
                        onTap: () {
                          if (_emailController.text.isNotEmpty &&
                              _passwordController.text.length >= 8) {
                            LoginModel model = LoginModel(
                                email: _emailController.text,
                                password: _passwordController.text);

                            String data = loginModelToJson(model);
                            //login fun
                            controller.loginFunction(data);
                          }
                        },
                        btncolor: KSecondary,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.to(
                                () => const SignupPage(),
                                // transition: Transition.fadeIn,
                                // duration:
                              );
                            },
                            child: ReusableText(
                                text: "Sign up",
                                style: appStyle(
                                    12,
                                    const Color.fromARGB(255, 7, 55, 93),
                                    FontWeight.normal))),
                        const SizedBox(
                          width: 5,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
