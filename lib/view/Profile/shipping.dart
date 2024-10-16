import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:multi_vendor/common/app_style.dart';
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/controllers/user_location_controller.dart';
import 'package:http/http.dart' as http;
import 'package:multi_vendor/view/Profile/widget/addressinfo.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({super.key});

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  late final PageController _pageController = PageController(initialPage: 0);
  GoogleMapController? _mapController;
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _postalCodeController =
      TextEditingController(); // تعديل الاسم هنا
  final TextEditingController _instructionController =
      TextEditingController(); // تعديل الاسم هنا

  LatLng? _selectedPosition;
  List<dynamic> _placeList = [];
  final List<dynamic> _selectedPlace = [];

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  void _getPositionAddress() {
    if (_selectedPosition != null) return;
    Geolocator.getCurrentPosition().then((position) {
      _selectedPosition = LatLng(position.latitude, position.longitude);
      moveToSelectedPosition();

      setState(() {});
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String searchQuery) async {
    if (searchQuery.isNotEmpty) {
      final url = Uri.parse(
          'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$searchQuery&key=$googleApiKey');

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
        'https://maps.googleapis.com/maps/api/place/details/json?placeid=$placeId&key=$googleApiKey');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final location = json.decode(response.body);

      final lat = location['result']['geometry']['location']['lat'] as double;
      final lng = location['result']['geometry']['location']['lng'] as double;
      final address = location['result']['formatted_address'];

      String postalCode = '';

      final addressComponents = location['result']['address_components'];

      for (var component in addressComponents) {
        if (component['types'].contains('postal_code')) {
          postalCode = component['long_name'];
          break;
        }
      }

      setState(() {
        _selectedPosition = LatLng(lat, lng);
        _searchController.text = address;
        _postalCodeController.text = postalCode;
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
                Container(
                  constraints: const BoxConstraints(
                    maxHeight: 300,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
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
                                children:
                                    List.generate(_placeList.length, (index) {
                                  return ListTile(
                                    //visualDensity: VisualDensity.compact,
                                    title: Text(
                                      _placeList[index]['description'],
                                      style:
                                          appStyle(14, kgray, FontWeight.w400),
                                    ),
                                    onTap: () {
                                      _getPlaceDetails(
                                          _placeList[index]['place_id']);
                                      _selectedPlace.add(_placeList[index]);
                                    },
                                  );
                                }),
                              ),
                            ),
                    ],
                  ),
                ),
                Expanded(
                  child: GoogleMap(
                    onMapCreated: (GoogleMapController controller) {
                      _mapController = controller;
                      _getPositionAddress();
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
                                position: _selectedPosition ??
                                    const LatLng(
                                        24.705247049914657, 46.70359684193035),
                                draggable: true,
                                onDragEnd: (LatLng position) {
                                  locationController.getUserAddress(
                                      locationController.position);
                                  // print(position);
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
            AddressInfo(
              searchController: _searchController,
              postalCodeController: _postalCodeController,
              instructionController: _instructionController,
              locationController: locationController,
            ),
          ],
        ),
      ),
    );
  }
}
