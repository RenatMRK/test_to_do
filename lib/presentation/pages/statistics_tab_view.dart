import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_to_do/core/constants/app_strings.dart';
import 'package:test_to_do/core/theme/theme_extensions.dart';
import 'package:test_to_do/presentation/bloc/todo_list_cubit.dart';
import 'package:test_to_do/presentation/model/todo_form_ui_model.dart';

class StatisticsTabView extends StatelessWidget {
  const StatisticsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoListCubit, List<TodoFormUiModel>>(
      builder: (context, todos) {
        if (todos.isEmpty) {
          return Center(
            child: Text(
              AppStrings.noRecords,
              style: context.t.titleLarge!.copyWith(
                color: context.c.buttonTextDisabled,
                fontWeight: FontWeight.w700,
              ),
            ),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.all(20),
          itemCount: todos.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) => _TodoCard(todo: todos[index]),
        );
      },
    );
  }
}

class _TodoCard extends StatelessWidget {
  final TodoFormUiModel todo;

  const _TodoCard({required this.todo});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Image.asset(todo.emotion.imagePath, width: 48, height: 48),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(todo.emotion.label, style: context.t.displayMedium),
                  Text(todo.feeling ?? '', style: context.t.bodySmall),
                  const SizedBox(height: 6),
                  Text(
                    todo.note,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: context.t.bodySmall,
                  ),
                ],
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _StatRow(
                  icon: Icons.thermostat,
                  label: AppStrings.stressLabel,
                  value: todo.stressLevel.toInt(),
                ),
                const SizedBox(height: 4),
                _StatRow(
                  icon: Icons.star,
                  label: AppStrings.selfWorthLabel,
                  value: todo.selfWorthLevel.toInt(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final int value;

  const _StatRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: context.c.buttonPrimary),
        const SizedBox(width: 4),
        Text('$label $value', style: context.t.bodySmall),
      ],
    );
  }
}
