import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:im_hungry/pages/auth/sign_up.dart';
import 'package:im_hungry/pages/main_page.dart';
import 'package:im_hungry/pages/setup/fill_info.dart';
import 'package:im_hungry/services/fill_information_service.dart';
import 'package:im_hungry/services/setup_services.dart';

class Setup extends StatelessWidget {
  const Setup({super.key});

  @override
  Widget build(BuildContext context) {
    String phoneNumber = FirebaseAuth.instance.currentUser!.uid; 
    return Scaffold(
      body: FutureBuilder<bool>(
        future: InfoServices().checkInformation(phoneNumber),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            if(snapshot.data == true) {
              return const MainPage();
          }
            else {
              return const FillInfo();
            }
          } else {
            return const SignUp();
          }
        }
        ),
    );
  }
}