import 'package:get/get.dart';

import '../controllers/hadist_controller.dart';

class HadistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HadistController>(
      () => HadistController(),
    );
  }
}
