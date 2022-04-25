import 'package:flutter/material.dart';

class LightTheme {
  final _lightColor = _LightColor();
  late ThemeData theme;

  LightTheme() {
    theme = ThemeData(
        textTheme:
            ThemeData.light().textTheme.copyWith(subtitle1: TextStyle(fontSize: 25, color: _lightColor.parliement)),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.amber),
        buttonTheme: const ButtonThemeData(colorScheme: ColorScheme.light(onPrimary: Colors.purple)));
  }
}

class _LightColor {
  final Color green = Colors.green;
  final Color parliement = const Color.fromARGB(255, 10, 73, 144);
}
