import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/data/models/detail_surah_model.dart';
import 'package:muslim_app/app/data/models/detail_surah_with_eng.dart';
import 'package:muslim_app/app/data/providers/detail_surah_provider.dart';

import '../../../data/models/detail_surah_english_model.dart';

class DetailSurahController extends GetxController {
  //TODO: Implement DetailSurahController

  final count = 0.obs;
  final surahNumber = Get.arguments[0].toString();
  final surahName = Get.arguments[1].toString();
  final audioPlayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  final isPlaying = false.obs;

  Future<DetailSurahWithEng> loadSurahWithEng(String surahNumber) async {
    final resultAr = await DetailSurahProvider().loadDetailSurah(surahNumber);
    final resultEng =
        await DetailSurahProvider().loadDetailSurahEnglish(surahNumber);
    return DetailSurahWithEng(dataAyahs: resultAr, dataAyahsEng: resultEng);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<List<Ayahs>> loadSurahAyahs(String surahNumber) async {
    final result = await DetailSurahProvider().loadDetailSurah(surahNumber);
    return result;
  }

  Future<List<AyahsEng>> loadSurahAyahsEnglish(String surahNumber) async {
    final result =
        await DetailSurahProvider().loadDetailSurahEnglish(surahNumber);
    return result;
  }

  void increment() => count.value++;
}
