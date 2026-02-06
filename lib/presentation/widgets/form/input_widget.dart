import 'package:flutter/material.dart';
import 'package:test_to_do/core/constants/app_strings.dart';
import 'package:test_to_do/core/theme/theme_extensions.dart';

class InputWidget extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  const InputWidget({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: context.c.onSecondary,
        borderRadius: BorderRadius.circular(13),

        boxShadow: [
          BoxShadow(
            color: Color(0x1CB6A1C0),
            offset: const Offset(2, 4),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextField(
        maxLines: 4,
        minLines: 1,
        textAlignVertical: TextAlignVertical.top,
        style: context.t.bodyLarge,
        decoration: InputDecoration(
          hintText: AppStrings.inputHintNote,
          hintStyle: context.t.bodyLarge!.copyWith(
            color: context.c.buttonTextDisabled,
          ),
          contentPadding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
