import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:muslim_app/app/data/models/detail_surah_with_eng.dart';

import '../controllers/detail_surah_controller.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  const DetailSurahView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF4),
      appBar: AppBar(
        title: const Text('Details'),
        actions: [
          IconButton(
            onPressed: () {
              Get.snackbar(
                "Under Development",
                "Fitur ini sedang dalam tahap pengembangan",
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.orange,
                colorText: Colors.white,
                margin: const EdgeInsets.all(10),
              );
            },
            icon: const Icon(Icons.favorite_border_outlined),
          ),
          IconButton(
            onPressed: () {
              Get.snackbar(
                "Under Development",
                "Fitur ini sedang dalam tahap pengembangan",
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.orange,
                colorText: Colors.white,
                margin: const EdgeInsets.all(10),
              );
            },
            icon: const Icon(Icons.copy),
          ),
          IconButton(
            onPressed: () {
              Get.snackbar(
                "Under Development",
                "Fitur ini sedang dalam tahap pengembangan",
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.orange,
                colorText: Colors.white,
                margin: const EdgeInsets.all(10),
              );
            },
            icon: const Icon(Icons.share),
          ),
          IconButton(
            onPressed: () {
              Get.snackbar(
                "Under Development",
                "Fitur ini sedang dalam tahap pengembangan",
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.orange,
                colorText: Colors.white,
                margin: const EdgeInsets.all(10),
              );
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: controller.surahStream(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              try {
                return PageView.builder(
                  controller: controller.pageController,
                  reverse: T,
                  itemCount:
                      snapshot.data!.docs[Get.arguments].get('Ayat').length,
                  itemBuilder: (context, index) {
                    log(snapshot.data!.docs[Get.arguments].id);
                    return CachedNetworkImage(
                      imageUrl:
                          snapshot.data!.docs[Get.arguments].get('Ayat')[index],
                      fit: BoxFit.cover,
                      height: 1.sh,
                      width: 1.sw,
                      progressIndicatorBuilder: (context, url, progress) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    );
                  },
                ).paddingOnly(top: 10.h);
              } catch (e) {
                return PageView.builder(
                  controller: controller.pageController,
                  reverse: T,
                  itemCount:
                      snapshot.data!.docs[Get.arguments].get('ayat').length,
                  itemBuilder: (context, index) {
                    log(snapshot.data!.docs[Get.arguments].id);
                    return CachedNetworkImage(
                      imageUrl:
                          snapshot.data!.docs[Get.arguments].get('ayat')[index],
                      fit: BoxFit.cover,
                      height: 1.sh,
                      width: 1.sw,
                      progressIndicatorBuilder: (context, url, progress) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    );
                  },
                ).paddingOnly(top: 10.h);
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  // Widget oldBuild(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.white,
  //     appBar: AppBar(
  //       title: Text(controller.surahName),
  //     ),
  //     body: controller.obx((state) => controller.pageViewBodySurah()),
  //   );
  // }

  // FutureBuilder<DetailSurahWithEng> futureDetailSurah() {
  //   return FutureBuilder<DetailSurahWithEng>(
  //     future: controller.loadSurahWithEng(controller.surahNumber),
  //     builder: (context, snapshot) {
  //       if (snapshot.hasData) {
  //         return ListView.builder(
  //           itemCount: snapshot.data!.dataAyahs.length,
  //           itemBuilder: (context, index) {
  //             return Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Container(
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(10.r),
  //                     color: Colors.white,
  //                   ),
  //                   child: SizedBox(
  //                     width: 32.w,
  //                     height: 32.h,
  //                     child: Stack(
  //                       children: [
  //                         Center(
  //                           child: Image.asset(
  //                             'assets/icon/ic_ayat.png',
  //                             width: 32.h,
  //                             height: 32.w,
  //                           ),
  //                         ),
  //                         Center(
  //                           child: Text(
  //                             '${snapshot.data!.dataAyahs[index].number}',
  //                             style: TextStyle(
  //                               fontSize: ScreenUtil().setSp(10),
  //                               fontWeight: FontWeight.bold,
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   width: 0.75.sw,
  //                   child: Text(snapshot.data!.dataAyahs[index].text.toString(),
  //                       textAlign: TextAlign.right,
  //                       style: TextStyle(
  //                           fontSize: 25.sp,
  //                           fontWeight: FontWeight.bold,
  //                           fontFamily: 'uthmanic_hafs_ver09')),
  //                 ),
  //               ],
  //             ).paddingOnly(left: 20.r, right: 20.r, top: 10.r);
  //           },
  //         );
  //       } else if (snapshot.hasError) {
  //         return Text(snapshot.error.toString());
  //       }
  //       return const Center(
  //         child: CircularProgressIndicator(),
  //       );
  //     },
  //   );
  // }
}
