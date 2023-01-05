import 'package:get/get.dart';

import '../controllers/haji_umrah_list_detail_controller.dart';

class HajiUmrahListDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HajiUmrahListDetailController>(
      () => HajiUmrahListDetailController(),
    );
  }
}
