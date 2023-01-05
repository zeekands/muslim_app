import 'package:get/get.dart';

import '../controllers/dzikir_list_controller.dart';

class DzikirListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DzikirListController>(
      () => DzikirListController(),
    );
  }
}
