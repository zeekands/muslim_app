import 'package:get/get.dart';

import '../controllers/hadist_list_detail_controller.dart';

class HadistListDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HadistListDetailController>(
      () => HadistListDetailController(),
    );
  }
}
