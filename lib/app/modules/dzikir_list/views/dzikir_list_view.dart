import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/dzikir_list_controller.dart';

class DzikirListView extends GetView<DzikirListController> {
  const DzikirListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.DzikirCategory),
      ),
      body: controller.obx(
        (state) => ListView.builder(
          itemCount: controller.dzikir.chapterCount,
          itemBuilder: (context, index) {
            return Card(
              elevation: 0,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.DZIKIR_LIST_DETAIL,
                      arguments: controller.dzikir.chapters?[index]);
                },
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
                          '${controller.dzikir.chapters?[index].chapterName}',
                          style: TextStyle(
                              fontSize: 13.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ).paddingSymmetric(horizontal: 20.w),
              ),
            ).paddingSymmetric(
              horizontal: 10.w,
            );
          },
        ).paddingOnly(top: 10.h),
        onLoading: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
