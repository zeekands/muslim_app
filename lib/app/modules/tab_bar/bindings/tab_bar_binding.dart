import 'package:get/get.dart';
import 'package:muslim_app/app/modules/home/controllers/home_controller.dart';
import 'package:muslim_app/app/modules/quran/controllers/quran_controller.dart';

import '../controllers/tab_bar_controller.dart';

class TabBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<TabBarController>(
      TabBarController(),
    );
    Get.put<HomeController>(
      HomeController(),
    );
    Get.put<QuranController>(
      QuranController(),
    );
  }
}
