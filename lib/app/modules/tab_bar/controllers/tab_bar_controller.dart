import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/modules/home/views/home_view.dart';
import 'package:muslim_app/app/modules/quran/controllers/quran_controller.dart';
import 'package:muslim_app/app/modules/quran/views/quran_view.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class TabBarController extends GetxController {
  final tabController = PersistentTabController(initialIndex: 0);
  final QuranC = Get.find<QuranController>();
  List<Widget> buildScreens() {
    return [
      const HomeView(),
      const QuranView(),
    ];
  }

  List<PersistentBottomNavBarItem> buildItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Home",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.book),
        title: 'Quran',
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  final count = 0.obs;



  void increment() => count.value++;
}
