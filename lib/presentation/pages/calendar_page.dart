import 'package:flutter/material.dart';
import 'package:test_to_do/presentation/widgets/calendar/header_widget.dart';
import 'package:test_to_do/presentation/widgets/calendar/month_widget.dart';
import 'package:test_to_do/presentation/widgets/calendar/week_days_row_widget.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const HeaderWidget(),
            const SizedBox(height: 12),
            const WeekDaysRowWidget(),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: 12,
                itemBuilder: (context, index) {
                  final month = DateTime(DateTime.now().year, index + 1);
                  return MonthWidget(month: month, selectedDate: selectedDate);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


