import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/dzikir_controller.dart';

class DzikirView extends GetView<DzikirController> {
  const DzikirView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dzikir Bada Sholat'),
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
          itemCount: controller.DzikirList.length,
          itemBuilder: (BuildContext ctx, index) {
            return GestureDetector(
              onTap: () {
                Get.toNamed(Routes.DZIKIR_LIST,
                    arguments: controller.DzikirList[index]);
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
                      controller.allDzikir.dzikir![index].icon!,
                      height: ScreenUtil().setHeight(32),
                    ),
                    10.verticalSpace,
                    Text(
                      controller.DzikirList[index],
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
