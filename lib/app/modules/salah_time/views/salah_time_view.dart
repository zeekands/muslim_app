import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:muslim_app/app/utils/notification_api.dart';

import '../../../utils/colors.dart';
import '../controllers/salah_time_controller.dart';

class SalahTimeView extends GetView<SalahTimeController> {
  const SalahTimeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green,
      body: controller.obx(
        (state) => SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: .75.sh,
                  width: 1.sw,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: const Color.fromRGBO(0, 0, 0, 0.15),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        10.horizontalSpace,
                        Icon(
                          Icons.place_rounded,
                          color: Colors.white,
                          size: 20.sp,
                        ),
                        10.horizontalSpace,
                        Text(
                          controller.placemarks.first.locality ?? '',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(14),
                            color: Colors.white,
                          ),
                        ).paddingOnly(right: 10.w),
                      ],
                    ),
                  ).paddingAll(20.r),
                  Container(
                    width: 1.sw,
                    height: 70.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            DateFormat('EEEE, d MMMM', "id_ID")
                                .format(controller.today),
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(18),
                              color: green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          5.verticalSpace,
                          Text(
                            controller.todayHijri.toFormat("dd MMMM yyyy"),
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(14),
                              color: green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ).paddingSymmetric(horizontal: 20.w, vertical: 10.h),
                  Container(
                    width: 1.sw,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(() {
                            return ListTile(
                              title: const Text("Aktifkan Pengingat Shalat"),
                              trailing: Switch.adaptive(
                                value: controller.isNotificationActive.value,
                                activeColor: green,
                                onChanged: (value) {
                                  controller.adzanNotification();
                                },
                              ),
                            );
                          }),
                          ListTile(
                            title: Text(
                              'Subuh',
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(16),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              DateFormat.jm()
                                  .format(controller.prayerTimes.fajr),
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(14),
                              ),
                            ),
                            trailing: Icon(
                              Icons.notifications_active_outlined,
                              size: 20.sp,
                            ),
                            leading: Container(
                              width: 30.w,
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.access_time_outlined,
                                size: 20.sp,
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey[300],
                            thickness: 1.r,
                          ),
                          ListTile(
                            title: Text(
                              'Dzuhur',
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(16),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              DateFormat.jm()
                                  .format(controller.prayerTimes.dhuhr),
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(14),
                              ),
                            ),
                            trailing: Icon(
                              Icons.notifications_active_outlined,
                              size: 20.sp,
                            ),
                            leading: Container(
                              width: 30.w,
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.access_time_outlined,
                                size: 20.sp,
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey[300],
                            thickness: 1.r,
                          ),
                          ListTile(
                            title: Text(
                              'Ashar',
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(16),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              DateFormat.jm()
                                  .format(controller.prayerTimes.asr),
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(14),
                              ),
                            ),
                            trailing: Icon(
                              Icons.notifications_active_outlined,
                              size: 20.sp,
                            ),
                            leading: Container(
                              width: 30.w,
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.access_time_outlined,
                                size: 20.sp,
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey[300],
                            thickness: 1.r,
                          ),
                          ListTile(
                            title: Text(
                              'Maghrib',
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(16),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              DateFormat.jm()
                                  .format(controller.prayerTimes.maghrib),
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(14),
                              ),
                            ),
                            trailing: Icon(
                              Icons.notifications_active_outlined,
                              size: 20.sp,
                            ),
                            leading: Container(
                              width: 30.w,
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.access_time_outlined,
                                size: 20.sp,
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey[300],
                            thickness: 1.r,
                          ),
                          ListTile(
                            title: Text(
                              'Isya',
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(16),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              DateFormat.jm()
                                  .format(controller.prayerTimes.isha),
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(14),
                              ),
                            ),
                            trailing: Icon(
                              Icons.notifications_active_outlined,
                              size: 20.sp,
                            ),
                            leading: Container(
                              width: 30.w,
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.access_time_outlined,
                                size: 20.sp,
                              ),
                            ),
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 10.w, vertical: 10.h),
                    ),
                  ).paddingSymmetric(horizontal: 20.w, vertical: 10.h),
                ],
              ),
            ],
          ),
        ),
        onLoading: const Center(
          child: CircularProgressIndicator(
            color: peach,
            backgroundColor: peach,
          ),
        ),
      ),
    );
  }
}
