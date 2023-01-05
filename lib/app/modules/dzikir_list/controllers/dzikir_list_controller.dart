import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../data/models/dzikir_model.dart';

class DzikirListController extends GetxController with StateMixin {
  var listDzikir = <Dzikir>[];
  var dzikir = Dzikir();
  final DzikirCategory = Get.arguments.toString();

  @override
  void onInit() async {
    super.onInit();
    change(null, status: RxStatus.empty());
    loadDzikir();
  }

  void loadDzikir() async {
    change(null, status: RxStatus.loading());
    listDzikir = Dzikirs.fromJson(
            jsonDecode(await rootBundle.loadString('assets/json/dzikir.json')))
        .dzikir as List<Dzikir>;
    dzikir = listDzikir
        .firstWhere((element) => element.categoryName == DzikirCategory);
    change(null, status: RxStatus.success());
  }
}
