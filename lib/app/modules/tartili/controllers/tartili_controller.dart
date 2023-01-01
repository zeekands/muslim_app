import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class TartiliController extends GetxController {
  final tartiliRef = FirebaseFirestore.instance.collection('tartilli');

  Stream<QuerySnapshot> tartiliStream() {
    return tartiliRef.snapshots();
  }
}
