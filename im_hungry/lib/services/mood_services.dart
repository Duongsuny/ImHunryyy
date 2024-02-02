import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:im_hungry/collections/moods_collection.dart';
import 'package:im_hungry/models/mood.dart';
import 'package:intl/number_symbols_data.dart';

class MoodServices {
  static Future<Map?> getMood() async {
    final db = FirebaseFirestore.instance;
    const String partnerID = "X4vcvH5g17eFlKeMILha1zOnLCZ2";
    final statusDocRef = db
        .collection("users")
        .doc(partnerID)
        .collection("status")
        .doc("currentStatus");
    final data = await statusDocRef.get();
    final fetchedMoodData = data.data();
    if (fetchedMoodData != null) {
      return fetchedMoodData;
    } else {
      return {"current": 0, "time": DateTime.now()};
    }
  }

  static Future<void> updateMood(int index, DateTime time) async {
    final db = FirebaseFirestore.instance;
    final userID = FirebaseAuth.instance.currentUser!.uid;
    final moodDocRef = db
        .collection("users")
        .doc(userID)
        .collection("status")
        .doc("currentStatus");
    await moodDocRef.set({
      "current": index,
      "time": time
    });
  }
}
