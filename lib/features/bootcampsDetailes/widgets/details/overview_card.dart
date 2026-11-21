// lib/features/bootcamps/widgets/bootcamp_details_overview_card.dart
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:masar_app/core/styles/app_colors.dart';
import 'package:masar_app/core/styles/text_styles.dart';

class BootcampDetailsOverviewCard extends StatelessWidget {
  const BootcampDetailsOverviewCard({
    super.key,
    required this.progress,
    required this.description,
  });

  final double progress;
  final String description;

  @override
  Widget build(BuildContext context) {
    final progressPercent = (progress * 100).round();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
          colors: [LightPalette.primaryColor, LightPalette.secondaryColor],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cohort Progress',
                  style: TextStyles.subtitle.copyWith(
                    color: LightPalette.greyColor,
                  ),
                ),
                Text(
                  '$progressPercent%',
                  style: TextStyles.label.copyWith(
                    color: LightPalette.greyColor,
                  ),
                ),
              ],
            ),
            const Gap(8),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 7,
                backgroundColor: LightPalette.primaryColor100,
                valueColor: AlwaysStoppedAnimation<Color>(
                  LightPalette.primaryColor,
                ),
              ),
            ),
            const Gap(18),
            Text(
              'Overview',
              style: TextStyles.subtitle.copyWith(
                color: LightPalette.greyColor,
              ),
            ),
            const Gap(6),
            Text(
              description,
              style: TextStyles.body2.copyWith(
                color: LightPalette.greyColor,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
