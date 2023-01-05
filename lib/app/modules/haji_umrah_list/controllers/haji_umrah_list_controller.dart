import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../data/models/haji_umrah_model.dart';

class HajiUmrahListController extends GetxController with StateMixin {
  var listHajiUmrah = <HajiUmrah>[];
  var hajiUmrah = HajiUmrah();
  final HajiUmrahCategory = Get.arguments.toString();

  @override
  void onInit() async {
    super.onInit();
    change(null, status: RxStatus.empty());
    loadHajiUmrah();
  }

  void loadHajiUmrah() async {
    change(null, status: RxStatus.loading());
    listHajiUmrah = HajiUmrahs.fromJson(jsonDecode(
            await rootBundle.loadString('assets/json/haji_umrah.json')))
        .hajiUmrah as List<HajiUmrah>;
    hajiUmrah = listHajiUmrah
        .firstWhere((element) => element.categoryName == HajiUmrahCategory);
    change(null, status: RxStatus.success());
  }
}
