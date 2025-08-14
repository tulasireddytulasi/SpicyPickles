// Purpose: Defines the color palette and text styles for the entire application.
// File: app_theme.dart
// Folder: lib/config/

import 'package:flutter/material.dart';

class AppTheme {
  // Define primary and secondary colors based on the HTML's Tailwind config
  static const Color primaryColor = Color(0xFF267E3E); // #267E3E
  static const Color secondaryColor = Color(0xFFFBC02D); // #FBC02D
  static const Color gray800 = Color(0xFF2D3748); // Equivalent to text-gray-800
  static const Color gray500 = Color(0xFF718096); // Equivalent to text-gray-500
  static const Color gray600 = Color(0xFF4A5568); // Equivalent to text-gray-600
  static const Color gray100 = Color(0xFFF7FAFC); // Equivalent to bg-gray-100
  static const Color red600 = Color(0xFFE53E3E); // Equivalent to text-red-600
  static const Color red100 = Color(0xFFFED7D7); // Equivalent to bg-red-100
  static const Color whiteColor = Color(0xFFFFFFFF); // White color
  static const Color blackColor = Color(0xFF000000); // Black color
  static const Color gray300 = Color(0xFFCBD5E0); // Equivalent to bg-gray-300
  static const Color background = Color(0xFFF7FAFC); // Equivalent to bg-background
  static const Color divider = Color(0xFFE5E7EB); // Equivalent to bg-background


  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    secondaryHeaderColor: secondaryColor,
    scaffoldBackgroundColor: whiteColor,
    fontFamily: 'Poppins', // Poppins is used in the HTML
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: whiteColor),
      titleTextStyle: TextStyle(
        color: gray800,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 96, fontWeight: FontWeight.w300, color: gray800),
      displayMedium: TextStyle(fontSize: 60, fontWeight: FontWeight.w400, color: gray800),
      displaySmall: TextStyle(fontSize: 48, fontWeight: FontWeight.w400, color: gray800),
      headlineMedium: TextStyle(fontSize: 34, fontWeight: FontWeight.w400, color: gray800),
      headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: gray800),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: gray800), // h1 in HTML
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: gray600),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: gray600), // Default text
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: whiteColor), // Button text
      bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: gray500), // Small text
      labelSmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: gray500), // Extra small text
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: primaryColor,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)), // 'button' in HTML
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins',
        ),
      ),
    ),
    cardTheme: CardThemeData(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0), // Default in HTML
      ),
    ),
    // Define custom border radius for consistency with Tailwind
    extensions: <ThemeExtension<dynamic>>[
      _CustomBorderRadius(
        none: BorderRadius.circular(0.0),
        sm: BorderRadius.circular(4.0),
        defaultRadius: BorderRadius.circular(8.0),
        md: BorderRadius.circular(12.0),
        lg: BorderRadius.circular(16.0),
        xl: BorderRadius.circular(20.0),
        twoXl: BorderRadius.circular(24.0),
        threeXl: BorderRadius.circular(32.0),
        full: BorderRadius.circular(9999.0),
        button: BorderRadius.circular(8.0),
      ),
    ],
  );
}

// Custom ThemeExtension for border radii
class _CustomBorderRadius extends ThemeExtension<_CustomBorderRadius> {
  final BorderRadius none;
  final BorderRadius sm;
  final BorderRadius defaultRadius;
  final BorderRadius md;
  final BorderRadius lg;
  final BorderRadius xl;
  final BorderRadius twoXl;
  final BorderRadius threeXl;
  final BorderRadius full;
  final BorderRadius button;

  const _CustomBorderRadius({
    required this.none,
    required this.sm,
    required this.defaultRadius,
    required this.md,
    required this.lg,
    required this.xl,
    required this.twoXl,
    required this.threeXl,
    required this.full,
    required this.button,
  });

  @override
  ThemeExtension<_CustomBorderRadius> copyWith({
    BorderRadius? none,
    BorderRadius? sm,
    BorderRadius? defaultRadius,
    BorderRadius? md,
    BorderRadius? lg,
    BorderRadius? xl,
    BorderRadius? twoXl,
    BorderRadius? threeXl,
    BorderRadius? full,
    BorderRadius? button,
  }) {
    return _CustomBorderRadius(
      none: none ?? this.none,
      sm: sm ?? this.sm,
      defaultRadius: defaultRadius ?? this.defaultRadius,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      twoXl: twoXl ?? this.twoXl,
      threeXl: threeXl ?? this.threeXl,
      full: full ?? this.full,
      button: button ?? this.button,
    );
  }

  @override
  ThemeExtension<_CustomBorderRadius> lerp(
      covariant ThemeExtension<_CustomBorderRadius>? other, double t) {
    if (other is! _CustomBorderRadius) {
      return this;
    }
    return _CustomBorderRadius(
      none: BorderRadius.lerp(none, other.none, t)!,
      sm: BorderRadius.lerp(sm, other.sm, t)!,
      defaultRadius: BorderRadius.lerp(defaultRadius, other.defaultRadius, t)!,
      md: BorderRadius.lerp(md, other.md, t)!,
      lg: BorderRadius.lerp(lg, other.lg, t)!,
      xl: BorderRadius.lerp(xl, other.xl, t)!,
      twoXl: BorderRadius.lerp(twoXl, other.twoXl, t)!,
      threeXl: BorderRadius.lerp(threeXl, other.threeXl, t)!,
      full: BorderRadius.lerp(full, other.full, t)!,
      button: BorderRadius.lerp(button, other.button, t)!,
    );
  }
}

extension CustomBorderRadiusExtension on ThemeData {
  _CustomBorderRadius get customBorderRadius =>
      extension<_CustomBorderRadius>() as _CustomBorderRadius;
}
