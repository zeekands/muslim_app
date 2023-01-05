import 'package:get/get.dart';

import '../controllers/ramadhan_list_controller.dart';

class RamadhanListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RamadhanListController>(
      () => RamadhanListController(),
    );
  }
}
