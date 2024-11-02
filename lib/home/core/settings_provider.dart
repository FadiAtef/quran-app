import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  SharedPreferences? _prefs;

  String _currentLanguage = "en";
  ThemeMode _currentThemeMode = ThemeMode.system;

  String get currentLanguage => _currentLanguage;
  ThemeMode get currentThemeMode => _currentThemeMode;

  SettingsProvider() {
    loadSettings();
  }

  Future<void> loadSettings() async {
    await loadTheme();
    await loadLanguage();
  }

  Future<void> loadTheme() async {
    _prefs = await SharedPreferences.getInstance();
    final String? themeName = _prefs!.getString('theme');
    if (themeName != null) {
      _currentThemeMode =
          themeName == 'Light' ? ThemeMode.light : ThemeMode.dark;
      notifyListeners();
    }
  }

  Future<void> loadLanguage() async {
    _prefs = await SharedPreferences.getInstance();
    final String? language = _prefs!.getString('language');
    if (language != null) {
      _currentLanguage = language == 'ar' ? 'ar' : 'en';
      notifyListeners();
    }
  }

  void changeLanguageCode(String newLanguage) {
    _currentLanguage = newLanguage;
    setLanguageCash(newLanguage); // Save the new language
    notifyListeners();
  }

  Future<void> setLanguageCash(String currentLanguage) async {
    _prefs = await SharedPreferences.getInstance();
    await _prefs!.setString('language', currentLanguage);
  }

  Future<void> setThemeCash(ThemeMode currentThemeMode) async {
    _prefs = await SharedPreferences.getInstance();
    String themeName = currentThemeMode == ThemeMode.light ? "Light" : "Dark";
    await _prefs!.setString('theme', themeName);
  }

  bool isDark() {
    return _currentThemeMode == ThemeMode.dark;
  }

  void changeThemeMode(ThemeMode newThemeMode) {
    if (_currentThemeMode == newThemeMode) return;

    _currentThemeMode = newThemeMode;
    setThemeCash(newThemeMode); // Save the new theme
    notifyListeners();
  }

  String getHomeBackground() {
    return isDark() ? "assets/images/bg.png" : "assets/images/background.png";
  }
}
