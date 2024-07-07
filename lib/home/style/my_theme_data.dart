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
        iconTheme: IconThemeData(color: Colors.black),
        color: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black)),
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFFB7935F),
      selectedItemColor: Colors.black,
      selectedIconTheme: IconThemeData(
        color: Colors.black,
        size: 42,
      ),
      unselectedItemColor: Colors.white,
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
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white)),
      scaffoldBackgroundColor: Colors.transparent,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF141A2E),
        selectedItemColor: Color(0xFFFACC1D),
        selectedIconTheme: IconThemeData(
          color: Color(0xFFFACC1D),
          size: 42,
        ),
        unselectedItemColor: Colors.white,
      ));
}
