import 'package:flutter/material.dart';
import 'package:spicypickles/app/core/utils/app_colors.dart';

abstract class AppTheme {
  ThemeData get themeData;
}

class LightTheme implements AppTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        primaryColor: AppColors.vividOrange,
        primaryColorLight: AppColors.softOrange,
        primaryColorDark: AppColors.deepRed,
        secondaryHeaderColor: AppColors.vividOrange,
        scaffoldBackgroundColor: AppColors.lightGrey,
        bottomAppBarTheme: const BottomAppBarTheme(
          color: AppColors.white,
          elevation: 4,
          shadowColor: AppColors.lightPeach,
        ),
        colorScheme: const ColorScheme(
          primary: AppColors.vividOrange,
          primaryContainer: AppColors.deepRed,
          secondary: AppColors.vividOrange,
          secondaryContainer: AppColors.softOrange,
          surface: AppColors.lightGrey,
          background: AppColors.white,
          error: AppColors.vividOrange,
          onPrimary: AppColors.white,
          onSecondary: AppColors.grey,
          onSurface: AppColors.darkGrey,
          onBackground: AppColors.grey,
          onError: AppColors.white,
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          titleSpacing: 0,
          backgroundColor: AppColors.white,
          surfaceTintColor: AppColors.white,
          foregroundColor: AppColors.white,
          titleTextStyle: TextStyle(
            fontSize: 18,
            fontFamily: 'MontserratBold',
            color: AppColors.white,
          ),
          iconTheme: IconThemeData(color: AppColors.black),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: AppColors.vividOrange,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        navigationBarTheme: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.all(
            const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'MontserratMedium',
              color: AppColors.darkGrey,
            ),
          ),
        ),
        cardTheme: CardThemeData(
          color: AppColors.white,
          shadowColor: AppColors.grey.withValues(alpha: 0.1),
          elevation: 2,
          margin: const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: const BorderSide(color: AppColors.lightGrey),
          ),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 96,
            fontWeight: FontWeight.w400,
            fontFamily: 'MontserratRegular',
            color: AppColors.darkGrey,
          ),
          displayMedium: TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.w400,
            fontFamily: 'MontserratRegular',
            color: AppColors.darkGrey,
          ),
          displaySmall: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w400,
            fontFamily: 'MontserratRegular',
            color: AppColors.darkGrey,
          ),
          headlineLarge: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w700,
            fontFamily: 'MontserratBold',
            color: AppColors.darkGrey,
          ),
          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            fontFamily: 'MontserratSemiBold',
            color: AppColors.darkGrey,
          ),
          headlineSmall: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontFamily: 'MontserratMedium',
            color: AppColors.darkGrey,
          ),
          titleLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'MontserratSemiBold',
            color: AppColors.darkGrey,
          ),
          titleMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'MontserratMedium',
            color: AppColors.darkGrey,
          ),
          titleSmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            fontFamily: 'MontserratRegular',
            color: AppColors.darkGrey,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: 'MontserratRegular',
            color: AppColors.darkGrey,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: 'MontserratRegular',
            color: AppColors.darkGrey,
          ),
          bodySmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            fontFamily: 'MontserratLight',
            color: AppColors.grey,
          ),
          labelLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontFamily: 'MontserratSemiBold',
            color: AppColors.black,
          ),
          labelMedium: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            fontFamily: 'MontserratMedium',
            color: AppColors.darkGrey,
          ),
          labelSmall: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            fontFamily: 'MontserratRegular',
            color: AppColors.grey,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.white,
          isDense: true,
          hintStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            fontFamily: 'MontserratMedium',
            color: AppColors.darkGrey,
          ),
          focusColor: AppColors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: AppColors.lightGrey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: AppColors.lightGrey, width: 1),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: AppColors.lightGrey, width: 1),
          ),
        ),
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: AppColors.darkGrey,
          contentTextStyle: TextStyle(color: AppColors.white),
          actionTextColor: AppColors.vividOrange,
        ),
        dialogTheme: const DialogThemeData(
          backgroundColor: AppColors.white,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.darkGrey,
          ),
          contentTextStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.darkGrey,
          ),
        ),
        switchTheme: SwitchThemeData(
          trackColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.vibrantRed;
            }
            return AppColors.grey;
          }),
          thumbColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.white;
            }
            return AppColors.grey;
          }),
        ),
      );
}
