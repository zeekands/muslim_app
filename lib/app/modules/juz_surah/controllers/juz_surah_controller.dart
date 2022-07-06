import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/data/providers/juz_surah_provider.dart';

import '../../../data/models/juz_surah_model.dart';

class JuzSurahController extends GetxController {
  final count = 0.obs;
  final numberJuz = Get.arguments.toString();
  final audioPlayer = AudioPlayer();
  @override
  void onInit() async {
    super.onInit();
  }

  Future<JuzSurahDetail> getJuzSurah(String numberJuz) async {
    final data = await JuzSurahProvider().loadJuzSurah(numberJuz);
    return data;
  }
}
