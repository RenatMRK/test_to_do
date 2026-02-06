import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

TextTheme appTextTheme() {
  final base = ThemeData.light().textTheme;

  return GoogleFonts.nunitoTextTheme(base).copyWith(
    displayLarge: base.displayLarge?.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
    ),

    displayMedium: base.displayMedium?.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w800,
      color: AppColors.textSecondary,
    ),

    titleLarge: base.titleLarge?.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.textSecondary,
    ),

    titleMedium: base.titleMedium?.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.textSecondary,
    ),

    bodyMedium: base.bodyMedium?.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
    ),

    labelSmall: base.labelSmall?.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.textSecondary,
    ),

    bodySmall: base.bodySmall?.copyWith(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      color: AppColors.textSecondary,
    ),

    bodyLarge: base.bodyLarge?.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.textSecondary,
      height: 1.4,
    ),
  );
}
