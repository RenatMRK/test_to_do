import 'package:flutter/material.dart';
import 'app_color_scheme.dart';
import 'app_text_theme.dart';

final ThemeData appTheme = ThemeData(
  useMaterial3: true,

  colorScheme: lightColorScheme,

  scaffoldBackgroundColor: lightColorScheme.surface,

  textTheme: appTextTheme(),

  iconTheme: IconThemeData(color: lightColorScheme.onSurface),


  appBarTheme: AppBarTheme(
    backgroundColor: lightColorScheme.surface,
    foregroundColor: lightColorScheme.onSurface,
    elevation: 0,
    centerTitle: true,
  ),
);
