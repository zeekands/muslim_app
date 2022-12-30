import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TartiliDetailController extends GetxController {
  //TODO: Implement TartiliDetailController

  final PageController pageController = PageController();
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Stream<QuerySnapshot> getTartili() {
    return FirebaseFirestore.instance.collection('tartilli').snapshots();
  }

  void increment() => count.value++;
}
