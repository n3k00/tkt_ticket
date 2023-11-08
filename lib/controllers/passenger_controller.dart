import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class PassengerController extends GetxController {
  final auth = FirebaseAuth.instance;

  void deletePassenger(int? timestamp) {
    /*FirebaseFirestore.instance
        .collection("tickets")
        .where('timestamp', isEqualTo: timestamp)
        .get()
        .then((value) {
      // Once we get the results, begin a batch
      var batch = FirebaseFirestore.instance.batch();
      batch.delete(value.docs);
    });*/
    print(timestamp);
    Get.back();
  }
}
