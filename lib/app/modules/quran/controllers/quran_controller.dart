import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/data/providers/surah_model_provider.dart';

import '../../../data/models/surah_model_model.dart';

class QuranController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var page = 0.obs;
  PageController pageController = PageController();
  final juzRef = FirebaseFirestore.instance.collection('juz');
  final surahRef = FirebaseFirestore.instance.collection('surah');

  Stream<QuerySnapshot> juzStream() {
    return juzRef.snapshots();
  }

  Stream<QuerySnapshot> surahStream() {
    return surahRef.snapshots();
  }

  @override
  void onInit() async {
    super.onInit();
    await loadSurah();
  }

  Future<List<Data>> loadSurah() async {
    final result = await SurahProvider().loadSurah();
    return result;
  }
}
