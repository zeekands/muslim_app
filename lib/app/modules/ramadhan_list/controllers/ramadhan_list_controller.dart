import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../data/models/Ramadhan_model.dart';

class RamadhanListController extends GetxController with StateMixin {
  var listRamadhan = <Ramadhan>[];
  var ramadhan = Ramadhan();
  final RamadhanCategory = Get.arguments.toString();

  @override
  void onInit() async {
    super.onInit();
    change(null, status: RxStatus.empty());
    loadRamadhan();
  }

  void loadRamadhan() async {
    change(null, status: RxStatus.loading());
    listRamadhan = Ramadhans.fromJson(jsonDecode(
            await rootBundle.loadString('assets/json/ramadhan.json')))
        .ramadhan as List<Ramadhan>;
    ramadhan = listRamadhan
        .firstWhere((element) => element.categoryName == RamadhanCategory);
    change(null, status: RxStatus.success());
  }
}
