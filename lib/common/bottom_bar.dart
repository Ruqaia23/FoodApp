import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor/constants/constants.dart';
import 'package:multi_vendor/controllers/tab_index.dart';
import 'package:multi_vendor/view/Cart/cart_page.dart';
import 'package:multi_vendor/view/Home/home.dart';
import 'package:multi_vendor/view/Profile/profile_page.dart';
import 'package:multi_vendor/view/Search/search_page.dart';

// ignore: must_be_immutable
class BottomBar extends StatelessWidget {
  BottomBar({super.key});

  List<Widget> pageList = const [
    HomePage(),
    SearchPage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TabIndexController());

    return Obx(() => Scaffold(
          body: SafeArea(
            child: Stack(children: [
              // Background container
              pageList[controller.tabIndex],
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 58,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                    color: kPrimary,
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(134, 158, 158, 158),
                        offset: Offset(0, 20),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      canvasColor: Colors.transparent,
                    ),
                    child: BottomNavigationBar(
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      unselectedIconTheme:
                          const IconThemeData(color: Colors.black),
                      selectedIconTheme: const IconThemeData(color: kOffwhite),
                      onTap: (value) {
                        controller.SetTabIndex = value;
                      },
                      currentIndex: controller.tabIndex,
                      items: const [
                        BottomNavigationBarItem(
                          icon: Icon(Icons.home),
                          label: 'Home',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.search),
                          label: 'Search',
                        ),
                        BottomNavigationBarItem(
                          icon: Badge(
                            label: Text('2'),
                            child: Icon(Icons.shopping_cart),
                          ),
                          label: 'Cart',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.person),
                          label: 'Profile',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}
