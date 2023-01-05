import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/hadist_controller.dart';

class HadistView extends GetView<HadistController> {
  const HadistView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hadist'),
        actions: [
          // IconButton(
          //   onPressed: () {
          //     showSearch(
          //       context: context,
          //       delegate: DoaSearchDelegate(controller.listChapters),
          //     );
          //   },
          //   icon: const Icon(Icons.search),
          // ),
        ],
      ),
      body: controller.obx(
        (state) => GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10.r,
            mainAxisSpacing: 10.r,
          ),
          itemCount: controller.HadistList.length,
          itemBuilder: (BuildContext ctx, index) {
            return GestureDetector(
              onTap: () {
                Get.toNamed(Routes.HADIST_LIST,
                    arguments: controller.HadistList[index]);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.03),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      controller.allHadist.hadist![index].icon!,
                      height: ScreenUtil().setHeight(32),
                    ),
                    10.verticalSpace,
                    Text(
                      controller.HadistList[index],
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(12),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ).paddingSymmetric(horizontal: 10.r, vertical: 10.r),
      ),
    );
  }
}
