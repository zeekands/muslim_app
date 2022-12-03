import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:muslim_app/app/modules/qiblah/views/qiblah_compass.dart';
import 'package:muslim_app/app/utils/colors.dart';

import '../controllers/qiblah_controller.dart';

class QiblahView extends GetView<QiblahController> {
  const QiblahView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final deviceSupport = FlutterQiblah.androidDeviceSensorSupport();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: green,
        title: const Text('Qiblah'),
      ),
      body: FutureBuilder(
        future: deviceSupport,
        builder: (_, AsyncSnapshot<bool?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error.toString()}"),
            );
          }

          if (snapshot.data!) {
            return QiblahCompass().paddingAll(20.r);
          } else {
            return Center(
              child: Text("Error: ${snapshot.error.toString()}"),
            );
          }
        },
      ),
    );
  }
}
