import 'package:flutter/material.dart';
import 'package:multi_vendor/common/app_style.dart';
import 'package:multi_vendor/common/reusable_text.dart';
import 'package:multi_vendor/constants/constants.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile(
      {super.key, required this.title, required this.icon, this.onTap});

  final String title;
  final IconData icon;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity.compact,
      minLeadingWidth: 0,
      onTap: onTap,
      leading: Icon(
        icon,
      ),
      title: ReusableText(
          text: title, style: appStyle(11, kgray, FontWeight.normal)),
      trailing: title != 'Settings '
          ? const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            )
          : Image.asset(
              'assets/images/flag.png',
              width: 25,
              height: 25,
            ),
    );
  }
}
