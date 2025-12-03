import 'package:coffee_app/theme/app_color.dart';
import 'package:flutter/material.dart';

import 'app_fonts.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: AppColors.scaffold,
    primaryColor: AppColors.primary,
    fontFamily: AppFonts.primary,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.scaffold,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.dark),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: AppColors.dark,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.dark,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: AppColors.dark,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: AppColors.greyText,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.primary,
      ),
    ),
  );
}
