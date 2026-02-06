
import 'package:flutter/material.dart';
import 'package:test_to_do/core/theme/theme_extensions.dart';
import 'package:test_to_do/presentation/controller/todo_form_provider.dart';
import 'package:test_to_do/presentation/model/emotion.dart';

class EmotionSelectorWidget extends StatelessWidget {
  final List<Emotion> emotions;
  final Emotion? selectedEmotion;

  const EmotionSelectorWidget({
    super.key,
    required this.emotions,
    required this.selectedEmotion,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: emotions.length,
        itemBuilder: (context, index) {
          final emotion = emotions[index];
          final isSelected = selectedEmotion == emotion;
          return _EmotionItem(
            emotion: emotion,
            isSelected: isSelected,
            onTap: () {
              TodoFormProvider.read(context).setEmotion(emotion);
            },
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 10),
      ),
    );
  }
}

class _EmotionItem extends StatelessWidget {
  final Emotion emotion;
  final bool isSelected;
  final VoidCallback onTap;

  const _EmotionItem({
    required this.emotion,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 83,
        height: 118,
        decoration: BoxDecoration(
          color: context.c.onSecondary,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(38),
            bottom: Radius.circular(38),
          ),
          border: isSelected
              ? Border.all(color: context.c.buttonPrimary, width: 3)
              : null,
          boxShadow: const [
            BoxShadow(
              color: Color(0x1CB6A1C0),
              offset: Offset(2, 4),
              blurRadius: 10.8,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(emotion.imagePath, width: 54, height: 54),
            Text(emotion.label, style: context.t.bodySmall),
          ],
        ),
      ),
    );
  }
}
