import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/common/bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

Widget defaultHome = BottomBar();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(365, 825),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (conrext, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'foodly',
          theme: ThemeData(
              scaffoldBackgroundColor: kOffwhite,
              iconTheme: const IconThemeData(color: Colors.black),
              primarySwatch: Colors.grey),
          home: defaultHome,
        );
      },
      // child: BottomBar(),
    );
  }
}
