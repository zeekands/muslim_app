import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:muslim_app/app/utils/colors.dart';
import 'package:muslim_app/app/utils/text.dart';

import '../controllers/asmaul_husna_controller.dart';

class AsmaulHusnaView extends GetView<AsmaulHusnaController> {
  const AsmaulHusnaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asmaul Husna'),
      ),
      body: controller.obx(
        (state) => ListView.builder(
          itemCount: controller.asmaulHusna.names!.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  minLeadingWidth: 0,
                  leading: Container(
                    height: double.infinity,
                    width: 15,
                    alignment: Alignment.center,
                    child: TextRegular(
                      text: "${index + 1}",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  title: Align(
                    alignment: Alignment.centerLeft,
                    child: TextBold(
                      text: controller.asmaulHusna.names![index].nameSimple
                          .toString(),
                    ),
                  ),
                  subtitle: Align(
                    alignment: Alignment.centerLeft,
                    child: TextRegular(
                      text:
                          controller.asmaulHusna.names![index].name.toString(),
                      fontSize: 14.sp,
                    ),
                  ),
                  trailing: Image.network(
                    controller.asmaulHusna.names![index].nameArabic.toString(),
                    width: 50.w,
                    height: 50.h,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.share_outlined,
                      color: green,
                    ),
                    20.horizontalSpace,
                    const Icon(
                      Icons.play_circle_fill_outlined,
                      color: green,
                    ),
                    10.horizontalSpace,
                  ],
                ),
                5.verticalSpace,
                const Divider(
                  thickness: 1,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
