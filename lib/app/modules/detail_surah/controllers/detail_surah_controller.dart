import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/data/models/detail_surah_with_eng.dart';
import 'package:muslim_app/app/data/providers/detail_surah_provider.dart';

class DetailSurahController extends GetxController {
  final surahNumber = Get.arguments[0].toString();
  final surahName = Get.arguments[1].toString();
  final audioPlayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  final isPlaying = false.obs;
  final dataSound = "".obs;
  final indexSound = 0.obs;

  Future<DetailSurahWithEng> loadSurahWithEng(String surahNumber) async {
    final resultAr = await DetailSurahProvider().loadDetailSurah(surahNumber);
    final resultEng =
        await DetailSurahProvider().loadDetailSurahEnglish(surahNumber);
    return DetailSurahWithEng(dataAyahs: resultAr, dataAyahsEng: resultEng);
  }
}
