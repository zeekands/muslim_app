import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/data/models/atkhar_model.dart';

class AtkhtarController extends GetxController with StateMixin {
  var atkhtars = [];
  var atkhtarMorning = [];
  var morningLength = 0;

  @override
  void onInit() async {
    super.onInit();
    change(null, status: RxStatus.empty());
    loadAtkhtar();
  }

  void loadAtkhtar() async {
    change(null, status: RxStatus.loading());
    atkhtars = Atkhtars.fromJson(
            jsonDecode(await rootBundle.loadString('assets/json/athkar.json')))
        .athkar
        ?.where((element) => element.period == 'Evening')
        .toList() as List<Atkhar>;
    atkhtarMorning = Atkhtars.fromJson(
            jsonDecode(await rootBundle.loadString('assets/json/athkar.json')))
        .athkar
        ?.where((element) => element.period == 'Morning')
        .toList() as List<Atkhar>;

    change(atkhtars, status: RxStatus.success());
  }
}
