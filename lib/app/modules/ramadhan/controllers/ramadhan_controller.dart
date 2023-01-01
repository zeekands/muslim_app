import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/data/models/Ramadhan_model.dart';

class RamadhanController extends GetxController with StateMixin {
  var allRamadhan = Ramadhans();
  var listAllRamadhan = <Ramadhan>[];
  var listChapters = <Chapters>[];

  final RamadhanList = [].obs;

  @override
  void onInit() async {
    super.onInit();
    change(null, status: RxStatus.loading());
    allRamadhan = Ramadhans.fromJson(
      jsonDecode(
        await rootBundle.loadString('assets/json/ramadhan.json'),
      ),
    );

    allRamadhan.ramadhan!.forEach((element) {
      element.chapters!.forEach((element) {
        listChapters.add(element);
      });
    });

    RamadhanList.value =
        allRamadhan.ramadhan!.map((e) => e.categoryName).toList();
    change(null, status: RxStatus.success());
  }
}
