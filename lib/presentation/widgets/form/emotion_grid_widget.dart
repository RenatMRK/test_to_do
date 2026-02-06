import 'package:flutter/material.dart';
import 'package:test_to_do/core/theme/theme_extensions.dart';

class EmotionGridWidget extends StatelessWidget {
  final ValueChanged<String> onFeelingSelected;
  final List<String> feelings;
  final String? selectedFeeling;

  const EmotionGridWidget({
    super.key,
    required this.selectedFeeling,
    required this.onFeelingSelected,
    required this.feelings,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: feelings.map((feeling) {
          final isSelected = selectedFeeling == feeling;
          return GestureDetector(
            onTap: () {
              onFeelingSelected(feeling);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? context.c.buttonPrimary : context.c.surface,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                feeling,
                style: context.t.bodySmall!.copyWith(
                  color: isSelected
                      ? context.c.buttonTextPrimary
                      : context.c.onSurface,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
