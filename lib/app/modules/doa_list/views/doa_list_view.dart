import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/routes/app_pages.dart';

import '../controllers/doa_list_controller.dart';

class DoaListView extends GetView<DoaListController> {
  const DoaListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.doaCategory),
      ),
      body: controller.obx(
        (state) => ListView.builder(
          itemCount: controller.doa.chapterCount,
          itemBuilder: (context, index) {
            return Card(
              elevation: 0,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.DOA_LIST_DETAIL,
                      arguments: controller.doa.chapters?[index]);
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
                                '${controller.doa.chapters?[index].chapterNo}',
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
                        child: Text(
                          '${controller.doa.chapters?[index].chapterName}',
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
