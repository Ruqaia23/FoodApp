import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:multi_vendor/common/app_style.dart';
import 'package:multi_vendor/common/reusable_text.dart';
import 'package:multi_vendor/constants/constants.dart';

class ProfileAppbar extends StatelessWidget {
  const ProfileAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kOffwhite,
      elevation: 0,
      actions: [
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(right: 22.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/flag.png',
                  width: 25,
                  height: 25,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Container(
                  width: 1,
                  height: 15.h,
                  color: kgray,
                ),
                SizedBox(
                  width: 5.w,
                ),
                ReusableText(
                    text: 'SA',
                    style: appStyle(16, Colors.black, FontWeight.normal)),
                SizedBox(
                  width: 5.w,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 4.h),
                    child: const Icon(
                      SimpleLineIcons.settings,
                      size: 20,
                    ),
                  ),
                ),
                // SizedBox(
                //   width: 10.w,
                // ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
