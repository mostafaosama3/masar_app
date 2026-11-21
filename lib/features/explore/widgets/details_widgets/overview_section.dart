import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:masar_app/core/styles/text_styles.dart';

import '../../../../core/styles/app_colors.dart';
import '../../model/details_model.dart';

class OverviewSection extends StatelessWidget {
  const OverviewSection({super.key, required this.details});

  final BootcampDetailsViewData details;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              details.overviewEyebrow,
              style: TextStyles.caption2.copyWith(
                fontWeight: FontWeight.w700,
                letterSpacing: 0.6,
                color: LightPalette.secondaryColor,
              ),
            ),
            Text(
              details.gradeLabel,
              style: TextStyles.caption1.copyWith(color: LightPalette.greyColor),
            ),
          ],
        ),
        const Gap(6),
        Text(
          details.overviewHeadline,
          style: TextStyles.title2.copyWith(
            fontWeight: FontWeight.w700,
            color: LightPalette.primaryColor,
          ),
        ),
        const Gap(8),
        Text(
          details.overviewDescription,
          style: TextStyles.body2.copyWith(color: LightPalette.greyColor, height: 1.5),
        ),
        const Gap(14),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: details.topics
              .map(
                (topic) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: LightPalette.mintTint),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.layers_outlined,
                        size: 14,
                        color: LightPalette.secondaryColor,
                      ),
                      const Gap(6),
                      Text(
                        topic,
                        style: TextStyles.caption1.copyWith(
                          fontWeight: FontWeight.w600,
                          color: LightPalette.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
