import 'package:flutter/material.dart';
import 'package:test_to_do/core/theme/app_colors.dart';

extension AppThemeX on BuildContext {
  TextTheme get t => Theme.of(this).textTheme;
  ColorScheme get c => Theme.of(this).colorScheme;
}

extension AppColorScheme on ColorScheme {
  Color get buttonPrimary => AppColors.buttonPrimary;
  Color get buttonDisabled => AppColors.buttonDisabled;
  Color get buttonTextPrimary => AppColors.buttonTextPrimary;
  Color get buttonTextDisabled => AppColors.buttonTextDisabled;
  Color get shadow => AppColors.shadow;
  Color get segmentedBackground => AppColors.segmentedBackground;
  Color get grey => AppColors.grey;
}
