import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vendor/common/custom_container.dart';
import 'package:multi_vendor/common/profile_appbar.dart';
import 'package:multi_vendor/view/Profile/widget/login_page.dart';
import 'package:multi_vendor/view/Profile/widget/profile_tile.dart';

class ProfilePageBeforeSign extends StatelessWidget {
  const ProfilePageBeforeSign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(40.h), child: const ProfileAppbar()),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SafeArea(
              child: CustomContainer(
                  content: Column(children: [
            //   const UserInfoWidget(),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 100.h,
              decoration: const BoxDecoration(color: Colors.white),
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ProfileTile(
                    onTap: () {
                      Get.to(() => LoginPage());
                    },
                    title: 'Login',
                    icon: Icons.person_outline,
                  ),
                  ProfileTile(
                      onTap: () {},
                      title: 'Customer Service',
                      icon: Icons.support_agent_outlined),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ]))),
        ));
  }
}
