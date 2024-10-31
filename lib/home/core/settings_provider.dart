import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  String currentLanguage = "en";
  ThemeMode currentThemeMode = ThemeMode.dark;
  void changeLanguageCode(String newLanguage) {
    currentLanguage = newLanguage;
    notifyListeners();
  }

  bool isDark() {
    return currentThemeMode == ThemeMode.dark;
  }

  void changeThemeMode(ThemeMode newThemeMode) {
    if (currentThemeMode == newThemeMode) return;

    currentThemeMode = newThemeMode;
    notifyListeners();
  }

  String getHomeBackground() {
    return currentThemeMode == ThemeMode.dark
        ? "assets/images/bg.png"
        : "assets/images/background.png";
  }
}
