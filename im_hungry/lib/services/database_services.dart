import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  final CollectionReference usersDB =
      FirebaseFirestore.instance.collection("users");
  //Write user to database

  Future<void> addUser(String phoneNumber) {
    return usersDB.add({
      "phoneNumber": phoneNumber
    });
  }
}
