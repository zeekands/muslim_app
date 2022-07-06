import 'package:get/get.dart';

import '../models/juz_surah_model.dart';

class JuzSurahProvider extends GetConnect {
  Future<JuzSurahDetail> loadJuzSurah(String juzNumber) async {
    final response = await get("https://api.quran.sutanlab.id/juz/$juzNumber")
        .timeout(const Duration(seconds: 10));
    if (response.statusCode == 200) {
      final data =
          JuzSurahDetail.fromJson(response.body as Map<String, dynamic>);
      return data;
    } else {
      return Future.error(response.statusCode.toString());
    }
  }
}
