import 'package:get/get.dart';

import '../controllers/ramadhan_list_detail_controller.dart';

class RamadhanListDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RamadhanListDetailController>(
      () => RamadhanListDetailController(),
    );
  }
}
