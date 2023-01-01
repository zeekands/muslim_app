import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/data/models/surah_model_model.dart';
import 'package:muslim_app/app/routes/app_pages.dart';
import 'package:muslim_app/app/utils/colors.dart';

import '../controllers/quran_controller.dart';

class QuranView extends GetView<QuranController> {
  const QuranView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Quran'),
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: peach,
            tabs: [
              Tab(
                text: 'SURAH',
              ),
              Tab(
                text: 'JUZ',
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Flexible(
              child: TabBarView(
                children: [
                  buildSurah(),
                  buildJuz(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSurah() {
    return RefreshIndicator(
      onRefresh: () async {
        await controller.loadSurah();
      },
      child: FutureBuilder<List<Data>>(
        future: controller.loadSurah(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 0,
                  child: GestureDetector(
                    onTap: () {
                      // showCupertinoModalPopup(
                      //   context: context,
                      //   builder: (BuildContext context) => CupertinoActionSheet(
                      //     title: const Text('Pilih Tipe Al-Quran'),
                      //     message: const Text('Your options are '),
                      //     cancelButton: CupertinoActionSheetAction(
                      //       child: const Text('Cancel',
                      //           style: TextStyle(color: Colors.red)),
                      //       isDefaultAction: true,
                      //       onPressed: () {
                      //         Navigator.pop(context, 'Cancel');
                      //       },
                      //     ),
                      //     actions: <Widget>[
                      //       CupertinoActionSheetAction(
                      //         child: const Text('Al-Quran Per Ayat',
                      //             style: TextStyle(color: green)),
                      //         onPressed: () {
                      //           Get.back();
                      //           Get.toNamed(
                      //             Routes.DETAIL_SURAH_LIST,
                      //             arguments: [
                      //               snapshot.data![index].number,
                      //               snapshot.data![index].englishName
                      //             ],
                      //           );
                      //         },
                      //       ),
                      //       CupertinoActionSheetAction(
                      //         child: const Text('Al-Quran Per Halaman',
                      //             style: TextStyle(color: green)),
                      //         onPressed: () {
                      //           Get.back();
                      //           Get.toNamed(
                      //             Routes.DETAIL_SURAH,
                      //             arguments: [
                      //               snapshot.data![index].number,
                      //               snapshot.data![index].englishName
                      //             ],
                      //           );
                      //         },
                      //       )
                      //     ],
                      //   ),
                      // );

                      Get.snackbar(
                        "Under Development",
                        "Fitur ini sedang dalam tahap pengembangan",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.orange,
                        colorText: Colors.white,
                        margin: const EdgeInsets.all(10),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.white,
                      ),
                      width: 1.sw,
                      height: 70.h,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 32.w,
                            height: 32.h,
                            child: Stack(
                              children: [
                                Center(
                                  child: Image.asset(
                                    'assets/icon/ic_ayat.png',
                                    width: 32.h,
                                    height: 32.w,
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    '${snapshot.data![index].number}',
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(10),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          10.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${snapshot.data![index].englishName}',
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              5.verticalSpace,
                              Text(
                                '${snapshot.data![index].revelationType} ${snapshot.data![index].numberOfAyahs} Ayat',
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 100.w,
                            child: Text('${snapshot.data![index].name}',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: "uthmanic_hafs_ver09")),
                          ),
                        ],
                      ),
                    ).paddingSymmetric(horizontal: 20.w),
                  ),
                ).paddingSymmetric(
                  horizontal: 10.w,
                );
              },
            ).paddingOnly(top: 10.h);
          } else if (snapshot.hasError) {
            return const Center(
                child: Text(
                    "Terjadi kesalahan saat memuat data, silahkan coba lagi"));
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    );
  }

  Widget buildJuz() {
    return StreamBuilder<QuerySnapshot>(
        stream: controller.juzStream(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 0,
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(
                      Routes.JUZ_SURAH,
                      arguments: index,
                    );
                  },
                  child: Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.white,
                    ),
                    width: 1.sw,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 32.w,
                              height: 32.h,
                              child: Stack(
                                children: [
                                  Center(
                                    child: Image.asset(
                                      'assets/icon/ic_ayat.png',
                                      width: 32.h,
                                      height: 32.w,
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      '${index + 1}',
                                      style: TextStyle(
                                        fontSize: ScreenUtil().setSp(10),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            10.horizontalSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Juz ${index + 1}',
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            const Spacer(),
                          ],
                        ),
                      ],
                    ),
                  ).paddingSymmetric(horizontal: 20.w),
                ),
              ).paddingSymmetric(horizontal: 10.w);
            },
          ).paddingSymmetric(vertical: 10.h);
        });
  }
}
