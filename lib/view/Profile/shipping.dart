import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/controllers/user_location_controller.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({super.key});

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  late final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserLocationController());
    print(controller.position);
    return Scaffold(
        appBar: AppBar(
          title: Text('Shipping Address'),
        ),
        body: SizedBox(
          height: height,
          width: width,
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            pageSnapping: false,
            onPageChanged: (index) {
              setState(() {
                _pageController.jumpToPage(index);
              });
            },
            children: [
              // Column(
              //   children: [
              //     GoogleMap(
              //         initialCameraPosition: CameraPosition(
              //       target: controller.position,
              //       zoom: 15,
              //     ),
              //     ),
              //   ],
              // ),
              Container(),
            ],
          ),
        ));
  }
}
