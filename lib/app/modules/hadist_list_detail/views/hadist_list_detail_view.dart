import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/hadist_list_detail_controller.dart';

class HadistListDetailView extends GetView<HadistListDetailController> {
  const HadistListDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.hadistList.chapterName!),
        titleTextStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: ListView.separated(
        itemCount: controller.hadistList.verses!.length,
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey[400],
          );
        },
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 0.75.sw,
                    child: Text(
                        "${controller.hadistList.verses![index].arabicText}",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 25.sp, fontFamily: "UthmanicHafs")),
                  ),
                ],
              ),
              10.verticalSpace,
              Text("${controller.hadistList.verses![index].verseText}",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      height: 1.3.sp,
                      fontSize: 14.sp,
                      color: Colors.grey[500])),
            ],
          ).paddingAll(20.r);
        },
      ),
    );
  }
}
