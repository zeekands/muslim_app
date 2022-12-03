import 'package:get/get.dart';

import '../controllers/atkhtar_controller.dart';

class AtkhtarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AtkhtarController>(
      () => AtkhtarController(),
    );
  }
}
