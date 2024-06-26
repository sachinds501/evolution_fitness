import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      fontFamily: GoogleFonts.openSans().fontFamily,
      cardColor: Colors.white,
      canvasColor: lightBluishColor,
      backgroundColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white))),
      buttonTheme: const ButtonThemeData(buttonColor: Colors.blue),
      textTheme: const TextTheme(
          headline3: TextStyle(
              fontSize: 15, color: Colors.black, fontWeight: FontWeight.w600),
          bodyText1: TextStyle(
              fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
          headline6: TextStyle(
              fontSize: 12, color: Colors.black, fontWeight: FontWeight.w500),
          bodyText2: TextStyle(
              fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500)),
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        toolbarTextStyle: const TextTheme(
          headline1: TextStyle(
              fontSize: 18.0, fontFamily: 'Hind', color: Colors.black),
          bodyText2: TextStyle(
              fontSize: 18.0, fontFamily: 'Hind', color: Colors.black),
        ).headline1,
        titleTextStyle: const TextTheme(
          headline1: TextStyle(
              fontSize: 18.0, fontFamily: 'Hind', color: Colors.black),
          bodyText2: TextStyle(
              fontSize: 18.0, fontFamily: 'Hind', color: Colors.black),
        ).bodyText2,
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
          // secondary: const Color.fromARGB(255, 255, 213, 33),
          primary: Colors.white));

  //Colors
  static Color creamColor = const Color(0xfff5f5f5);
  static Color lightBluishColor = const Color.fromARGB(255, 232, 243, 252);
  // static Color cyberYellowColor = const Color.fromARGB(255, 255, 213, 33);
}
