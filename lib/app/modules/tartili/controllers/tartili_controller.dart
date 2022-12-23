import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class TartiliController extends GetxController {
  final tartiliRef = FirebaseFirestore.instance.collection('tartilli');
  final count = 0.obs;

  Stream<QuerySnapshot> tartiliStream() {
    return tartiliRef.snapshots();
  }

  @override
  void onInit() async {
    super.onInit();
    var data = await tartiliRef.snapshots().first;
    print(data.docs.length);
    print(data.docs[0].data()['data']);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
