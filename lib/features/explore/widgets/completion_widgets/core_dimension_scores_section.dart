import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/text_styles.dart';

class CoreDimensionScoresSection extends StatelessWidget {
  const CoreDimensionScoresSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Core Dimension Scores',
              style: TextStyles.body1.copyWith(
                fontWeight: FontWeight.w700,
                color: LightPalette.primaryColor,
              ),
            ),
            Text(
              'Verified Rubric',
              style: TextStyles.caption1.copyWith(
                fontWeight: FontWeight.w500,
                color: LightPalette.greyColor,
              ),
            ),
          ],
        ),
        Gap(10),
        Row(
          children: [
            Expanded(
              child: _DimensionScoreCard(
                title: 'Curriculum',
                subtitle: 'BLoC & Architecture',
                score: '5.0',
              ),
            ),
            Gap(10),
            Expanded(
              child: _DimensionScoreCard(
                title: 'Mentor Guidance',
                subtitle: 'Eng. Tariq Mansour',
                score: '5.0',
              ),
            ),
          ],
        ),
        Gap(10),
        Row(
          children: [
            Expanded(
              child: _DimensionScoreCard(
                title: 'Capstone Defense',
                subtitle: 'Code Reviews',
                score: '5.0',
              ),
            ),
            Gap(10),
            Expanded(
              child: _DimensionScoreCard(
                title: 'Platform & Labs',
                subtitle: 'Live Sync & Cadence',
                score: '4.8',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _DimensionScoreCard extends StatelessWidget {
  const _DimensionScoreCard({required this.title, required this.subtitle, required this.score});

  final String title;
  final String subtitle;
  final String score;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: LightPalette.onPrimaryColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.body2.copyWith(
                    fontWeight: FontWeight.w700,
                    color: LightPalette.primaryColor,
                  ),
                ),
                const Gap(3),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 11, color: LightPalette.greyColor),
                ),
              ],
            ),
          ),
          const Gap(6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            decoration: BoxDecoration(
              color: LightPalette.onPrimaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.star_rounded, size: 13, color: LightPalette.secondaryColor),
                const Gap(3),
                Text(
                  score,
                  style: TextStyles.caption1.copyWith(
                    fontWeight: FontWeight.w700,
                    color: LightPalette.secondaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
