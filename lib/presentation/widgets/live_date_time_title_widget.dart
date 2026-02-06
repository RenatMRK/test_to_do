import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_to_do/core/theme/theme_extensions.dart';

class LiveDateTimeTitleWidget extends StatelessWidget {
  const LiveDateTimeTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DateTime>(
      stream: Stream.periodic(
        const Duration(minutes: 1),
        (_) => DateTime.now(),
      ),
      builder: (context, snapshot) {
        final now = snapshot.data ?? DateTime.now();
        return Text(
          DateFormat('d MMMM HH:mm', 'ru').format(now),
          style: context.t.titleLarge!.copyWith(
            color: context.c.buttonTextDisabled,
            fontWeight: FontWeight.w700,
          ),
        );
      },
    );
  }
}
