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
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('tartilli').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return PageView.builder(
                controller: controller.pageController,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 30.h,
                      ),
                      CachedNetworkImage(
                        imageUrl: snapshot.data!.docs[Get.arguments]
                            .get('data')[index],
                        fit: BoxFit.fitHeight,
                        progressIndicatorBuilder: (context, url, progress) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                      Flexible(
                        child: Container(
                          width: double.infinity,
                          color: Colors.grey[300],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    controller.pageController.previousPage(
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.easeIn);
                                  },
                                  icon: Icon(Icons.arrow_back_ios)),
                              IconButton(
                                  onPressed: () {
                                    controller.pageController.nextPage(
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.easeIn);
                                  },
                                  icon: Icon(Icons.arrow_forward_ios)),
                            ],
                          ),
                        ),
                      )
                    ],
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
