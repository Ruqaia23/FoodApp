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
        color: KSecondary,
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
  }
}

Future<dynamic> showVerificationSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return const VerificationSheet();
    },
  );
}
