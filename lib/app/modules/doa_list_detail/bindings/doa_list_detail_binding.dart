import 'package:get/get.dart';

import '../controllers/doa_list_detail_controller.dart';

class DoaListDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoaListDetailController>(
      () => DoaListDetailController(),
    );
  }
}
