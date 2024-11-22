import 'package:flutter/material.dart';

extension CustomTextThemeExtension on BuildContext {
  TextTheme? get textStyle => Theme.of(this).textTheme;
}