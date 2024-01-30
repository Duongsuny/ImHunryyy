import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:im_hungry/collections/moods_collection.dart';
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

  Future getMood() async {
    final statusDocRef = db
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("status")
        .doc("currentStatus");

    final statusGet = await statusDocRef.get();
    final data = statusGet.data();

    return MoodCollection().moods[data!["current"]]; // return mood correspoding index, check mood_collection.dart
  }

  Future<bool> hasPartner() async {
    final data = await db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("partner")
        .doc("partnerInfo")
        .get();
    final fetched = data.data();

    if (fetched != null)
      return true;
    else
      return false;
  }

  Future<bool> findPartner(String phoneNumber) async {
    final snapshot = await db.collection("users").where("phoneNumber", isEqualTo: phoneNumber).get();
    return snapshot.docs.isNotEmpty;
  }

  Future<void> connectToPartner(String phoneNumber) async {
    final myID = auth.currentUser!.uid;
    final snapshot = await db.collection("users").where("phoneNumber", isEqualTo: phoneNumber).get();
    final partnerID = snapshot.docs[0].id;
    db.collection("users").doc(partnerID).set({
      "parner": myID
    }, SetOptions(merge: true));

    db.collection("users").doc(myID).set({
      "parner": partnerID
    }, SetOptions(merge: true));
  }
}
