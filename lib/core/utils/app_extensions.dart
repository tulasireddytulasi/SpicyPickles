import 'package:flutter/material.dart';

extension CustomTextThemeExtension on BuildContext {
  TextTheme? get textStyle => Theme.of(this).textTheme;
}

extension ColorThemeExtension on BuildContext {
  ColorScheme? get colorScheme => Theme.of(this).colorScheme;
}