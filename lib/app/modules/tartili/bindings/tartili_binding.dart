import 'package:get/get.dart';

import '../controllers/tartili_controller.dart';

class TartiliBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TartiliController());
  }
}
