import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/data/models/Hadist_model.dart';

class HadistController extends GetxController with StateMixin {
  var allHadist = Hadists();
  var listAllHadist = <Hadist>[];
  var listChapters = <Chapters>[];

  final HadistList = [].obs;

  @override
  void onInit() async {
    super.onInit();
    change(null, status: RxStatus.loading());
    allHadist = Hadists.fromJson(
      jsonDecode(
        await rootBundle.loadString('assets/json/hadist.json'),
      ),
    );

    allHadist.hadist!.forEach((element) {
      element.chapters!.forEach((element) {
        listChapters.add(element);
      });
    });

    HadistList.value = allHadist.hadist!.map((e) => e.categoryName).toList();
    change(null, status: RxStatus.success());
  }
}
