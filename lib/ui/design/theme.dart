import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Colors.yellowAccent,
        onPrimary: Colors.black,
        secondary: Colors.yellowAccent,
        onSecondary: Colors.brown,
        error: Colors.red,
        onError: Colors.red,
        background: Colors.black,
        onBackground: Colors.black,
        surface: Colors.black,
        onSurface: Colors.yellow,
      ),
      textTheme: const TextTheme(labelLarge: TextStyle(fontSize: 20)));
}
