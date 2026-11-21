import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/text_styles.dart';

class OverallExperienceCard extends StatelessWidget {
  const OverallExperienceCard({super.key, required this.stars, required this.onSelectStar});

  final int stars;
  final ValueChanged<int> onSelectStar;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: LightPalette.mintTint),
      ),
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              text: 'Overall Experience ',
              style: TextStyles.body1.copyWith(
                fontWeight: FontWeight.w700,
                color: LightPalette.primaryColor,
              ),
              children: [
                TextSpan(
                  text: '*',
                  style: TextStyle(color: LightPalette.redColor),
                ),
              ],
            ),
          ),
          const Gap(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              final starIndex = index + 1;
              final active = starIndex <= stars;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: InkWell(
                  onTap: () => onSelectStar(starIndex),
                  borderRadius: BorderRadius.circular(20),
                  child: Icon(
                    active ? Icons.star_rounded : Icons.star_outline_rounded,
                    size: 32,
                    color: active ? LightPalette.secondaryColor : LightPalette.mintTint,
                  ),
                ),
              );
            }),
          ),
          const Gap(12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: LightPalette.mintTint,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.thumb_up_alt_outlined, size: 13, color: LightPalette.secondaryColor),
                Gap(6),
                Flexible(
                  child: Text(
                    'Exceptional! Exceeded Expectations (5.0/5)',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.caption1.copyWith(
                      fontWeight: FontWeight.w700,
                      color: LightPalette.secondaryColor,
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
