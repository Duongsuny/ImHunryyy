import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:im_hungry/models/infromation.dart';

class InfoServices {
  // return true if user already fill info
  Future<bool> checkInformation(String phoneNumber) async {
    final db = FirebaseFirestore.instance;
    final auth = FirebaseAuth.instance;
    final myID = auth.currentUser!.uid;
    final snapshot = await db
        .collection("users")
        .doc(myID)
        .get();

    final data = snapshot.data();
    return data!["role"] != null;
  }

  //write user info to db
  Future<void> fillInformation(UserInformation information) async {
    final db = FirebaseFirestore.instance;
    final auth = FirebaseAuth.instance;
    final myID = auth.currentUser!.uid;

    db.collection("users").doc(myID).set(information.toMap(), SetOptions(merge: true));
  }

  //write user role to db
  Future<void> chooseRole(String role) async {
    final db = FirebaseFirestore.instance;
    final auth = FirebaseAuth.instance;
    final myID = auth.currentUser!.uid;

    db.collection("users").doc(myID).set({
      "role": role
    }, SetOptions(merge: true));
  }
}
