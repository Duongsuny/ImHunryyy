import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SetupServices {
  //check if user has setup?
  static Future<String> isSetup() async {
    final db = FirebaseFirestore.instance;
    final auth = FirebaseAuth.instance;
    final data = await db.collection("users").doc(auth.currentUser!.uid).get();

    final fetched = data.data();
    if (fetched?["name"] != null) {
      return (fetched?["name"]);
    } else
      return "nothing";
  }

  //check if this user has a partner
  static Future<bool> hasPartner() async {
    final db = FirebaseFirestore.instance;
    final auth = FirebaseAuth.instance;
    final data = await db.collection("users").doc(auth.currentUser!.uid).get();

    final fetched = data.data();
    return fetched?["partner"] != null;
  }

//check if phone number exist
  static Future<bool> checkPartnerExist(String phoneNumber) async {
    final db = FirebaseFirestore.instance;
    final snapshot = await db
        .collection("users")
        .where("phoneNumber", isEqualTo: phoneNumber)
        .get();
    return snapshot.docs.isNotEmpty;
  }

//connect to an already existed partner
  static Future<void> connectToPartner(String phoneNumber) async {
    final db = FirebaseFirestore.instance;
    final auth = FirebaseAuth.instance;
    final myID = auth.currentUser!.uid;
    final snapshot = await db
        .collection("users")
        .where("phoneNumber", isEqualTo: phoneNumber)
        .get();
    final partnerID = snapshot.docs[0].id;
    db
        .collection("users")
        .doc(partnerID)
        .set({"partner": myID}, SetOptions(merge: true));

    db
        .collection("users")
        .doc(myID)
        .set({"partner": partnerID}, SetOptions(merge: true));
  }
}
