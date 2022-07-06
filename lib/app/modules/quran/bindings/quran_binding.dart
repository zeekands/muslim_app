import 'package:get/get.dart';

import '../controllers/quran_controller.dart';

class QuranBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(QuranController());
  }
}
