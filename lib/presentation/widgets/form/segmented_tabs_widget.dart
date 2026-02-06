import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_to_do/core/constants/app_assets.dart';
import 'package:test_to_do/core/constants/app_strings.dart';
import 'package:test_to_do/core/theme/theme_extensions.dart';

class SegmentedTabsWidget extends StatelessWidget {
  const SegmentedTabsWidget({super.key, required this.controller});

  final TabController controller;

  static const _titles = [AppStrings.tabMoodDiary, AppStrings.tabStatistics];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 44),
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          color: context.c.segmentedBackground,
          borderRadius: BorderRadius.circular(47),
        ),
        child: AnimatedBuilder(
          animation: controller.animation!,
          builder: (_, __) {
            final selectedIndex = controller.index;

            return Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 6,
                  child: SegmentedTabWidget(
                    title: _titles[0],
                    isSelected: selectedIndex == 0,
                    onTap: () => controller.animateTo(0),
                    iconPath: AppAssets.iconBook,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: SegmentedTabWidget(
                    title: _titles[1],
                    isSelected: selectedIndex == 1,
                    onTap: () => controller.animateTo(1),
                    iconPath: AppAssets.iconChart,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class SegmentedTabWidget extends StatelessWidget {
  const SegmentedTabWidget({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
    required this.iconPath,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? context.c.buttonPrimary : Colors.transparent,
          borderRadius: BorderRadius.circular(47),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(
                isSelected
                    ? context.c.onSecondary
                    : context.c.buttonTextDisabled,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              title,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: isSelected
                    ? context.c.onSecondary
                    : context.c.buttonTextDisabled,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
