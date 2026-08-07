import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'font_family.dart';

/// Builds the app's [ThemeData].
///
/// The app follows a dark design language (see [AppColors]).
class AppTheme {
  AppTheme._();

  static ThemeData get dark => _build();

  static ThemeData _build() {
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
      primary: AppColors.primary,
      secondary: AppColors.accent,
      error: AppColors.error,
      surface: AppColors.surface,
      onSurface: AppColors.textPrimary,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      fontFamily: FontFamilies.poppins,
      splashFactory: InkSparkle.splashFactory,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontFamily: FontFamilies.otama, fontSize: 48, color: AppColors.textPrimary),
        displayMedium: TextStyle(
            fontFamily: FontFamilies.otama, fontSize: 36, color: AppColors.textPrimary),
        displaySmall: TextStyle(
            fontFamily: FontFamilies.otama, fontSize: 30, color: AppColors.textPrimary),
        headlineLarge: TextStyle(
            fontFamily: FontFamilies.otama, fontSize: 28, color: AppColors.textPrimary),
        headlineMedium: TextStyle(
            fontFamily: FontFamilies.otama, fontSize: 24, color: AppColors.textPrimary),
        headlineSmall: TextStyle(
            fontFamily: FontFamilies.otama, fontSize: 20, color: AppColors.textPrimary),
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundColor,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        centerTitle: true,
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error),
        ),
      ),

      dividerTheme: const DividerThemeData(
        color: AppColors.borderColor,
        thickness: 1,
      ),

      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
