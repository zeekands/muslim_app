import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../data/models/Hadist_model.dart';

class HadistListController extends GetxController with StateMixin {
  var listhadist = <Hadist>[];
  var hadist = Hadist();
  final hadistCategory = Get.arguments.toString();

  @override
  void onInit() async {
    super.onInit();
    change(null, status: RxStatus.empty());
    loadhadist();
  }

  void loadhadist() async {
    change(null, status: RxStatus.loading());
    listhadist = Hadists.fromJson(
            jsonDecode(await rootBundle.loadString('assets/json/hadist.json')))
        .hadist as List<Hadist>;
    hadist = listhadist
        .firstWhere((element) => element.categoryName == hadistCategory);
    change(null, status: RxStatus.success());
  }
}
