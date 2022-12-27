import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:muslim_app/app/utils/colors.dart';
import 'package:muslim_app/app/utils/notification_api.dart';
import 'package:muslim_app/app/utils/text.dart';

import '../controllers/feedback_controller.dart';

class FeedbackView extends GetView<FeedbackController> {
  const FeedbackView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Umpan Balik Baru'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 220.h,
            color: Colors.white,
            padding: EdgeInsets.all(10.w),
            child: Column(
              children: [
                TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.sp,
                    ),
                    hintText:
                        'Berikan deskripsi setidaknya 5 karakter atas masalah Anda untuk membantu kami meningkatkan aplikasi ini.',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10.w),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '0/500',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.sp,
                      ),
                    ),
                    Container(
                      width: 80.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ).paddingSymmetric(horizontal: 15.w),
              ],
            ),
          ),
          20.verticalSpace,
          Flexible(
            child: Container(
              color: Colors.white,
              width: double.infinity,
              padding: EdgeInsets.all(20.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextRegular(
                    text: "Informasi Kontak",
                    fontSize: 16.sp,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.sp,
                      ),
                      hintText: 'Berikan nomor telepon Anda. (Opsional)',
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      NotifictionApi.showNotification(
                          id: 02981,
                          title: "Test Notification",
                          body: "Notification has been sent",
                          payload: "ok");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: green,
                      minimumSize: Size(double.infinity, 40.h),
                    ),
                    child: const Text('Kirim'),
                  ),
                  20.verticalSpace,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
