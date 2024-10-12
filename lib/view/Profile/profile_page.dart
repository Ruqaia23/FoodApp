import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:multi_vendor/common/bottom_bar.dart';
import 'package:multi_vendor/common/custom_button.dart';
import 'package:multi_vendor/common/custom_container.dart';
import 'package:multi_vendor/common/profile_appbar.dart';
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/controllers/login_controller.dart';
import 'package:multi_vendor/models/login_response.dart';
import 'package:multi_vendor/view/Profile/profile_before_sign.dart';
import 'package:multi_vendor/view/Profile/widget/profile_tile.dart';
import 'package:multi_vendor/view/Profile/widget/user_info_widget.dart';
import 'package:multi_vendor/view/auth/widget/login_page.dart';
import 'package:multi_vendor/view/auth/widget/verification.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginResponse? user;
    final controller = Get.put(LoginController());

    final box = GetStorage();

    String? token = box.read('token');
    if (token != null) {
      user = controller.getUserInfo();

      //print(user!.email);
    }

    if (token == null) {
      return const ProfilePageBeforeSign();
    }

    // if (user != null && user.verification == false) {
    //   return BottomBar();
    // }

    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(40.h), child: const ProfileAppbar()),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SafeArea(
            child: CustomContainer(
                content: Column(
              children: [
                UserInfoWidget(user: user),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 175.h,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ProfileTile(
                        onTap: () {
                          Get.to(() => const LoginPage());
                        },
                        title: 'My Orders',
                        icon: Icons.fastfood_outlined,
                      ),
                      ProfileTile(
                          onTap: () {},
                          title: 'Favorite Plsces',
                          icon: Icons.favorite_outline),
                      ProfileTile(
                        onTap: () {},
                        title: 'Review',
                        icon: Icons.chat_bubble_outline,
                      ),
                      ProfileTile(
                        onTap: () {},
                        title: 'Coupons',
                        icon: Icons.discount_outlined,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 175.h,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ProfileTile(
                        onTap: () {},
                        title: 'Address',
                        icon: Icons.location_on_outlined,
                      ),
                      ProfileTile(
                          onTap: () {},
                          title: 'Customer service',
                          icon: Icons.support_agent_outlined),
                      ProfileTile(
                        onTap: () {},
                        title: 'Coupons',
                        icon: Icons.discount_outlined,
                      ),
                      ProfileTile(
                        onTap: () {},
                        title: 'Settings',
                        icon: SimpleLineIcons.settings,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 46,
                  width: 368,
                  child: CustomButton(
                    onTap: () {
                      controller.logout();
                    },
                    btncolor: KSecondary,
                    text: "LogOut",
                  ),
                )
              ],
            )),
          ),
        ));
  }
}
