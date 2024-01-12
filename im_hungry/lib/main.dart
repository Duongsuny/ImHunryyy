import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:im_hungry/pages/choose_role.dart';
import 'package:im_hungry/pages/components_test.dart';
import 'package:im_hungry/pages/loading.dart';
import 'package:intl/date_symbol_data_local.dart';


void main() {
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
      home: ComponentsTest()
    );
  }
}