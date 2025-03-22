import 'package:flutter/material.dart';

extension CustomThemeDataExtension on BuildContext {
  ThemeData get themeData => Theme.of(this);

  ColorScheme? get colorScheme => Theme.of(this).colorScheme;

  TextTheme? get textStyle => Theme.of(this).textTheme;
}
