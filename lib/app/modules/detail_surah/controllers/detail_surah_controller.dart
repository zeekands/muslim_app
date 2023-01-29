import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/data/models/detail_surah_with_eng.dart';
import 'package:muslim_app/app/data/providers/detail_surah_provider.dart';

class DetailSurahController extends GetxController with StateMixin {
  // final surahNumber = Get.arguments[0].toString();
  // final surahName = Get.arguments[1].toString();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  final isPlaying = false.obs;
  final dataSound = "".obs;
  final indexSound = 0.obs;
  String isiSurah = "";

  final surahRef = FirebaseFirestore.instance.collection('surah');

  Stream<QuerySnapshot> surahStream() {
    return surahRef.snapshots();
  }

  final PageController pageController = PageController();
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
    // change(null, status: RxStatus.loading());
    // await loadSurahWithEng(surahNumber).then(
    //   (value) {
    //     detailSurahWithEng.value = value;
    //     change(null, status: RxStatus.success());
    //   },
    // ).catchError(
    //   (err) {
    //     change(null, status: RxStatus.error(err.toString()));
    //   },
    // );
  }

  final indexPage = 0.obs;

  Widget pageViewBodySurah() {
    final pageCount = detailSurahWithEng.value.dataAyahs.length / 8 > 0
        ? detailSurahWithEng.value.dataAyahs.length ~/ 8 + 1
        : 1;

    final remainingItem = detailSurahWithEng.value.dataAyahs.length % 8;

    return PageView.builder(
      controller: pageController,
      itemCount: pageCount,
      reverse: true,
      onPageChanged: (index) {
        indexPage.value = index;
      },
      itemBuilder: (context, index) {
        String data = "";
        if (detailSurahWithEng.value.dataAyahs.length < 8) {
          for (int i = 0; i < detailSurahWithEng.value.dataAyahs.length; i++) {
            data += detailSurahWithEng.value.dataAyahs[i].text! +
                " {${detailSurahWithEng.value.dataAyahs[i].numberInSurah}} ";
          }
        } else {
          for (int i = 0; i < 8; i++) {
            if (index == 0) {
              data += detailSurahWithEng.value.dataAyahs[i].text! +
                  " {${detailSurahWithEng.value.dataAyahs[i].numberInSurah}} ";
            } else if ((index == pageCount - 1) == false) {
              if (detailSurahWithEng.value.dataAyahs.length - 8 < index * 8) {
                i = i +
                    (index * (detailSurahWithEng.value.dataAyahs.length - 8));
                for (int j = i;
                    j < detailSurahWithEng.value.dataAyahs.length - 8;
                    j++) {
                  data += detailSurahWithEng.value.dataAyahs[j].text! +
                      " {${detailSurahWithEng.value.dataAyahs[j].numberInSurah}} ";
                }
              }
              i = i + (index * 8);

              for (int j = i; j < i + 8; j++) {
                data += detailSurahWithEng.value.dataAyahs[j].text! +
                    " {${detailSurahWithEng.value.dataAyahs[j].numberInSurah}} ";
              }
            } else {
              i = 8;
              var lastIndex =
                  detailSurahWithEng.value.dataAyahs.length - remainingItem;
              for (int j = lastIndex; j < lastIndex + remainingItem; j++) {
                data += detailSurahWithEng.value.dataAyahs[j].text! +
                    " {${detailSurahWithEng.value.dataAyahs[j].numberInSurah}} ";
              }
            }
          }
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Scrollbar(
                thumbVisibility: true,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Text(
                      data,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 28.sp, fontFamily: "UthmanicHafs"),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 40,
              alignment: Alignment.center,
              child: Text("Page ${index + 1} of $pageCount"),
            )
          ],
        );

        // [
        //   Expanded(
        //     child: ListView.builder(
        //       itemCount: 8 > detailSurahWithEng.value.dataAyahs.length
        //           ? detailSurahWithEng.value.dataAyahs.length
        //           : 8,
        //       itemBuilder: (context, i) {
        //         if (index > 0) {
        //           i = i + (index * 8);
        //         }
        //         return Container(
        //           margin: EdgeInsets.only(
        //             top: 10,
        //             left: 10,
        //             right: 10,
        //           ),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Container(
        //                 decoration: BoxDecoration(
        //                   borderRadius: BorderRadius.circular(10),
        //                   color: Colors.white,
        //                 ),
        //                 child: SizedBox(
        //                   width: 32,
        //                   height: 32,
        //                   child: Stack(
        //                     children: [
        //                       Center(
        //                         child: Image.asset(
        //                           'assets/icon/ic_ayat.png',
        //                           width: 32,
        //                           height: 32,
        //                         ),
        //                       ),
        //                       Center(
        //                         child: Text(
        //                           '${detailSurahWithEng.value.dataAyahs[i].numberInSurah}',
        //                           style: TextStyle(
        //                             fontSize: 10,
        //                             fontWeight: FontWeight.bold,
        //                           ),
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //               ),
        //               Expanded(
        //                 child: Container(
        //                   margin: EdgeInsets.only(
        //                     left: 10,
        //                   ),
        //                   child: Column(
        //                     crossAxisAlignment: CrossAxisAlignment.end,
        //                     children: [
        //                       Text(
        //                         '${detailSurahWithEng.value.dataAyahs[i].text}',
        //                         textAlign: TextAlign.right,
        //                         style: TextStyle(
        //                           fontSize: 28,
        //                         ),
        //                       ),
        //                       // Text(
        //                       //   '${detailSurahWithEng.value.dataAyahsEng[i].text}',
        //                       //   style: TextStyle(
        //                       //     fontSize: 12,
        //                       //   ),
        //                       // ),
        //                     ],
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         );
        //       },
        //     ),
        //   ),
        // ],
      },
    ).paddingAll(15);
  }
}
