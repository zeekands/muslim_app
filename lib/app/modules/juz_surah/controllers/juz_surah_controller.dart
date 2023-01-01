import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/data/models/detail_surah_with_eng.dart';
import 'package:muslim_app/app/data/providers/juz_surah_provider.dart';

class JuzSurahController extends GetxController {
  final juzNumber = Get.arguments.toString();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  final isPlaying = false.obs;
  final dataSound = "".obs;
  final indexSound = 0.obs;

  final PageController pageController = PageController();

  final juzRef = FirebaseFirestore.instance.collection('juz');

  Stream<QuerySnapshot> juzStream() {
    return juzRef.snapshots();
  }

  Future<DetailJuzWithEng> loadSurahWithEng(String juz) async {
    final resultAr = await JuzSurahProvider().loadJuzSurah(juz);
    final resultEng = await JuzSurahProvider().loadJuzSurahEng(juz);
    return DetailJuzWithEng(dataAyahs: resultAr, dataAyahsEng: resultEng);
  }
}
