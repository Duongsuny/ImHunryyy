import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseServices {
  final CollectionReference usersDB =
      FirebaseFirestore.instance.collection("users");
  //Write user to database

  Future<void> addUser(String phoneNumber) {
    return usersDB.add({"phoneNumber": phoneNumber});
  }

Future<bool> checkPartner() async {
  final uid = FirebaseAuth.instance.currentUser?.uid ?? "";
  final partnerRecordRef = FirebaseFirestore.instance
      .collection("users")
      .doc(uid)
      .collection("connected")
      .doc("partner");

  try {
    final docSnapshot = await partnerRecordRef.get();
    return docSnapshot.exists;
  } catch (error) {
    print("Error checking partner: ${error.toString()}");
    return false;
  }
}
}
