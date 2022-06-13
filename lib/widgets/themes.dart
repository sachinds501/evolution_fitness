import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      fontFamily: GoogleFonts.openSans().fontFamily,
      cardColor: Colors.white,
      canvasColor: Colors.white,
      backgroundColor: lightBluishColor,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        toolbarTextStyle: const TextTheme(
          headline1: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
          // headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(
              fontSize: 12.0, fontFamily: 'Hind', color: Colors.black),
        ).bodyText2,
        titleTextStyle: const TextTheme(
          headline1: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
          // headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(
              fontSize: 12.0, fontFamily: 'Hind', color: Colors.black),
        ).headline6,
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
          // secondary: const Color.fromARGB(255, 255, 213, 33),
          primary: Colors.white));

  //Colors
  static Color creamColor = const Color(0xfff5f5f5);
  static Color lightBluishColor = const Color.fromARGB(255, 238, 250, 255);
  // static Color cyberYellowColor = const Color.fromARGB(255, 255, 213, 33);
}
