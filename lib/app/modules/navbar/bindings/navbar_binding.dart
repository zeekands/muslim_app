import 'package:get/get.dart';
import 'package:muslim_app/app/modules/asmaul_husna/controllers/asmaul_husna_controller.dart';
import 'package:muslim_app/app/modules/home/controllers/home_controller.dart';
import 'package:muslim_app/app/modules/quran/controllers/quran_controller.dart';
import 'package:muslim_app/app/modules/salah_time/controllers/salah_time_controller.dart';

import '../controllers/navbar_controller.dart';

class NavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavbarController>(
      () => NavbarController(),
    );
    Get.lazyPut(
      () => HomeController(),
    );
    Get.lazyPut(
      () => SalahTimeController(),
    );
    Get.put(QuranController());
    Get.lazyPut(() => AsmaulHusnaController());
  }
}
