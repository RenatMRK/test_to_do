import 'package:flutter/material.dart';
import 'package:test_to_do/core/constants/app_strings.dart';
import 'package:test_to_do/core/theme/theme_extensions.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.close,
              color: context.c.buttonTextDisabled,
              size: 24,
            ),
            onPressed: () => Navigator.pop(context),
          ),

          Text(
            AppStrings.today,
            style: context.t.titleLarge!.copyWith(
              color: context.c.buttonTextDisabled,
            ),
          ),
        ],
      ),
    );
  }
}