import 'package:app_settings/app_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:muslim_app/app/modules/about/views/about_view.dart';
import 'package:muslim_app/app/modules/feedback/views/feedback_view.dart';
import 'package:muslim_app/app/routes/app_pages.dart';
import 'package:muslim_app/app/utils/colors.dart';
import 'package:muslim_app/app/utils/text.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: green,
    ));

    return Scaffold(
        body: controller.obx(
      (state) => RefreshIndicator(
        onRefresh: () async => controller.onInit(),
        edgeOffset: 100,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: green,
              pinned: true,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(75.h),
                child: Container(
                  padding: EdgeInsets.only(
                    left: 10.w,
                    right: 10.w,
                    bottom: 10.h,
                  ),
                  color: green,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      dateInfo(),
                      15.verticalSpace,
                      Container(
                        width: .5.sw,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: const Color.fromRGBO(0, 0, 0, 0.15),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 5.h,
                        ),
                        child: Row(
                          children: [
                            10.horizontalSpace,
                            Icon(
                              Icons.place_rounded,
                              color: Colors.white,
                              size: 20.sp,
                            ),
                            10.horizontalSpace,
                            Flexible(
                              child: Text(
                                controller.placemarks.first.locality ?? '',
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(14),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 10.w),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                decoration: const BoxDecoration(
                  color: green,
                  image: DecorationImage(
                      image: AssetImage("assets/images/background apk.png"),
                      fit: BoxFit.fitWidth),
                ),
                child: controller.obx(
                  (state) => SingleChildScrollView(
                    child: Stack(
                      children: [
                        Container(
                          width: 1.sw,
                          height: .7.sh,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                        ).paddingOnly(top: 200.h),
                        Image.asset(
                          "assets/images/background apk.png",
                        ),
                        Column(
                          children: [
                            timeCard(controller.prayerTimeString,
                                    controller.prayerNameString)
                                .paddingSymmetric(horizontal: 10.w),
                            50.verticalSpace,
                            MenuCard(),
                            20.verticalSpace,
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(.5),
                                      blurRadius: 10,
                                      offset: const Offset(0, 10),
                                    ),
                                  ],
                                ),
                                child: Image.asset(
                                  'assets/images/banner.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            20.verticalSpace,
                            doaHariIni(),
                          ],
                        ).paddingSymmetric(horizontal: 10.w, vertical: 10.h),
                      ],
                    ),
                  ),
                  onError: (error) => Center(
                    child: Text(error.toString()),
                  ),
                  onLoading: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      onLoading: const Center(
        child: CircularProgressIndicator.adaptive(
          backgroundColor: green,
          strokeWidth: 3,
        ),
      ),
      onError: (error) => Center(
        child: Text(error.toString()),
      ),
    ));
  }

  Center timeCard(String time, String name) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(name, style: TextStyle(fontSize: 18.sp, color: Colors.white)),
          10.verticalSpace,
          Text(time,
              style: TextStyle(
                  fontSize: 36.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          10.verticalSpace,
          Obx(() => Text(
              controller.prayerTimes
                          .timeForPrayer(controller.prayerNext)
                          ?.hour !=
                      null
                  ? "-" + controller.prayerTimeObs.value
                  : "Subuh pada 0${controller.prayerTimes.fajr.hour}:0${controller.prayerTimes.fajr.minute}",
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.white,
              ))),
        ],
      ),
    );
  }

  Row dateInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat('EEEE, d MMMM', "id_ID").format(controller.today) +
                  " " +
                  DateTime.now().year.toString(),
              style: TextStyle(
                fontSize: ScreenUtil().setSp(17),
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            10.verticalSpace,
            Text(
              controller.todayHijri.toFormat("dd MMMM yyyy"),
              style: TextStyle(
                fontSize: ScreenUtil().setSp(14),
                color: Colors.white,
              ),
            ),
          ],
        ),
        PopupMenuButton(
          child: CircleAvatar(
            maxRadius: 18.r,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.more_horiz_rounded,
              color: Colors.black,
              size: 30.sp,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          onSelected: (value) {
            if (value == 1) {
              Get.to(() => const FeedbackView());
            } else if (value == 2) {
              Get.to(() => const AboutView());
            } else if (value == 3) {
              AppSettings.openNotificationSettings();
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              child: Row(
                children: [
                  const Icon(
                    Icons.feedback_outlined,
                    color: Colors.black,
                  ),
                  10.horizontalSpace,
                  const Text("Umpan balik"),
                ],
              ),
              value: 1,
            ),
            PopupMenuItem(
              child: Row(
                children: [
                  const Icon(
                    Icons.info_outline,
                    color: Colors.black,
                  ),
                  10.horizontalSpace,
                  const Text("Tentang"),
                ],
              ),
              value: 2,
            ),
            PopupMenuItem(
              child: Row(
                children: [
                  const Icon(
                    Icons.notifications_active_outlined,
                    color: Colors.black,
                  ),
                  10.horizontalSpace,
                  const Text("Notification"),
                ],
              ),
              value: 3,
            ),
          ],
        ),
      ],
    );
  }

  Container MenuCard() {
    return Container(
      width: 1.sw,
      height: 0.2.sh,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 2 / 2,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: controller.menu.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (controller.menu[index].routes != "-") {
                Get.toNamed(controller.menu[index].routes);
              } else {
                Get.snackbar(
                  "Under Development",
                  "Fitur ini sedang dalam tahap pengembangan",
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.orange,
                  colorText: Colors.white,
                  margin: const EdgeInsets.all(10),
                );
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  controller.menu[index].image,
                  width: 30.w,
                  height: 30.h,
                ),
                TextRegular(
                  text: controller.menu[index].name,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          );
        },
      ).paddingAll(20.r),
    );
  }

  Widget asmaUlHusnaCard() {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.asmaulHusna.names?.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 30,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          width: 1.sw,
          height: 400.h,
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
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
                            '${index + 1}',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(10),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  10.horizontalSpace,
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${controller.asmaulHusna.names?[index].nameSimple} - '
                          '${controller.asmaulHusna.names?[index].name}',
                          style: TextStyle(
                              fontSize: 13.sp, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ).paddingAll(20.r),
              Flexible(
                child: Image.network(
                  width: 1.sw,
                  '${controller.asmaulHusna.names?[index].nameArabic}',
                  fit: BoxFit.cover,
                ).paddingAll(20.r),
              ),
            ],
          ),
        ).paddingOnly(bottom: 10.h);
      },
    );
  }

  Widget doaHariIni() {
    return Card(
      color: Colors.grey[100],
      child: SizedBox(
        height: .26.sh,
        width: 1.sw,
        child: Column(
          children: [
            10.verticalSpace,
            Row(
              children: [
                Image.asset(
                  "assets/icon/praying.png",
                  width: 32.w,
                  height: 32.h,
                ),
                10.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextBold(
                      text: "Doa Hari Ini",
                      fontSize: 12.sp,
                    ),
                    TextLight(
                      text: "Wearing a garment",
                      fontSize: 10.sp,
                    )
                  ],
                ),
                const Spacer(),
                TextRegular(
                  text: "Lebih banyak",
                  fontSize: 12.sp,
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 18.r,
                )
              ],
            ).paddingSymmetric(horizontal: 20.w),
            20.verticalSpace,
            Text(
              "الْحَمْدُ لِلّهِ الَّذِي كَسَانِي هَذَا (الثَّوْبَ) وَرَزَقَنِيهِ مِنْ غَـيـْرِ حَوْلٍ مِنِّي وَلَا قُـوَّةٍ",
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 18.sp,
                fontFamily: "UthmanicHafs",
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ).paddingSymmetric(horizontal: 20.w),
            10.verticalSpace,
            TextRegular(
              fontSize: 12.sp,
              textAlign: TextAlign.left,
              text:
                  "Praise is to Allah Who has clothed me with this (garment) and provided it for me, though I was powerless myself and incapable",
            ).paddingSymmetric(horizontal: 15.w),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: green, minimumSize: Size(150.w, 30.h)),
                  child: TextBold(
                    text: "Baca",
                    textColour: Colors.white,
                    fontSize: 14.sp,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: green, minimumSize: Size(150.w, 30.h)),
                  child: TextBold(
                    text: "Bagikan",
                    textColour: Colors.white,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
