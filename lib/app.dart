import 'package:flutter/material.dart';
import 'package:test_to_do/core/theme/app_theme.dart';
import 'package:test_to_do/presentation/pages/home_page.dart';

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDoApp',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const HomePage(),
    );
  }
}

