import 'package:get/get.dart';
import 'package:muslim_app/app/routes/app_pages.dart';

import '../models/juz_surah_model.dart';

class JuzSurahProvider extends GetConnect {
  Future<List<Ayahs>> loadJuzSurahEng(String juzNumber) async {
    final response =
        await get(Routes.BASE_URL + "/juz/" + juzNumber + "/en.asad")
            .timeout(const Duration(seconds: 10));
    if (response.statusCode == 200) {
      final data = JuzDetail.fromJson(response.body as Map<String, dynamic>);
      return data.data!.ayahs!;
    } else {
      return Future.error(response.statusCode.toString());
    }
  }

  Future<List<Ayahs>> loadJuzSurah(String juzNumber) async {
    final response =
        await get(Routes.BASE_URL + "/juz/" + juzNumber + "/quran-uthmani")
            .timeout(const Duration(seconds: 10));
    if (response.statusCode == 200) {
      final data = JuzDetail.fromJson(response.body as Map<String, dynamic>);
      return data.data!.ayahs!;
    } else {
      return Future.error(response.statusCode.toString());
    }
  }
}
