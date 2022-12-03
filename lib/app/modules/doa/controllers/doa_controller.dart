import 'package:get/get.dart';

class DoaController extends GetxController {
  //TODO: Implement DoaController

  final doaList = [
    "Morning & Evening",
    "Home & Family",
    "Food & Drink",
    "Joy & Distress",
    "Travel",
    "Prayer",
    "Praising Allah",
    "Hajj & Umrah",
    "Good Etiquette",
    "Nature",
    "Sickness & Death",
  ];

  final count = 0.obs;

  void increment() => count.value++;
}
