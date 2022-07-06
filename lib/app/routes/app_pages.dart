import 'package:get/get.dart';

import '../modules/detail_surah/bindings/detail_surah_binding.dart';
import '../modules/detail_surah/views/detail_surah_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/juz_surah/bindings/juz_surah_binding.dart';
import '../modules/juz_surah/views/juz_surah_view.dart';
import '../modules/quran/bindings/quran_binding.dart';
import '../modules/quran/views/quran_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.QURAN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.QURAN,
      page: () => const QuranView(),
      binding: QuranBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_SURAH,
      page: () => const DetailSurahView(),
      binding: DetailSurahBinding(),
    ),
    GetPage(
      name: _Paths.JUZ_SURAH,
      page: () => const JuzSurahView(),
      binding: JuzSurahBinding(),
    ),
  ];
}
