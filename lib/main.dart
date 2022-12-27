import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:muslim_app/app/utils/colors.dart';
import 'package:muslim_app/firebase_options.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'app/routes/app_pages.dart';
import 'app/utils/notification_api.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await ScreenUtil.ensureScreenSize();
  await initializeDateFormatting('id_ID', null);
  await GetStorage.init();
  NotifictionApi.init();
  tz.initializeTimeZones();

  final box = GetStorage();
  if (box.read('welcome') == null) {
    box.write('welcome', 0);
    NotifictionApi.showNotification(
        id: 9887,
        title: "Welcome",
        body: "Selamat Datang di Muslim App",
        payload: "");
  }

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent),
  );
  runApp(
    ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, widget) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(
            color: green,
            elevation: 0,
            centerTitle: false,
            iconTheme: const IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
          ),
        ),
      ),
    ),
  );
}
