import 'package:flutter/material.dart';

extension CustomThemeDataExtension on BuildContext {
  ThemeData get themeData => Theme.of(this);

  ColorScheme? get colorScheme => Theme.of(this).colorScheme;

  TextTheme? get textStyle => Theme.of(this).textTheme;
}

extension ScreenSize on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
}