import 'dart:convert';

import 'package:adhan/adhan.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:muslim_app/app/data/models/asmaul_husna_model.dart';

class HomeController extends GetxController with StateMixin {
  var asmaulHusna = AsmaulHusna();
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
    position = await determinePosition();
    placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    await loadPrayerTimes();
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
    prayerTimeString =
        "${prayerTimes.timeForPrayer(prayerNow)?.hour.toString()} : ${prayerTimes.timeForPrayer(prayerNow)?.minute.toString()}";
    await Future.delayed(const Duration(milliseconds: 100));
    change(asmaulHusna, status: RxStatus.success());
  }

  void loadAsmaulHusna() async {
    change(null, status: RxStatus.loading());
    asmaulHusna = AsmaulHusna.fromJson(
        jsonDecode(await rootBundle.loadString('assets/json/names.json')));
  }
}
