import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/modules/home/views/home_view.dart';
import 'package:muslim_app/app/modules/quran/views/quran_view.dart';
import 'package:muslim_app/app/modules/salah_time/views/salah_time_view.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class NavbarController extends GetxController {
  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  List<Widget> buildScreens() {
    return [
      const HomeView(),
      const SalahTimeView(),
      const QuranView(),
    ];
  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: ("Home"),
        iconSize: 20.r,
        activeColorPrimary: CupertinoColors.activeGreen,
        inactiveColorPrimary: CupertinoColors.black,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.time),
        title: ("Prayers"),
        iconSize: 20.r,
        activeColorPrimary: CupertinoColors.activeGreen,
        inactiveColorPrimary: CupertinoColors.black,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.book),
        title: ("Quran"),
        iconSize: 20.r,
        activeColorPrimary: CupertinoColors.activeGreen,
        inactiveColorPrimary: CupertinoColors.black,
      ),
    ];
  }
}
