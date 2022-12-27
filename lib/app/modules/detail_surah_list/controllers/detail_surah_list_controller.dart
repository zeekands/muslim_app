import 'package:get/get.dart';

import '../../../data/models/detail_surah_with_eng.dart';
import '../../../data/providers/detail_surah_provider.dart';

class DetailSurahListController extends GetxController with StateMixin {
  final surahNumber = Get.arguments[0].toString();
  final surahName = Get.arguments[1].toString();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  final isPlaying = false.obs;
  final dataSound = "".obs;
  final indexSound = 0.obs;
  String isiSurah = "";

  final detailSurahWithEng = DetailSurahWithEng(
    dataAyahs: [],
    dataAyahsEng: [],
  ).obs;

  Future<DetailSurahWithEng> loadSurahWithEng(String surahNumber) async {
    final resultAr = await DetailSurahProvider().loadDetailSurah(surahNumber);
    final resultEng =
        await DetailSurahProvider().loadDetailSurahEnglish(surahNumber);

    return DetailSurahWithEng(dataAyahs: resultAr, dataAyahsEng: resultEng);
  }

  @override
  void onInit() async {
    super.onInit();
    change(null, status: RxStatus.loading());
    await loadSurahWithEng(surahNumber).then(
      (value) {
        detailSurahWithEng.value = value;
        change(null, status: RxStatus.success());
      },
    ).catchError(
      (err) {
        change(null, status: RxStatus.error(err.toString()));
      },
    );
  }

  final indexPage = 0.obs;
}
