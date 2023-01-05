import 'package:get/get.dart';

import '../controllers/haji_umrah_list_controller.dart';

class HajiUmrahListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HajiUmrahListController>(
      () => HajiUmrahListController(),
    );
  }
}
