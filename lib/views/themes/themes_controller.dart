import 'package:flutter/material.dart';
import '../themes/app_colors.dart';
import 'app_fonts.dart';

class ThemesController {
  /// get light theme
  ThemeData get getLightTheme {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: AppColors.black,
      ),
      primaryColor: AppColors.white,
      fontFamily: AppFonts.monaSans,
      unselectedWidgetColor: AppColors.grey,
      scaffoldBackgroundColor: AppColors.white,
      textTheme: const TextTheme(
        titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        titleSmall: TextStyle(fontSize: 16),
        bodyLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: AppColors.grey600,
        ),
        bodySmall: TextStyle(
          fontSize: 14,
          color: AppColors.grey600,
        ),
        labelMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        labelSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.black,
        ),
        headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(),
        displayMedium: TextStyle(),
        labelLarge: TextStyle(
          fontSize: 12,
          color: AppColors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      dialogBackgroundColor: AppColors.white,
      dialogTheme: const DialogTheme(
        surfaceTintColor: AppColors.white,
      ),
      actionIconTheme: ActionIconThemeData(
        backButtonIconBuilder: (BuildContext context) => const Icon(
          Icons.chevron_left,
          color: AppColors.primaryBlue,
          size: 35,
        ),
      ),
    );
  }
}
