import 'package:get/get.dart';

import '../controllers/salah_time_controller.dart';

class SalahTimeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SalahTimeController>(
      () => SalahTimeController(),
    );
  }
}
