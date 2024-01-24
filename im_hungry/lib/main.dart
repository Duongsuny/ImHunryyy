import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:im_hungry/firebase_options.dart';
import 'package:im_hungry/models/time_together/time_together_model.dart';
import 'package:im_hungry/pages/auth/auth_page.dart';
import 'package:im_hungry/pages/auth/sign_up.dart';
import 'package:im_hungry/pages/choose_role.dart';
import 'package:im_hungry/pages/components_test.dart';
import 'package:im_hungry/pages/loading.dart';
import 'package:im_hungry/pages/main_page.dart';
import 'package:im_hungry/pages/mood_status.dart';
import 'package:im_hungry/pages/settings.dart';
import 'package:im_hungry/pages/time_together.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initializeDateFormatting().then((_) => runApp(const ImHungry()));
}

class ImHungry extends StatelessWidget {
  const ImHungry({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.quicksandTextTheme(),
        scaffoldBackgroundColor: HexColor("#fffaea"),
      ),
      //home: MainPage(),
      initialRoute: '/auth',
      routes: {
        '/': (context) => MainPage(),
        '/time': (context) => DayTogether(),
        '/settings': (context) => Settings(),
        '/signup' : (context) => SignUp(),
        '/auth': (context) => AuthPage()
      },
    );
  }
}
