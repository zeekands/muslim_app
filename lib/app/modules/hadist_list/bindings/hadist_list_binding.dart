import 'package:get/get.dart';

import '../controllers/hadist_list_controller.dart';

class HadistListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HadistListController>(
      () => HadistListController(),
    );
  }
}
