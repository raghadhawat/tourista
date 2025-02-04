import 'package:flutter/material.dart';
import 'package:tourista/constants.dart';

ThemeData themeData() {
  return ThemeData(
      colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: kPrimaryColor,
    onPrimary: Colors.white,
    secondary: Colors.white,
    onSecondary: Colors.black,
    error: Colors.black,
    onError: Colors.black,
    background: Colors.white,
    onBackground: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black,
  ));
}
