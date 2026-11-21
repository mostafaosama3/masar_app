import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/text_styles.dart';

class GraduationBannerCard extends StatelessWidget {
  const GraduationBannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [LightPalette.primaryColor, LightPalette.secondaryColor],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: LightPalette.onPrimaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.emoji_events_outlined, size: 13, color: LightPalette.secondaryColor),
                    Gap(5),
                    Text(
                      'Graduated • Distinction (96%)',
                      style: TextStyles.caption2.copyWith(
                        fontWeight: FontWeight.w700,
                        color: LightPalette.secondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.check_circle_outline, size: 13, color: Colors.white),
                    Gap(5),
                    Text(
                      'Tuwaiq & Sarmad',
                      style: TextStyles.caption2.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap(14),
          Text(
            'Flutter Enterprise Architecture',
            style: TextStyles.title2.copyWith(
              fontWeight: FontWeight.w700,
              color: Colors.white,
              height: 1.2,
            ),
          ),
          const Gap(4),
          Text(
            'Cohort VII • 10 Weeks Intensive Mastery',
            style: TextStyles.caption1.copyWith(color: Colors.white.withValues(alpha: 0.78)),
          ),
          const Gap(14),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.22),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
            ),
            child: Row(
              children: [
                Icon(Icons.stars_rounded, size: 16, color: LightPalette.mint),
                Gap(8),
                Expanded(
                  child: Text(
                    'Unlocks Official Accredited Certificate',
                    style: TextStyles.caption1.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
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
