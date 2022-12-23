import 'package:get/get.dart';

import '../controllers/tartili_detail_controller.dart';

class TartiliDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TartiliDetailController>(
      () => TartiliDetailController(),
    );
  }
}
