import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLanguage = 'en';
   ThemeMode appMode = ThemeMode.light;
  void changeLanguage(String newLanguage) {
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;
    notifyListeners();
  }

  void changeTheme(ThemeMode newTheme) {
    if (appMode == newTheme) {
      return;
    }
    appMode = newTheme;
    notifyListeners();
  }
}
