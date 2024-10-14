import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:multi_vendor/common/app_style.dart';
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/common/reusable_text.dart';
import 'package:latlng/latlng.dart';
import 'package:multi_vendor/controllers/user_location_controller.dart';
import 'package:multi_vendor/hooks/fetch_default.dart';

class CustomAppBar extends StatefulHookWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserLocationController());
    final hookResults = useFetcdefaultAddresses();
    final address = hookResults.data;
    print(address);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      height: 80.h,
      width: width,
      color: kOffwhite,
      child: Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 25.r,
                  backgroundColor: KSecondary,
                  backgroundImage: const NetworkImage(
                      'https://i.pinimg.com/originals/0f/bb/ac/0fbbac26dcbd2670d1f9442949edb45e.jpg'),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 6.h, left: 8.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                          text: 'Deliver to',
                          style: appStyle(13, KSecondary, FontWeight.w600)),
                      Obx(
                        () => SizedBox(
                          width: width * 0.65,
                          child: Text(
                              controller.address == ''
                                  ? 'saudi arabia  , riyadh , st1229834 '
                                  : controller.address,
                              overflow: TextOverflow.ellipsis,
                              style: appStyle(11, kgrayLight, FontWeight.w400)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              getTimeOfDay(),
              style: const TextStyle(fontSize: 35),
            ),
          ],
        ),
      ),
    );
  }

  String getTimeOfDay() {
    DateTime now = DateTime.now();
    int hour = now.hour;

    if (hour >= 0 && hour < 12) {
      return '☀️';
    } else if (hour >= 12 && hour < 16) {
      return '🌥️';
    } else {
      return '🌙';
    }
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    _getCurentLocation();
  }

  Future<void> _getCurentLocation() async {
    final controller = Get.put(UserLocationController());
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    LatLng currentLocation =
        LatLng.degree(position.latitude, position.longitude);
    controller.setPosition(currentLocation);
    //   print(currentLocation);
    controller.getUserAddress(currentLocation);
  }
}
