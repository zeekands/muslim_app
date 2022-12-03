import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/routes/app_pages.dart';

import '../controllers/doa_controller.dart';

class DoaView extends GetView<DoaController> {
  const DoaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doa'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10.r,
          mainAxisSpacing: 10.r,
        ),
        itemCount: controller.doaList.length,
        itemBuilder: (BuildContext ctx, index) {
          return GestureDetector(
            onTap: () {
              Get.toNamed(Routes.DOA_LIST,
                  arguments: controller.doaList[index]);
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
                    "assets/images/moon.png",
                    height: ScreenUtil().setHeight(32),
                  ),
                  10.verticalSpace,
                  Text(
                    controller.doaList[index],
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
    );
  }
}
