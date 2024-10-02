import 'package:flutter/material.dart';

import 'package:multi_vendor/constants/constants.dart';
import 'package:phone_otp_verification/phone_verification.dart';

class VerificationSheet extends StatelessWidget {
  const VerificationSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhoneVerification(
      isFirstPage: false,
      enableLogo: false,
      themeColor: KSecondary,
      backgroundColor: kOffwhite,
      initialPageText: "Verify Phone Number",
      initialPageTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      textColor: Colors.black,
      onSend: (String value) {
        print('Phone number: $value');
      },
      onVerification: (String value) {
        print('OTP: $value');
      },
    );
    // return SizedBox(
    //   height: 300,
    //   child: Column(
    //     children: [
    //       Padding(
    //         padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             ReusableText(
    //               text: 'Add your phone number',
    //               style: appStyle(15, Colors.black, FontWeight.w600),
    //             ),
    //             GestureDetector(
    //               onTap: () {
    //                 Get.back();
    //               },
    //               child: const Icon(Icons.clear),
    //             ),
    //           ],
    //         ),
    //       ),
    //       const SizedBox(height: 15),
    //       Padding(
    //         padding: const EdgeInsets.only(right: 12.0),
    //         child: ReusableText(
    //           text: 'Add your phone number to create an account or sign in',
    //           style: appStyle(11, kgray, FontWeight.w400),
    //         ),
    //       ),
    //       const SizedBox(height: 15),
    //       const Padding(
    //         padding: EdgeInsets.only(left: 11.0, right: 11.0),
    //         child: CustomTextField(
    //           hintText: '05xxxxxxxx',
    //         ),
    //       ),
    //       const SizedBox(height: 15),
    //       Container(
    //         height: 48,
    //         width: 350,
    //         decoration: BoxDecoration(
    //           color: KSecondary,
    //           borderRadius: BorderRadius.circular(9),
    //         ),
    //         child: Center(
    //           child: GestureDetector(
    //             onTap: () {
    //               // Add action for "Continue"
    //             },
    //             child: ReusableText(
    //               text: 'Continue',
    //               style: appStyle(15, Colors.black, FontWeight.w400),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}

// To use this class in your app:
Future<dynamic> showVerificationSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return const VerificationSheet();
    },
  );
}
