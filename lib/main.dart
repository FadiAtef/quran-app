import 'package:flutter/material.dart';
import 'package:quran_app/home/home_screen.dart';

import 'chapter_details_screen/chapterDetails.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFB7935F),
        colorScheme: ColorScheme.fromSeed(
            seedColor: Color(0xFFB7935F),
            primary: Color(0xFFB7935F),
            onPrimary: Color(0xFFffffff),
            secondary: Color(0x79B7935F),
            onSecondary: Colors.black),
        appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black),
            color: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.black)),
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
      ),
      darkTheme: ThemeData(
          primaryColor: const Color(0xFF141A2E),
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color(0xFFB7935F),
              primary: const Color(0xFF141A2E),
              onPrimary: const Color(0xFFffffff),
              secondary: const Color(0xFFFACC1D),
              onSecondary: Colors.black),
          appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: Colors.white),
              color: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              titleTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black)),
          scaffoldBackgroundColor: Colors.transparent,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Color(0xFFB7935F),
            selectedItemColor: Colors.black,
            selectedIconTheme: IconThemeData(
              color: Colors.black,
              size: 42,
            ),
            unselectedItemColor: Colors.white,
          )),
      routes: {
        ChapterDetailsScrean.routeName: (context) => ChapterDetailsScrean(),
        HomeScreen.routeName: (_) => HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
