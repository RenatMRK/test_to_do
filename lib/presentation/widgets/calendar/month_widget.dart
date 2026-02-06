

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_to_do/core/theme/theme_extensions.dart';

class MonthWidget extends StatelessWidget {
  final DateTime month;
  final DateTime selectedDate;

  const MonthWidget({super.key, required this.month, required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    final daysInMonth = DateUtils.getDaysInMonth(month.year, month.month);
    final firstWeekday = DateTime(month.year, month.month, 1).weekday - 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          '${month.year}',
          style: context.t.displayMedium!.copyWith(
            color: context.c.buttonTextDisabled,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          DateFormat.MMMM('ru').format(month),
          style: context.t.displayLarge,
        ),
        const SizedBox(height: 15),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            mainAxisExtent: 52,
          ),
          itemCount: daysInMonth + firstWeekday,
          itemBuilder: (context, index) {
            if (index < firstWeekday) return const SizedBox.shrink();

            final day = index - firstWeekday + 1;
            final date = DateTime(month.year, month.month, day);

            final isToday = DateUtils.isSameDay(date, DateTime.now());

            return _DayCell(day: day, isToday: isToday);
          },
        ),
      ],
    );
  }
}

class _DayCell extends StatelessWidget {
  final int day;
  final bool isToday;

  const _DayCell({required this.day, required this.isToday});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: isToday ? context.c.primary : null,
        shape: BoxShape.circle,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text('$day', style: context.t.bodyMedium),
          if (isToday)
            Positioned(
              bottom: 8,
              child: Icon(
                Icons.circle,
                color: context.c.buttonPrimary,
                size: 6,
              ),
            ),
        ],
      ),
    );
  }
}
