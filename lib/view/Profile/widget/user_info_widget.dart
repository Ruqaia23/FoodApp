import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vendor/common/app_style.dart';
import 'package:multi_vendor/common/reusable_text.dart';
import 'package:multi_vendor/constants/constants.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.06,
      width: width,
      color: Colors.white,
      child: Column(children: [
        Padding(
          padding: EdgeInsets.fromLTRB(12.w, 5, 16, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 35.h,
                width: 35.w,
                child: const CircleAvatar(
                  backgroundColor: kgrayLight,
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                      text: 'Username',
                      style: appStyle(13, Colors.black, FontWeight.w600)),
                  ReusableText(
                      text: 'r_al_2@hotmail.com',
                      style: appStyle(11, kgray, FontWeight.w400))
                ],
              ),
              const Icon(
                Icons.edit_note_outlined,
                size: 25,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
