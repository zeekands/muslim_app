import 'package:muslim_app/app/data/models/detail_surah_model.dart';
import 'package:muslim_app/app/data/models/juz_surah_model.dart' as juz;

import 'detail_surah_english_model.dart';

class DetailSurahWithEng {
  List<Ayahs> dataAyahs;
  List<AyahsEng> dataAyahsEng;

  DetailSurahWithEng({required this.dataAyahs, required this.dataAyahsEng});
}

class DetailJuzWithEng {
  List<juz.Ayahs> dataAyahs;
  List<juz.Ayahs> dataAyahsEng;

  DetailJuzWithEng({required this.dataAyahs, required this.dataAyahsEng});
}
