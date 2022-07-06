import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/data/models/juz_surah_model.dart'
    as juz_surah_model;

import '../controllers/juz_surah_controller.dart';

class JuzSurahView extends GetView<JuzSurahController> {
  const JuzSurahView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Juz ${controller.numberJuz}'),
      ),
      body: FutureBuilder<juz_surah_model.JuzSurahDetail>(
        future: controller.getJuzSurah(controller.numberJuz),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Container(
                    width: 1.sw,
                    height: 50.h,
                    alignment: Alignment.center,
                    child: Text(
                      '${snapshot.data!.data!.juzStartInfo} sampai ${snapshot.data!.data!.juzEndInfo}',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(20),
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Flexible(
                  child: ListView.separated(
                    itemCount: snapshot.data!.data!.verses!.length,
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
                                "${snapshot.data!.data!.verses![index].number!.inSurah}",
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(16),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                              SizedBox(
                                width: 0.75.sw,
                                child: Text(
                                    "${snapshot.data!.data!.verses![index].text!.arab}",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(fontSize: 25.sp)),
                              ),
                            ],
                          ),
                          10.verticalSpace,
                          Text(
                              "${snapshot.data!.data!.verses![index].translation!.id}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  height: 1.3.sp,
                                  fontSize: 14.sp,
                                  color: Colors.grey[500])),
                          10.verticalSpace,
                          Obx(
                            () => IconButton(
                              onPressed: () async {
                                controller.audioPlayer.onPlayerStateChanged
                                    .listen((event) {
                                  if (event == PlayerState.PLAYING) {
                                    isPlaying.value = true;
                                  } else {
                                    isPlaying.value = false;
                                  }
                                });
                                if (isPlaying.value) {
                                  await controller.audioPlayer.pause();
                                  isPlaying.value = false;
                                } else {
                                  await controller.audioPlayer.play(snapshot
                                      .data!
                                      .data!
                                      .verses![index]
                                      .audio!
                                      .primary!);
                                  isPlaying.value = true;
                                }
                              },
                              icon: Icon(
                                isPlaying.value
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                color: Colors.blue,
                              ),
                            ),
                          ),
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
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
