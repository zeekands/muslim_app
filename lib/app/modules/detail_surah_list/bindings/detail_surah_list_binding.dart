import 'package:get/get.dart';

import '../controllers/detail_surah_list_controller.dart';

class DetailSurahListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailSurahListController>(
      () => DetailSurahListController(),
    );
  }
}
