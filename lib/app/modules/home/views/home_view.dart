import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
                        width: .4.sw,
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
                                controller.placemarks.first
                                        .subAdministrativeArea ??
                                    '',
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
                      fit: BoxFit.fill),
                ),
                child: controller.obx(
                  (state) => SingleChildScrollView(
                    child: Stack(
                      children: [
                        Container(
                          width: 1.sw,
                          height: 45.8.sh,
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
                            asmaUlHusnaCard(),
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
              DateFormat('EEEE, d MMMM', "id_ID").format(controller.today),
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
        CircleAvatar(
            maxRadius: 18.r,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.more_horiz_rounded,
              color: Colors.black,
              size: 30.sp,
            )),
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
            onTap: () => Get.toNamed(controller.menu[index].routes),
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
}

class menuOld extends StatelessWidget {
  const menuOld({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          20.horizontalSpace,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.DOA),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icon/quran hijau.png',
                          width: 24.w,
                          height: 24.h,
                        ),
                        5.verticalSpace,
                        TextRegular(
                          text: "Doa\nHarian",
                          fontSize: 10.sp,
                        ),
                      ],
                    ),
                  ),
                  25.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icon/praying.png',
                        width: 24.w,
                        height: 24.h,
                      ),
                      5.verticalSpace,
                      const TextRegular(text: "Dzikir \nPetang")
                    ],
                  ),
                  25.horizontalSpace,
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.ATKHTAR),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icon/praying.png',
                          width: 24.w,
                          height: 24.h,
                        ),
                        5.verticalSpace,
                        const TextRegular(text: "Tartili \nAudio")
                      ],
                    ),
                  ),
                  25.horizontalSpace,
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.QIBLAH),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icon/praying.png',
                          width: 24.w,
                          height: 24.h,
                        ),
                        5.verticalSpace,
                        const TextRegular(text: "Tartili \nNo Audio")
                      ],
                    ),
                  ),
                  25.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icon/praying.png',
                        width: 24.w,
                        height: 24.h,
                      ),
                      5.verticalSpace,
                      const TextRegular(text: "Khadist \nTKIT")
                    ],
                  ),
                ],
              ),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.DOA),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icon/quran hijau.png',
                          width: 24.w,
                          height: 24.h,
                        ),
                        5.verticalSpace,
                        TextRegular(
                          text: "Hadist \nSMPIT",
                          fontSize: 10.sp,
                        ),
                      ],
                    ),
                  ),
                  25.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icon/praying.png',
                        width: 24.w,
                        height: 24.h,
                      ),
                      5.verticalSpace,
                      const TextRegular(text: "Hadist\n SMAIT")
                    ],
                  ),
                  25.horizontalSpace,
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.ATKHTAR),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icon/praying.png',
                          width: 24.w,
                          height: 24.h,
                        ),
                        5.verticalSpace,
                        const TextRegular(text: "Al Quran \nHalaman")
                      ],
                    ),
                  ),
                  25.horizontalSpace,
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.QIBLAH),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icon/praying.png',
                          width: 24.w,
                          height: 24.h,
                        ),
                        5.verticalSpace,
                        const TextRegular(text: "Dzikir \nBada Sholat ")
                      ],
                    ),
                  ),
                  25.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icon/praying.png',
                        width: 24.w,
                        height: 24.h,
                      ),
                      5.verticalSpace,
                      const TextRegular(text: "Tutorial \n  Ibadah")
                    ],
                  ),
                ],
              ),
            ],
          ),
          20.horizontalSpace,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.DOA),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.hand_draw,
                          size: 32.r,
                        ),
                        5.verticalSpace,
                        const Text("Doa")
                      ],
                    ),
                  ),
                  25.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.room_preferences,
                        size: 32.r,
                      ),
                      5.verticalSpace,
                      const Text("Tasbih")
                    ],
                  ),
                  25.horizontalSpace,
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.ATKHTAR),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.hand_raised_fill,
                          size: 32.r,
                        ),
                        5.verticalSpace,
                        const Text("Akhtar")
                      ],
                    ),
                  ),
                  25.horizontalSpace,
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.QIBLAH),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.compass,
                          size: 32.r,
                        ),
                        5.verticalSpace,
                        const Text("Qibla")
                      ],
                    ),
                  ),
                  25.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.calendar,
                        size: 32.r,
                      ),
                      5.verticalSpace,
                      const Text("Calendar")
                    ],
                  ),
                ],
              ),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.DOA),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.hand_draw,
                          size: 32.r,
                        ),
                        5.verticalSpace,
                        const Text("Doa")
                      ],
                    ),
                  ),
                  25.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.room_preferences,
                        size: 32.r,
                      ),
                      5.verticalSpace,
                      const Text("Tasbih")
                    ],
                  ),
                  25.horizontalSpace,
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.ATKHTAR),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.hand_raised_fill,
                          size: 32.r,
                        ),
                        5.verticalSpace,
                        const Text("Akhtar")
                      ],
                    ),
                  ),
                  25.horizontalSpace,
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.QIBLAH),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.compass,
                          size: 32.r,
                        ),
                        5.verticalSpace,
                        const Text("Qibla")
                      ],
                    ),
                  ),
                  25.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.calendar,
                        size: 32.r,
                      ),
                      5.verticalSpace,
                      const Text("Calendar")
                    ],
                  ),
                ],
              ),
            ],
          ),
          50.horizontalSpace,
        ],
      ),
    );
  }
}
