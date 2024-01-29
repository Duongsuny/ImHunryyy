import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:im_hungry/pages/auth/sign_up.dart';
import 'package:im_hungry/pages/main_page.dart';
import 'package:im_hungry/pages/setup.dart';
import 'package:im_hungry/services/database_services.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
              return MainPage();
          } else {
            return SignUp();
          }
        }
        ),
    );
  }
}