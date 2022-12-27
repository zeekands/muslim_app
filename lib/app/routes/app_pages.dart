import 'package:get/get.dart';

import '../modules/about/bindings/about_binding.dart';
import '../modules/about/views/about_view.dart';
import '../modules/asmaul_husna/bindings/asmaul_husna_binding.dart';
import '../modules/asmaul_husna/views/asmaul_husna_view.dart';
import '../modules/atkhtar/bindings/atkhtar_binding.dart';
import '../modules/atkhtar/views/atkhtar_view.dart';
import '../modules/detail_surah/bindings/detail_surah_binding.dart';
import '../modules/detail_surah/views/detail_surah_view.dart';
import '../modules/detail_surah_list/bindings/detail_surah_list_binding.dart';
import '../modules/detail_surah_list/views/detail_surah_list_view.dart';
import '../modules/doa/bindings/doa_binding.dart';
import '../modules/doa/views/doa_view.dart';
import '../modules/doa_list/bindings/doa_list_binding.dart';
import '../modules/doa_list/views/doa_list_view.dart';
import '../modules/doa_list_detail/bindings/doa_list_detail_binding.dart';
import '../modules/doa_list_detail/views/doa_list_detail_view.dart';
import '../modules/feedback/bindings/feedback_binding.dart';
import '../modules/feedback/views/feedback_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/juz_surah/bindings/juz_surah_binding.dart';
import '../modules/juz_surah/views/juz_surah_view.dart';
import '../modules/navbar/bindings/navbar_binding.dart';
import '../modules/navbar/views/navbar_view.dart';
import '../modules/qiblah/bindings/qiblah_binding.dart';
import '../modules/qiblah/views/qiblah_view.dart';
import '../modules/quran/bindings/quran_binding.dart';
import '../modules/quran/views/quran_view.dart';
import '../modules/salah_time/bindings/salah_time_binding.dart';
import '../modules/salah_time/views/salah_time_view.dart';
import '../modules/tab_bar/bindings/tab_bar_binding.dart';
import '../modules/tab_bar/views/tab_bar_view.dart';
import '../modules/tartili/bindings/tartili_binding.dart';
import '../modules/tartili/views/tartili_view.dart';
import '../modules/tartili_detail/bindings/tartili_detail_binding.dart';
import '../modules/tartili_detail/views/tartili_detail_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.NAVBAR;

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
    GetPage(
      name: _Paths.TAB_BAR,
      page: () => const TabBarView(),
      binding: TabBarBinding(),
    ),
    GetPage(
      name: _Paths.NAVBAR,
      page: () => const NavbarView(),
      binding: NavbarBinding(),
    ),
    GetPage(
      name: _Paths.QIBLAH,
      page: () => const QiblahView(),
      binding: QiblahBinding(),
    ),
    GetPage(
      name: _Paths.ATKHTAR,
      page: () => const AtkhtarView(),
      binding: AtkhtarBinding(),
    ),
    GetPage(
      name: _Paths.SALAH_TIME,
      page: () => const SalahTimeView(),
      binding: SalahTimeBinding(),
    ),
    GetPage(
      name: _Paths.DOA,
      page: () => const DoaView(),
      binding: DoaBinding(),
    ),
    GetPage(
      name: _Paths.DOA_LIST,
      page: () => const DoaListView(),
      binding: DoaListBinding(),
    ),
    GetPage(
      name: _Paths.DOA_LIST_DETAIL,
      page: () => const DoaListDetailView(),
      binding: DoaListDetailBinding(),
    ),
    GetPage(
      name: _Paths.ASMAUL_HUSNA,
      page: () => const AsmaulHusnaView(),
      binding: AsmaulHusnaBinding(),
    ),
    GetPage(
      name: _Paths.TARTILI,
      page: () => const TartiliView(),
      binding: TartiliBinding(),
    ),
    GetPage(
      name: _Paths.TARTILI_DETAIL,
      page: () => const TartiliDetailView(),
      binding: TartiliDetailBinding(),
    ),
    GetPage(
      name: _Paths.FEEDBACK,
      page: () => const FeedbackView(),
      binding: FeedbackBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => const AboutView(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_SURAH_LIST,
      page: () => const DetailSurahListView(),
      binding: DetailSurahListBinding(),
    ),
  ];
}
