import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:muslim_app/app/routes/app_pages.dart';

import '../../../utils/colors.dart';
import '../controllers/tartili_controller.dart';

class TartiliView extends GetView<TartiliController> {
  const TartiliView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tartili Al-Irsyad'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('tartilli').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (BuildContext context) => CupertinoActionSheet(
                        title: const Text('Pilih Jenis Tartili'),
                        message: const Text('Your options are '),
                        cancelButton: CupertinoActionSheetAction(
                          child: const Text('Cancel',
                              style: TextStyle(color: Colors.red)),
                          isDefaultAction: true,
                          onPressed: () {
                            Navigator.pop(context, 'Cancel');
                          },
                        ),
                        actions: <Widget>[
                          CupertinoActionSheetAction(
                            child: const Text('Tartili Audio',
                                style: TextStyle(color: green)),
                            onPressed: () {
                              Get.back();
                              Get.snackbar(
                                "Under Development",
                                "Fitur ini sedang dalam tahap pengembangan",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.orange,
                                colorText: Colors.white,
                                margin: const EdgeInsets.all(10),
                              );
                            },
                          ),
                          CupertinoActionSheetAction(
                            child: const Text('Tartili Non Audio',
                                style: TextStyle(color: green)),
                            onPressed: () {
                              Get.back();
                              Get.toNamed(Routes.TARTILI_DETAIL,
                                  arguments: index);
                            },
                          )
                        ],
                      ),
                    );
                  },
                  child: Card(
                    elevation: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.white,
                      ),
                      width: 1.sw,
                      height: 70.h,
                      child: Row(
                        children: [
                          const Icon(Icons.more_vert),
                          10.horizontalSpace,
                          Flexible(
                            child: Text(
                              snapshot.data!.docs[index].id,
                              style: TextStyle(
                                  fontSize: 13.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ).paddingSymmetric(horizontal: 20.w),
                  ).paddingSymmetric(
                    horizontal: 10.w,
                  ),
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
    );
  }
}
