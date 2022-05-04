import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  bool isLightTheme = true;

  void changeTheme() {
    isLightTheme = !isLightTheme;
    notifyListeners();
  }

  ThemeData get currentTheme => isLightTheme ? ThemeData.light() : ThemeData.dark();
}
