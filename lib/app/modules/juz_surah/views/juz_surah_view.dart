import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:muslim_app/app/data/models/detail_surah_with_eng.dart';

import '../controllers/juz_surah_controller.dart';

class JuzSurahView extends GetView<JuzSurahController> {
  const JuzSurahView({Key? key}) : super(key: key);
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
          stream: controller.juzStream(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              try {
                return PageView.builder(
                  controller: controller.pageController,
                  reverse: T,
                  itemCount:
                      snapshot.data!.docs[Get.arguments].get('Data').length,
                  itemBuilder: (context, index) {
                    log(snapshot.data!.docs[Get.arguments].id);
                    return CachedNetworkImage(
                      imageUrl:
                          snapshot.data!.docs[Get.arguments].get('Data')[index],
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
                      snapshot.data!.docs[Get.arguments].get('data').length,
                  itemBuilder: (context, index) {
                    log(snapshot.data!.docs[Get.arguments].id);
                    return CachedNetworkImage(
                      imageUrl:
                          snapshot.data!.docs[Get.arguments].get('data')[index],
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

  Widget oldBuild(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Juz ${controller.juzNumber}'),
      ),
      body: FutureBuilder<DetailJuzWithEng>(
        future: controller.loadSurahWithEng(controller.juzNumber),
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
                                "${snapshot.data!.dataAyahs[index].number}",
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
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
