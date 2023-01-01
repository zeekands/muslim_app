import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../data/models/haji_umrah_model.dart';

class HajiUmrahController extends GetxController with StateMixin {
  var allHajiUmrah = HajiUmrahs();
  var listAllHajiUmrah = <HajiUmrah>[];
  var listChapters = <Chapters>[];

  final HajiUmrahList = [].obs;

  @override
  void onInit() async {
    super.onInit();
    change(null, status: RxStatus.loading());
    allHajiUmrah = HajiUmrahs.fromJson(
      jsonDecode(
        await rootBundle.loadString('assets/json/haji_umrah.json'),
      ),
    );

    allHajiUmrah.hajiUmrah!.forEach((element) {
      element.chapters!.forEach((element) {
        listChapters.add(element);
      });
    });

    HajiUmrahList.value =
        allHajiUmrah.hajiUmrah!.map((e) => e.categoryName).toList();
    change(null, status: RxStatus.success());
  }
}
