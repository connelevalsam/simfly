import 'package:flutter/material.dart';

class Themes {
  static const whiteColor = Color(0xFFF4F4F4);

  static TextTheme whiteText = const TextTheme(
    bodyText1: TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodyText2: TextStyle(
      fontSize: 13.0,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    headline1: TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline2: TextStyle(
      fontSize: 26.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline3: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline4: TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline5: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline6: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
  );

  static TextTheme blackText = const TextTheme(
    bodyText1: TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    bodyText2: TextStyle(
      fontSize: 13.0,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    headline1: TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline2: TextStyle(
      fontSize: 26.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline3: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline4: TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headline5: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headline6: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
  );

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: "Chalkduster",
      primaryColor: Colors.orange,
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.orange,
        backgroundColor: Colors.black,
      ),
      textTheme: blackText,
    );
  }
}
