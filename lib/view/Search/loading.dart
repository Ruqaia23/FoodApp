import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vendor/constants/constants.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Padding(
        padding: EdgeInsets.only(bottom: 180.h),
        child: Image.asset('assets/anime/foodapp.gif',
            width: width, height: height / 2),
      ),
    );
  }
}
