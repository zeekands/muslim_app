import 'dart:async';
import 'dart:convert';

import 'package:adhan/adhan.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:muslim_app/app/data/models/asmaul_husna_model.dart';
import 'package:muslim_app/app/data/models/menu_model.dart';

class HomeController extends GetxController with StateMixin {
  var asmaulHusna = AsmaulHusna();
  var menu = [];
  final todayHijri = HijriCalendar.now();
  final today = DateTime.now();
  var myCoordinates = Coordinates(0, 0);
  // Replace with your own location lat, lng.
  final params = CalculationMethod.muslim_world_league.getParameters();

  var prayerTimes = PrayerTimes.today(
      Coordinates(0, 0), CalculationMethod.muslim_world_league.getParameters());

  Prayer prayerNow = Prayer.asr;
  Prayer prayerNext = Prayer.asr;
  String prayerTimeString = "";
  String prayerNameString = "";
  final prayerTimeObs = "".obs;
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
    loadAsmaulHusna();
    startTimer();
    position = await determinePosition();
    placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    await loadPrayerTimes();
    await loadMenu();
    change(asmaulHusna, status: RxStatus.success());
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

    if (prayerTimes.timeForPrayer(prayerNext)!.hour < 10 &&
        prayerTimes.timeForPrayer(prayerNext)!.minute < 10) {
      prayerTimeString =
          "0${prayerTimes.timeForPrayer(prayerNext)?.hour}:0${prayerTimes.timeForPrayer(prayerNext)?.minute.toString()}";
    } else if (prayerTimes.timeForPrayer(prayerNext)!.hour < 10) {
      prayerTimeString =
          "0${prayerTimes.timeForPrayer(prayerNext)?.hour}:${prayerTimes.timeForPrayer(prayerNext)?.minute.toString()}";
    } else if (prayerTimes.timeForPrayer(prayerNext)!.minute < 10) {
      prayerTimeString =
          "${prayerTimes.timeForPrayer(prayerNext)?.hour}:0${prayerTimes.timeForPrayer(prayerNext)?.minute.toString()}";
    } else {
      prayerTimeString =
          "${prayerTimes.timeForPrayer(prayerNext)?.hour}:${prayerTimes.timeForPrayer(prayerNext)?.minute.toString()}";
    }
    await Future.delayed(const Duration(milliseconds: 100));
    switch (prayerNext) {
      case Prayer.fajr:
        prayerNameString = "Subuh";
        break;
      case Prayer.dhuhr:
        prayerNameString = "Dzuhur";
        break;
      case Prayer.asr:
        prayerNameString = "Ashar";
        break;
      case Prayer.maghrib:
        prayerNameString = "Maghrib";
        break;
      case Prayer.isha:
        prayerNameString = "Isya";
        break;
      case Prayer.sunrise:
        prayerNameString = "Terbit";
        break;
      default:
        prayerNameString = "Subuh";
    }
    change(asmaulHusna, status: RxStatus.success());
  }

  void loadAsmaulHusna() async {
    change(null, status: RxStatus.loading());
    asmaulHusna = AsmaulHusna.fromJson(
        jsonDecode(await rootBundle.loadString('assets/json/names.json')));
  }

  String nextPrayerTimeString() {
    var timeNow = DateTime.now();
    var nextPrayerTime = prayerTimes.timeForPrayer(prayerNext);

    Duration timeDifference = nextPrayerTime!.difference(timeNow);
    var hours = timeDifference.inHours;
    var minutes = timeDifference.inMinutes - (hours * 60);
    var seconds = timeDifference.inSeconds - (hours * 3600) - (minutes * 60);

    if (timeDifference.isNegative) {
      timeDifference = timeDifference + const Duration(days: 1);
      return timeDifference.toString().trim().substring(0, 7);

      //print("negative");
    } else {
      return timeDifference.toString().trim().substring(0, 7);
    }
  }

  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      prayerTimeObs.value = nextPrayerTimeString();
      if (prayerTimeObs.value == "00:00:00") {
        onInit();
      }
    });
  }

  Future<void> loadMenu() async {
    change(null, status: RxStatus.loading());
    menu = MenuModel.fromJson(
            jsonDecode(await rootBundle.loadString('assets/json/menu.json')))
        .menu as List<Menu>;

    change(menu, status: RxStatus.success());
  }
}
