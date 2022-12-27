import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:muslim_app/app/data/models/detail_surah_with_eng.dart';
import 'package:muslim_app/app/utils/colors.dart';

import '../controllers/detail_surah_list_controller.dart';

class DetailSurahListView extends GetView<DetailSurahListController> {
  const DetailSurahListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Surah ${controller.surahName}'),
      ),
      body: FutureBuilder<DetailSurahWithEng>(
        future: controller.loadSurahWithEng(controller.surahNumber),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Flexible(
                  child: ListView.separated(
                    itemCount: snapshot.data!.dataAyahs.length,
                    itemBuilder: (context, index) {
                      final isPlaying = false.obs;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${snapshot.data!.dataAyahs[index].numberInSurah}",
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(16),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                              SizedBox(
                                width: 0.75.sw,
                                child: Text(
                                    "${snapshot.data!.dataAyahs[index].text}",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize: 25.sp,
                                      fontFamily: "uthmanic_hafs_ver09",
                                    )),
                              ),
                            ],
                          ),
                          10.verticalSpace,
                          Text("${snapshot.data!.dataAyahsEng[index].text}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  height: 1.3.sp,
                                  fontSize: 14.sp,
                                  color: Colors.grey[500])),
                          10.verticalSpace,
                        ],
                      ).paddingAll(20.r);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        color: Colors.grey[500],
                        thickness: .3.h,
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                '${snapshot.error}',
                style: Theme.of(context).textTheme.headline4,
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: green,
              ),
            );
          }
        },
      ),
    );
  }
}
