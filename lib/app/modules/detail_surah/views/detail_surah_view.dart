import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/data/models/detail_surah_with_eng.dart';

import '../controllers/detail_surah_controller.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  const DetailSurahView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(controller.surahName),
      ),
      body: controller.obx((state) => controller.pageViewBodySurah()),
    );
  }

  FutureBuilder<DetailSurahWithEng> futureDetailSurah() {
    return FutureBuilder<DetailSurahWithEng>(
      future: controller.loadSurahWithEng(controller.surahNumber),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.dataAyahs.length,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.white,
                    ),
                    child: SizedBox(
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
                              '${snapshot.data!.dataAyahs[index].number}',
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(10),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 0.75.sw,
                    child: Text(snapshot.data!.dataAyahs[index].text.toString(),
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'uthmanic_hafs_ver09')),
                  ),
                ],
              ).paddingOnly(left: 20.r, right: 20.r, top: 10.r);
            },
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
