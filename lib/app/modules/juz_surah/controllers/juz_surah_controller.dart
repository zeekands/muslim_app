import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/data/models/detail_surah_with_eng.dart';
import 'package:muslim_app/app/data/providers/juz_surah_provider.dart';

class JuzSurahController extends GetxController {
  final juzNumber = Get.arguments.toString();
  final audioPlayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  final isPlaying = false.obs;
  final dataSound = "".obs;
  final indexSound = 0.obs;

  Future<DetailJuzWithEng> loadSurahWithEng(String juz) async {
    final resultAr = await JuzSurahProvider().loadJuzSurah(juz);
    final resultEng = await JuzSurahProvider().loadJuzSurahEng(juz);
    return DetailJuzWithEng(dataAyahs: resultAr, dataAyahsEng: resultEng);
  }
}
