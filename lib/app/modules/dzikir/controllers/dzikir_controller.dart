import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/data/models/dzikir_model.dart';

class DzikirController extends GetxController with StateMixin {
  var allDzikir = Dzikirs();
  var listAllDzikir = <Dzikir>[];
  var listChapters = <Chapters>[];

  final DzikirList = [].obs;

  @override
  void onInit() async {
    super.onInit();
    change(null, status: RxStatus.loading());
    allDzikir = Dzikirs.fromJson(
      jsonDecode(
        await rootBundle.loadString('assets/json/dzikir.json'),
      ),
    );

    allDzikir.dzikir!.forEach((element) {
      element.chapters!.forEach((element) {
        listChapters.add(element);
      });
    });

    DzikirList.value = allDzikir.dzikir!.map((e) => e.categoryName).toList();
    change(null, status: RxStatus.success());
  }
}
