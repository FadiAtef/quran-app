import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quran_app/home/home_screen.dart';

class SplashView extends StatefulWidget {
  static const String routeName = 'Splash-view';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/splash.png',
      fit: BoxFit.cover,
    );
  }
}
