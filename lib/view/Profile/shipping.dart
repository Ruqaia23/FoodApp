import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:multi_vendor/common/app_style.dart';
import 'package:multi_vendor/common/custom_button.dart';
import 'package:multi_vendor/common/reusable_text.dart';
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/controllers/user_location_controller.dart';
import 'package:http/http.dart' as http;
import 'package:multi_vendor/models/address_model.dart';
import 'package:multi_vendor/view/auth/widget/emil_text.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({super.key});

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  late final PageController _pageController = PageController(initialPage: 0);
  GoogleMapController? _mapController;
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _potataCode = TextEditingController();
  final TextEditingController _instrucation = TextEditingController();

  LatLng? _selectedPosition;
  List<dynamic> _placeList = [];
  List<dynamic> _selectedPlace = [];

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String searchQuery) async {
    if (searchQuery.isNotEmpty) {
      final url = Uri.parse(
          'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=${searchQuery}&key=$googleApiKey');

      final response = await http.get(url);

      if (response.statusCode == 200) {
        setState(() {
          _placeList = json.decode(response.body)['predictions'];
        });
      }
    } else {
      _placeList = [];
    }
  }

  void _getPlaceDetails(String placeId) async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/details/json?place=${placeId}&key=$googleApiKey');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final location = json.decode(response.body);

      final lat = location['result']['geometry']['location']['lat'] as double;
      final lng = location['result']['geometry']['location']['lng'] as double;
      final address = location['result']['formatted_address'];

      String postalCode = '';

      final addressComponets = location['result']['address_components'];

      for (var componet in addressComponets) {
        if (componet['types'].contains('postal_code')) {
          postalCode = componet['long_name'];
          break;
        }
      }

      setState(() {
        _selectedPosition = LatLng(lat, lng);
        _searchController.text = address;
        _potataCode.text = postalCode;
        moveToSelectedPosition();
        _placeList = [];
      });
    }
  }

  void moveToSelectedPosition() {
    if (_selectedPosition != null && _mapController != null) {
      _mapController!.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: _selectedPosition!, zoom: 15)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final locationController = Get.put(UserLocationController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kOffwhite,
        elevation: 0,
        title: const Text('Shipping Address'),
        leading: Obx(
          () => Padding(
            padding: EdgeInsets.only(right: 0.w),
            child: locationController.tabIndex == 0
                ? IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: KSecondary,
                    ))
                : IconButton(
                    onPressed: () {
                      locationController.setTabIndex = 0;
                      _pageController.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: kgray,
                    ),
                  ),
          ),
        ),
        actions: [
          Obx(() => locationController.tabIndex == 1
              ? const SizedBox.shrink()
              : IconButton(
                  onPressed: () {
                    locationController.setTabIndex = 1;
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: kgray,
                  ))),
        ],
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          pageSnapping: false,
          onPageChanged: (index) {
            setState(() {});
          },
          children: [
            Column(
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      color: kOffwhite,
                      child: TextField(
                        controller: _searchController,
                        onChanged: _onSearchChanged,
                        decoration: const InputDecoration(
                          hintText: 'Search ',
                        ),
                      ),
                    ),
                    _placeList.isEmpty
                        ? const SizedBox.shrink()
                        : Expanded(
                            child: ListView(
                            children: List.generate(_placeList.length, (index) {
                              return Container(
                                color: kOffwhite,
                                child: ListTile(
                                  visualDensity: VisualDensity.compact,
                                  title: Text(
                                    _placeList[index]['description'],
                                    style: appStyle(14, kgray, FontWeight.w400),
                                  ),
                                  onTap: () {
                                    _getPlaceDetails(
                                        _placeList[index]['place_id']);
                                    _selectedPlace.add(_placeList[index]);
                                  },
                                ),
                              );
                            }),
                          )),
                  ],
                ),
                Expanded(
                  child: GoogleMap(
                    onMapCreated: (GoogleMapController controller) {
                      _mapController = controller;
                    },
                    initialCameraPosition: CameraPosition(
                      target: _selectedPosition ??
                          const LatLng(24.705247049914657, 46.70359684193035),
                      zoom: 15,
                    ),
                    markers: _selectedPosition == null
                        // ignore: prefer_collection_literals
                        ? Set.of([
                            Marker(
                                markerId: const MarkerId("Your Location"),
                                position: const LatLng(
                                    24.705247049914657, 46.70359684193035),
                                draggable: true,
                                onDragEnd: (LatLng position) {
                                  locationController.getUserAddress(
                                      locationController.position);
                                  setState(() {
                                    _selectedPosition = position;
                                  });
                                }),
                          ])
                        // ignore: prefer_collection_literals
                        : Set.of([
                            Marker(
                                markerId: const MarkerId("Your Location"),
                                position: _selectedPosition!,
                                draggable: true,
                                onDragEnd: (LatLng position) {
                                  locationController.getUserAddress(
                                      locationController.position);
                                  setState(() {
                                    _selectedPosition = position;
                                  });
                                }),
                          ]),
                  ),
                ),
              ],
            ),
            ListView(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              children: [
                SizedBox(
                  height: 30.h,
                ),
                EmilTextField(
                  controller: _searchController,
                  hintText: "Address",
                  prefixIcon: const Icon(Icons.location_on),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 15.h,
                ),
                EmilTextField(
                  controller: _potataCode,
                  hintText: "Postal Code",
                  prefixIcon: const Icon(Icons.location_on),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 15.h,
                ),
                EmilTextField(
                  controller: _instrucation,
                  hintText: "Delivery Instructions",
                  prefixIcon: const Icon(Icons.add_circle),
                  keyboardType: TextInputType.number,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableText(
                          text: 'Set address as default',
                          style: appStyle(12, Colors.black, FontWeight.w600)),
                      Obx(() => CupertinoSwitch(
                            thumbColor: KSecondary,
                            trackColor: kgray,
                            value: locationController.isDefault,
                            onChanged: (Value) {
                              locationController.setIsDefault = Value;
                            },
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomButton(
                    onTap: () {
                      if (_searchController.text.isNotEmpty &&
                          _potataCode.text.isNotEmpty &&
                          _instrucation.text.isNotEmpty) {
                        AddressModel model = AddressModel(
                            addressLine1: _searchController.text,
                            postalCode: _potataCode.text,
                            addressModelDefault: locationController.isDefault,
                            deliveryInstructions: _instrucation.text);

                        String data = addressModelToJson(model);
                      }
                    },
                    btnHeight: 45,
                    btncolor: kPrimary,
                    text: 'S U M I T')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
