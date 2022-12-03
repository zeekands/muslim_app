import 'package:get/get.dart';

import '../models/detail_surah_english_model.dart';

class DetailSurahEnglishProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return DetailSurahEnglish.fromJson(map);
      if (map is List) {
        return map.map((item) => DetailSurahEnglish.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<DetailSurahEnglish?> getDetailSurahEnglish(int id) async {
    final response = await get('detailsurahenglish/$id');
    return response.body;
  }

  Future<Response<DetailSurahEnglish>> postDetailSurahEnglish(
          DetailSurahEnglish detailsurahenglish) async =>
      await post('detailsurahenglish', detailsurahenglish);
  Future<Response> deleteDetailSurahEnglish(int id) async =>
      await delete('detailsurahenglish/$id');
}
