import 'package:get/get.dart';

import '../controllers/juz_surah_controller.dart';

class JuzSurahBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(JuzSurahController());
  }
}
