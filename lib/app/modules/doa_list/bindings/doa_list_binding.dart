import 'package:get/get.dart';

import '../controllers/doa_list_controller.dart';

class DoaListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoaListController>(
      () => DoaListController(),
    );
  }
}
