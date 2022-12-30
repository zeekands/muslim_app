import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/tartili_detail_controller.dart';

class TartiliDetailView extends GetView<TartiliDetailController> {
  const TartiliDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          const Center(child: Text(' 1 / 44 ')),
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
          stream: controller.getTartili(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return PageView.builder(
                controller: controller.pageController,
                itemCount:
                    snapshot.data!.docs[Get.arguments].get('data').length,
                itemBuilder: (context, index) {
                  log(snapshot.data!.docs[Get.arguments].get('data')[index]);
                  return CachedNetworkImage(
                    imageUrl:
                        snapshot.data!.docs[Get.arguments].get('data')[index],
                    fit: BoxFit.fitWidth,
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
}
