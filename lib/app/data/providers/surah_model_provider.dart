import 'package:get/get.dart';
import 'package:muslim_app/app/data/models/surah_model_model.dart';
import 'package:muslim_app/app/routes/app_pages.dart';

class SurahProvider extends GetConnect {
  Future<List<Data>> loadSurah() async {
    final response = await get(
      "${Routes.BASE_URL}/surah",
    ).timeout(const Duration(seconds: 30));

    if (response.statusCode == 200) {
      final data = SurahModel.fromJson(response.body as Map<String, dynamic>);
      return data.data!;
    } else {
      return Future.error(response.statusCode.toString());
    }
  }
}
