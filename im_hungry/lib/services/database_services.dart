import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:im_hungry/models/mood.dart';

class DatabaseServices {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  Future<void> setMood(int index) async {
    late final statusDocRef = db
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("status")
        .doc("currentStatus");

    await statusDocRef.set({"current": index});
  }

Future<Mood> getMood() async {
      late final statusDocRef = db
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("status")
        .doc("currentStatus");
}
  Future<bool> checkPartner() async {
    final data = await db.collection("users").doc(auth.currentUser!.uid).collection("partner").doc("partnerInfo").get();
    final fetched = data.data();

    if(fetched != null) return true; else return false;
  }

}
