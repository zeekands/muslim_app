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
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 50.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.skip_previous),
                onPressed: () {
                  Get.back();
                },
              ),
              IconButton(
                icon: Icon(!controller.isPlaying.value
                    ? Icons.play_arrow
                    : Icons.pause_circle_filled_outlined),
                onPressed: () {
                  controller.audioPlayer.play(
                    controller.dataSound.value,
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.skip_next),
                onPressed: () {
                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
      body: FutureBuilder<DetailSurahWithEng>(
        future: controller.loadSurahWithEng(controller.surahNumber),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
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
                          "${controller.surahNumber}:${snapshot.data!.dataAyahs[index].numberInSurah}",
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(16),
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                        SizedBox(
                          width: 0.75.sw,
                          child: Text(
                              snapshot.data!.dataAyahs[index].text.toString(),
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    10.verticalSpace,
                    Text(snapshot.data!.dataAyahsEng[index].text.toString(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            height: 1.3.sp,
                            fontSize: 14.sp,
                            color: Colors.grey[500])),
                    10.verticalSpace,
                    Obx(
                      () => IconButton(
                        onPressed: () async {
                          controller.dataSound.value =
                              snapshot.data!.dataAyahs[index].audio.toString();
                          controller.indexSound.value = index;
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
                                .data!.dataAyahs[index].audio
                                .toString());
                            isPlaying.value = true;
                          }
                        },
                        icon: !isPlaying.value
                            ? const Icon(Icons.play_circle_outline_rounded)
                            : const Icon(Icons.pause_circle_outline_rounded),
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
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
