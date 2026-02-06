import 'package:flutter/material.dart';
import 'app_colors.dart';

final ColorScheme lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.accent,
  onPrimary: Colors.white,
  secondary: AppColors.accent,
  onSecondary: Colors.white,
  surface: AppColors.background,
  onSurface: AppColors.textPrimary,
  error: Colors.red,
  onError: Colors.white,
);
