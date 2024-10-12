import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vendor/common/app_style.dart';
import 'package:multi_vendor/common/reusable_text.dart';
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/models/login_response.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({super.key, this.user});

  final LoginResponse? user;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.06,
      width: width,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 18.r,
                  backgroundImage: NetworkImage(user?.profile ?? ''),
                  backgroundColor: kgrayLight,
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ReusableText(
                      text: user?.username ?? 'User',
                      style: appStyle(13, Colors.black, FontWeight.w600),
                    ),
                    ReusableText(
                      text: user?.email ?? 'unknown@example.com',
                      style: appStyle(11, kgray, FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
            const Icon(
              Icons.edit_note_outlined,
              size: 25,
              color: kgray,
            ),
          ],
        ),
      ),
    );
  }
}
