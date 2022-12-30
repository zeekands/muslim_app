import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/utils/colors.dart';
import 'package:share_plus/share_plus.dart';

import '../controllers/atkhtar_controller.dart';

class AtkhtarView extends GetView<AtkhtarController> {
  const AtkhtarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: green,
        appBar: AppBar(
          backgroundColor: green,
          title: const Text('Atkhtar'),
          titleTextStyle: TextStyle(
            fontSize: ScreenUtil().setSp(18),
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        body: controller.obx(
            (state) => Column(
                  children: [
                    ColoredBox(
                      color: green,
                      child: SizedBox(
                        height: ScreenUtil().setHeight(50),
                        child: TabBar(
                          labelColor: Colors.black,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: Colors.yellowAccent,
                          tabs: [
                            Tab(
                              child: Text('MORNING',
                                  style: TextStyle(
                                      fontSize: 13.sp, color: Colors.white)),
                            ),
                            Tab(
                              child: Text('EVENING',
                                  style: TextStyle(
                                      fontSize: 13.sp, color: Colors.white)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      child: TabBarView(
                        children: [
                          atkhtarMorning(),
                          atkhtarEvening(),
                        ],
                      ),
                    ),
                  ],
                ),
            onLoading: const CircularProgressIndicator.adaptive(
              backgroundColor: green,
            ),
            onEmpty: const Text("Kosong")),
      ),
    );
  }

  ListView atkhtarMorning() {
    return ListView.builder(
        reverse: true,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(20.r),
        itemCount: controller.atkhtarMorning.length,
        itemBuilder: (context, index) {
          return Container(
            width: .8.sw,
            padding: EdgeInsets.all(20.r),
            decoration: BoxDecoration(
              color: peach,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "${controller.atkhtarMorning[index].title}",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(24),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  20.verticalSpace,
                  SelectableText(
                    "${controller.atkhtarMorning.elementAt(index).contentAr}",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(24),
                      fontWeight: FontWeight.normal,
                      fontFamily: "UthmanicHafs",
                    ),
                  ),
                  20.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.volume_up,
                        color: Colors.black,
                        size: 30.r,
                      ),
                      //TODO : add share function
                      IconButton(
                        onPressed: () {
                          Share.share(
                              controller.atkhtars.elementAt(index).contentAr);
                        },
                        icon: Icon(
                          Icons.share_rounded,
                          color: Colors.black,
                          size: 30.r,
                        ),
                      ),
                    ],
                  ),
                  20.verticalSpace,
                  Text(
                    "${controller.atkhtarMorning.elementAt(index).contentEn}",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(18),
                        fontWeight: FontWeight.normal,
                        color: Colors.grey[500]),
                  ),
                ],
              ),
            ),
          ).paddingOnly(left: 20.w);
        });
  }

  ListView atkhtarEvening() {
    return ListView.builder(
        reverse: true,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(20.r),
        itemCount: controller.atkhtars.length,
        itemBuilder: (context, index) {
          return Container(
            width: .8.sw,
            padding: EdgeInsets.all(20.r),
            decoration: BoxDecoration(
              color: peach,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "${controller.atkhtars[index].title}",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(24),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  20.verticalSpace,
                  SelectableText(
                    "${controller.atkhtars.elementAt(index).contentAr}",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(24),
                        fontFamily: "UthmanicHafs"),
                  ),
                  20.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.volume_up,
                        color: Colors.black,
                        size: 30.r,
                      ),
                      //TODO : add share function
                      IconButton(
                        onPressed: () {
                          Share.share(
                              controller.atkhtars.elementAt(index).contentAr);
                        },
                        icon: Icon(
                          Icons.share_rounded,
                          color: Colors.black,
                          size: 30.r,
                        ),
                      ),
                    ],
                  ),
                  20.verticalSpace,
                  Text(
                    "${controller.atkhtarMorning.elementAt(index).contentEn}",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(18),
                        fontWeight: FontWeight.normal,
                        color: Colors.grey[500]),
                  ),
                ],
              ),
            ),
          ).paddingOnly(left: 20.w);
        });
  }
}
