import 'package:get/get.dart';

import '../controllers/dzikir_list_detail_controller.dart';

class DzikirListDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DzikirListDetailController>(
      () => DzikirListDetailController(),
    );
  }
}
