import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  Future<bool> isLogin() async {
    final user = await _auth.currentUser;
    return user == null ? false : true;
  }
}