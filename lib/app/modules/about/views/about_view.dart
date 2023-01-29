import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:muslim_app/app/routes/app_pages.dart';
import 'package:muslim_app/app/utils/text.dart';

import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang'),
      ),
      body: Center(
        child: Column(
          children: [
            50.verticalSpace,
            Image.asset('assets/icon/ramadan.png', width: 70.w, height: 70.h),
            20.verticalSpace,
            TextBold(text: 'KhurkasAliska', fontSize: 24.sp),
            10.verticalSpace,
            Text(
              'V 1.0.0',
              style: TextStyle(fontSize: 18.sp, color: Colors.grey[500]),
            ),
            20.verticalSpace,
            ListTile(
              dense: T,
              onTap: () {
                Get.toNamed(Routes.DEVELOPER);
              },
              leading: TextRegular(
                text: "Tentang",
                fontSize: 14.sp,
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.adaptive.arrow_forward),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
