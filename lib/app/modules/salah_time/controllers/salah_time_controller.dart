import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:muslim_app/app/data/models/asmaul_husna_model.dart';
import 'package:muslim_app/app/utils/notification_api.dart';

class SalahTimeController extends GetxController with StateMixin {
  var asmaulHusna = AsmaulHusna();
  final todayHijri = HijriCalendar.now();
  final today = DateTime.now();
  var myCoordinates = Coordinates(0, 0);
  final params = CalculationMethod.muslim_world_league.getParameters();

  var prayerTimes = PrayerTimes.today(
      Coordinates(0, 0), CalculationMethod.muslim_world_league.getParameters());

  Prayer prayerNow = Prayer.asr;
  Prayer prayerNext = Prayer.asr;
  String prayerTimeString = "";

  final box = GetStorage();

  final isNotificationActive = false.obs;
  var position = Position(
      latitude: 0.0,
      longitude: 0.0,
      accuracy: 0.0,
      altitude: 0.0,
      speed: 0.0,
      heading: 0.0,
      speedAccuracy: 0.0,
      timestamp: DateTime.now());

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  List<Placemark> placemarks = [];
  @override
  void onInit() async {
    super.onInit();
    change(null, status: RxStatus.empty());
    position = await determinePosition();
    placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    await loadPrayerTimes();
    change(asmaulHusna, status: RxStatus.success());

    if (await box.read('adzanNotif') != null) {
      isNotificationActive.value = box.read('adzanNotif');
    } else {
      box.write("adzanNotif", isNotificationActive.value);
    }
  }

  Future<void> loadPrayerTimes() async {
    change(null, status: RxStatus.loading());
    myCoordinates = Coordinates(
      position.latitude,
      position.longitude,
    );
    prayerTimes = PrayerTimes.today(myCoordinates, params);
    prayerNow = prayerTimes.currentPrayer();
    prayerNext = prayerTimes.nextPrayer();
    prayerTimeString =
        "${prayerTimes.timeForPrayer(prayerNow)?.hour.toString()} : ${prayerTimes.timeForPrayer(prayerNow)?.minute.toString()}";
    await Future.delayed(const Duration(milliseconds: 100));
    change(asmaulHusna, status: RxStatus.success());
  }

  void adzanNotification() {
    isNotificationActive.toggle();
    box.write("adzanNotif", isNotificationActive.value);
    if (isNotificationActive.value) {
      NotifictionApi.scheduledNotification(
        id: 100,
        title: "Waktu Subuh",
        body: "Memasuki waktu shalat subuh",
        payload: "",
        scheduledDate: Time(
          prayerTimes.timeForPrayer(Prayer.fajr)?.hour ?? 0,
          prayerTimes.timeForPrayer(Prayer.fajr)?.minute ?? 0,
        ),
      );
      NotifictionApi.scheduledNotification(
        id: 101,
        title: "Waktu Dzuhur",
        body: "Memasuki waktu shalat dzuhur",
        payload: "",
        scheduledDate: Time(
          prayerTimes.timeForPrayer(Prayer.dhuhr)?.hour ?? 0,
          prayerTimes.timeForPrayer(Prayer.dhuhr)?.minute ?? 0,
        ),
      );
      NotifictionApi.scheduledNotification(
        id: 102,
        title: "Waktu Ashar",
        body: "Memasuki waktu shalat ashar",
        payload: "",
        scheduledDate: Time(
          prayerTimes.timeForPrayer(Prayer.asr)?.hour ?? 0,
          prayerTimes.timeForPrayer(Prayer.asr)?.minute ?? 0,
        ),
      );
      NotifictionApi.scheduledNotification(
        id: 103,
        title: "Waktu Maghrib",
        body: "Memasuki waktu shalat maghrib",
        payload: "",
        scheduledDate: Time(
          prayerTimes.timeForPrayer(Prayer.maghrib)?.hour ?? 0,
          prayerTimes.timeForPrayer(Prayer.maghrib)?.minute ?? 0,
        ),
      );
      NotifictionApi.scheduledNotification(
        id: 104,
        title: "Waktu Isya",
        body: "Memasuki waktu shalat isya",
        payload: "",
        scheduledDate: Time(
          prayerTimes.timeForPrayer(Prayer.isha)?.hour ?? 0,
          prayerTimes.timeForPrayer(Prayer.isha)?.minute ?? 0,
        ),
      ).then((value) => Get.snackbar("Berhasil", "Pengingat waktu shalat aktif",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white));
    } else {
      NotifictionApi.cancelAllNotification().then((value) => Get.snackbar(
          "Berhasil", "Pengingat waktu shalat dinonaktifkan",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white));
    }
  }
}
