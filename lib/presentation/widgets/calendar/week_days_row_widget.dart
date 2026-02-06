
import 'package:flutter/material.dart';
import 'package:test_to_do/core/constants/app_strings.dart';
import 'package:test_to_do/core/theme/theme_extensions.dart';

class WeekDaysRowWidget extends StatelessWidget {
  const WeekDaysRowWidget({super.key});
  final days = AppStrings.weekDays;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: days
            .map(
              (e) => Expanded(
                child: Center(
                  child: Text(
                    e,
                    style: context.t.titleMedium!.copyWith(
                      color: context.c.buttonTextDisabled,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}