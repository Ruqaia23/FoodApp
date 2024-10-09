import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor/common/app_style.dart';
import 'package:multi_vendor/common/custom_button.dart';
import 'package:multi_vendor/common/reusable_text.dart';
import 'package:multi_vendor/constants/constants.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:multi_vendor/controllers/varification_controller.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VarificationController());
    return Scaffold(
      backgroundColor: kOffwhite,
      appBar: AppBar(
        backgroundColor: kOffwhite,
        title: const Text(' varification'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SizedBox(
          height: height,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Image.asset('assets/anime/varif.gif'),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: ReusableText(
                    text: "Please Verify Your Account",
                    style: appStyle(12, kgray, FontWeight.w600)),
              ),
              const SizedBox(
                height: 20,
              ),
              OtpTextField(
                numberOfFields: 6,
                borderColor: KSecondary,
                textStyle: appStyle(17, Colors.black, FontWeight.w600),
                showFieldAsBox: true,
                onCodeChanged: (String code) {},
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                onSubmit: (String verificationCode) {
                  controller.setCode = verificationCode;
                }, // end onSubmit
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 46,
                  width: 368,
                  child: CustomButton(
                    onTap: () {
                      controller.varificationFunction();
                    },
                    btncolor: KSecondary,
                    text: " VERIFY",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
