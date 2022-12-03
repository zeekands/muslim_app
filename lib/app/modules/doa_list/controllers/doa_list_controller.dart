import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/data/models/doa_model.dart';

class DoaListController extends GetxController with StateMixin {
  var listDoa = <Doa>[];
  var doa = Doa();
  final doaCategory = Get.arguments.toString();

  @override
  void onInit() async {
    super.onInit();
    change(null, status: RxStatus.empty());
    loadDoa();
  }

  void loadDoa() async {
    change(null, status: RxStatus.loading());
    listDoa = Doas.fromJson(
            jsonDecode(await rootBundle.loadString('assets/json/doa.json')))
        .doa as List<Doa>;
    doa = listDoa.firstWhere((element) => element.categoryName == doaCategory);
    change(null, status: RxStatus.success());
  }
}
