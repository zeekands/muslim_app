import 'package:get/get.dart';

import '../controllers/ramadhan_controller.dart';

class RamadhanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RamadhanController>(
      () => RamadhanController(),
    );
  }
}
