import 'dart:async';

import 'package:get/get.dart';
import 'package:muslim_app/app/routes/app_pages.dart';

class SplashscreenController extends GetxController {
  //TODO: Implement SplashscreenController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    Timer(const Duration(seconds: 1), () => Get.toNamed(Routes.NAVBAR));
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
