
import 'package:flutter/material.dart';
import 'package:test_to_do/core/theme/theme_extensions.dart';
import 'package:test_to_do/presentation/widgets/form/state_slider_widget.dart';

class SliderLevelWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool isEnabled;
  final ValueChanged<double>? onChanged;

  const SliderLevelWidget({
    super.key,
    required this.title,
    required this.subTitle,
    this.isEnabled = true,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 77,
      decoration: BoxDecoration(
        color: context.c.onSecondary,
        borderRadius: BorderRadius.circular(13),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1CB6A1C0),
            offset: Offset(2, 4),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: StateSliderWidget(
        title: title,
        subTitle: subTitle,
        isEnabled: isEnabled,
        onChanged: onChanged,
      ),
    );
  }
}