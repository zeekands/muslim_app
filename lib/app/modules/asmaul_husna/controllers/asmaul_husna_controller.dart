import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../data/models/asmaul_husna_model.dart';

class AsmaulHusnaController extends GetxController with StateMixin {
  var asmaulHusna = AsmaulHusna();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    change(null, status: RxStatus.empty());
    loadAsmaulHusna().then((value) => change(null, status: RxStatus.success()));
  }

  Future<void> loadAsmaulHusna() async {
    change(null, status: RxStatus.loading());
    asmaulHusna = AsmaulHusna.fromJson(
        jsonDecode(await rootBundle.loadString('assets/json/names.json')));
  }
}
