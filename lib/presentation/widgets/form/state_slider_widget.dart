import 'package:flutter/material.dart';
import 'package:test_to_do/core/theme/theme_extensions.dart';

class StateSliderWidget extends StatefulWidget {
  final String title;
  final String subTitle;
  final bool isEnabled;
  final ValueChanged<double>? onChanged;
  const StateSliderWidget({
    super.key,
    required this.title,
    required this.subTitle,
    this.isEnabled = true,
    this.onChanged,
  });

  @override
  State<StateSliderWidget> createState() => _StateSliderWidgetState();
}

class _StateSliderWidgetState extends State<StateSliderWidget> {
  late final ValueNotifier<double> _valueNotifier;

  bool get isEnabled => widget.isEnabled;

  Color get trackActiveColor =>
      isEnabled ? context.c.buttonPrimary : context.c.buttonDisabled;
  Color get trackInactiveColor => context.c.buttonDisabled;
  Color get thumbColor =>
      isEnabled ? context.c.buttonPrimary : context.c.buttonDisabled;
  Color get dividerColor =>
      isEnabled ? context.c.buttonPrimary : context.c.buttonDisabled;

  @override
  void initState() {
    super.initState();
    _valueNotifier = ValueNotifier<double>(50);
  }

  @override
  void dispose() {
    _valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool enabled = widget.isEnabled;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(6, (index) {
              return Container(
                width: 2,
                height: 8,
                decoration: BoxDecoration(
                  color: context.c.buttonDisabled,
                  borderRadius: BorderRadius.circular(2),
                ),
              );
            }),
          ),
        ),
        SizedBox(height: 8),
        ValueListenableBuilder(
          valueListenable: _valueNotifier,
          builder: (context, value, child) {
            return SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 6,
                activeTrackColor: trackActiveColor,
                inactiveTrackColor: trackInactiveColor,
                thumbColor: thumbColor,
                overlayColor: isEnabled
                    ? context.c.buttonPrimary
                    : context.c.onSecondary,
                thumbShape: const _WhiteBorderThumbShape(radius: 9),
                rangeThumbShape: const RoundRangeSliderThumbShape(
                  enabledThumbRadius: 20,
                ),

                trackShape: const RectangularSliderTrackShape(),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 4),
                padding: EdgeInsets.symmetric(horizontal: 10),
              ),
              child: Slider(
                value: value,
                min: 0,
                max: 100,
                divisions: 100,
                onChanged: (double v) {
                  if (enabled) {
                    _valueNotifier.value = v;
                    widget.onChanged?.call(v);
                  }
                },
              ),
            );
          },
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: context.t.titleMedium!.copyWith(color: context.c.grey),
              ),
              Text(
                widget.subTitle,
                style: context.t.titleMedium!.copyWith(color: context.c.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _WhiteBorderThumbShape extends SliderComponentShape {
  final double radius;

  const _WhiteBorderThumbShape({required this.radius});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) =>
      Size.fromRadius(radius);

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final canvas = context.canvas;

    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = sliderTheme.thumbColor!
        ..style = PaintingStyle.fill,
    );

    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4.5,
    );
  }
}
