import 'package:flutter/material.dart';

class MyThemeData {
  static Color lightPrimaryColor = const Color(0xFFB7935F);
  static Color darkPrimaryColor = const Color(0xFF141A2E);
  static Color yellowColor = const Color(0xFFFACC1D);

  static ThemeData lightTheme = ThemeData(
    primaryColor: lightPrimaryColor,
    colorScheme: ColorScheme.fromSeed(
        seedColor: lightPrimaryColor,
        primary: lightPrimaryColor,
        onPrimary: Color(0xFFffffff),
        secondary: Color(0x79B7935F),
        onSecondary: Colors.black),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        // color: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "El Messiri",
            fontSize: 30,
            color: Colors.black)),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontFamily: "ElMessiri",
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontFamily: "El Messiri",
        fontWeight: FontWeight.w500,
        fontSize: 25,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontFamily: "El Messiri",
        fontWeight: FontWeight.w400,
        fontSize: 25,
        color: Colors.black,
      ),
      bodySmall: TextStyle(
        fontFamily: "El Messiri",
        fontWeight: FontWeight.w400,
        fontSize: 20,
        color: Colors.black,
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFFB7935F),
      selectedItemColor: Colors.black,
      selectedIconTheme: IconThemeData(
        color: Colors.black,
        size: 35,
      ),
      selectedLabelStyle: TextStyle(
          color: Colors.black, fontSize: 20, fontFamily: "El Messiri"),
      unselectedItemColor: Colors.white,
      unselectedIconTheme: IconThemeData(
        color: Colors.white,
        size: 20,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
      primaryColor: darkPrimaryColor,
      colorScheme: ColorScheme.fromSeed(
          seedColor: darkPrimaryColor,
          primary: darkPrimaryColor,
          onPrimary: const Color(0xFFffffff),
          secondary: yellowColor,
          onSecondary: Colors.black),
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          color: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "El Messiri",
              fontSize: 30,
              color: Colors.white)),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontFamily: "ElMessiri",
          color: Colors.white,
        ),
        bodyLarge: TextStyle(
          fontFamily: "El Messiri",
          fontWeight: FontWeight.w500,
          fontSize: 25,
          color: yellowColor,
        ),
        bodyMedium: TextStyle(
          fontFamily: "El Messiri",
          fontWeight: FontWeight.w400,
          fontSize: 25,
          color: yellowColor,
        ),
        bodySmall: TextStyle(
          fontFamily: "El Messiri",
          fontWeight: FontWeight.w400,
          fontSize: 20,
          color: yellowColor,
        ),
      ),
      scaffoldBackgroundColor: Colors.transparent,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF141A2E),
        selectedItemColor: Color(0xffFACC1D),
        selectedIconTheme: IconThemeData(
          size: 35,
          color: Color(0xffFACC1D),
        ),
        selectedLabelStyle: TextStyle(
            color: MyThemeData.yellowColor,
            fontSize: 20,
            fontFamily: "El Messiri"),
        unselectedItemColor: Colors.white,
        unselectedIconTheme: IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ));
}
