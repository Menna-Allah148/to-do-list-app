import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLanguage = 'en';
  ThemeMode appMode = ThemeMode.light;
  SharedPreferences? sharedPreferences;

  AppConfigProvider() {
    getConfigData();
  }

  Future<void> getConfigData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    appLanguage = sharedPreferences!.getString("appLanguage") ?? "en";
    appMode = sharedPreferences!.getString("appMode") == "dark"
        ? ThemeMode.dark
        : ThemeMode.light;
    notifyListeners();
  }

  void changeLanguage(String newLanguage) async {
    if (appLanguage == newLanguage) {
      return;
    }
    sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences!.setString("appLanguage", newLanguage);
    appLanguage = newLanguage;
    notifyListeners();
  }

  void changeTheme(ThemeMode newTheme) async {
    if (appMode == newTheme) {
      return;
    }
    sharedPreferences = await SharedPreferences.getInstance();
    // Fix the typo here
    await sharedPreferences!
        .setString("appMode", newTheme == ThemeMode.dark ? "dark" : "light");
    appMode = newTheme;
    notifyListeners();
  }
}
