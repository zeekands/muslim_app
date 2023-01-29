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
      child: StreamBuilder<QuerySnapshot>(
        stream: controller.surahStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                var data = snapshot.data?.docs;
                data?.sort(
                    (doc1, doc2) => int.parse(doc1.id) - int.parse(doc2.id));
                var singleData = data?[index];
                return Card(
                  elevation: 0,
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(
                        Routes.DETAIL_SURAH,
                        arguments: int.parse(singleData?.id ?? "0") - 1,
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
                                    '${singleData?.id}',
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
                                '${singleData?.get("name")}',
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              5.verticalSpace,
                              Text(
                                '${singleData?.get("kind")} ${singleData?.get("total")} Ayat',
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
                            child: Text('${singleData?.get("arabic_name")}',
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
