import 'package:get/get.dart';

import '../controllers/haji_umrah_controller.dart';

class HajiUmrahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HajiUmrahController>(
      () => HajiUmrahController(),
    );
  }
}
