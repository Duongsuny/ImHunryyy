import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:im_hungry/models/infromation.dart';

Future<void> fillInformation(UserInformation information) async {
      final db = FirebaseFirestore.instance;
    final auth = FirebaseAuth.instance;
    final myID = auth.currentUser!.uid;

    db.collection("users").doc(myID).set(information.toMap());
}