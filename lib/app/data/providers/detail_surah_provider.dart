import 'package:get/get.dart';
import 'package:muslim_app/app/data/models/detail_surah_english_model.dart';

import '../../routes/app_pages.dart';
import '../models/detail_surah_model.dart';

class DetailSurahProvider extends GetConnect {
  Future<List<Ayahs>> loadDetailSurah(String surahNumber) async {
    final response = await get(
      "${Routes.BASE_URL}/surah/$surahNumber/ar.alafasy",
    ).timeout(const Duration(seconds: 5));

    if (response.statusCode == 200) {
      final data = DetailSurah.fromJson(response.body as Map<String, dynamic>);
      return data.data!.ayahs!;
    } else {
      return Future.error(response.statusCode.toString());
    }
  }

  Future<List<AyahsEng>> loadDetailSurahEnglish(String surahNumber) async {
    final response = await get(
      "${Routes.BASE_URL}/surah/$surahNumber/en.asad",
    ).timeout(const Duration(seconds: 5));

    if (response.statusCode == 200) {
      final data =
          DetailSurahEnglish.fromJson(response.body as Map<String, dynamic>);
      return data.data!.ayahs!;
    } else {
      return Future.error(response.statusCode.toString());
    }
  }
}
