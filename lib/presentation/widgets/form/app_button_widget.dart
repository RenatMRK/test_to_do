import 'package:flutter/material.dart';
import 'package:test_to_do/core/theme/theme_extensions.dart';

class AppButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? textColor;

  const AppButtonWidget({
    super.key,
    required this.title,
    this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final bool enabled = onPressed != null && !isLoading;
    return SizedBox(
      height: 44,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: enabled
              ? context.c.buttonPrimary
              : context.c.buttonDisabled,
          foregroundColor: enabled
              ? context.c.buttonTextPrimary
              : context.c.buttonTextDisabled,

          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(69),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: context.c.buttonTextPrimary,
                  ),
                )
              : Text(
                  title,
                  style: context.t.displayMedium!.copyWith(
                    color: enabled
                        ? context.c.buttonTextPrimary
                        : context.c.buttonTextDisabled,
                    letterSpacing: 0.3,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
        ),
      ),
    );
  }
}
