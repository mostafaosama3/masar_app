import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:masar_app/core/styles/text_styles.dart';

import '../../../../core/styles/app_colors.dart';
import '../../model/details_model.dart';

class MentorCard extends StatelessWidget {
  const MentorCard({super.key, required this.details});

  final BootcampDetailsViewData details;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: LightPalette.onPrimaryColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'LEAD ARCHITECT MENTOR',
                style: TextStyles.caption2.copyWith(
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                  color: LightPalette.greyColor,
                ),
              ),
              Text(
                details.mentorRatio,
                style: TextStyles.caption2.copyWith(
                  fontWeight: FontWeight.w600,
                  color: LightPalette.greyColor,
                ),
              ),
            ],
          ),
          const Gap(12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  details.mentorImage,
                  width: 52,
                  height: 52,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    width: 52,
                    height: 52,
                    color: LightPalette.mintTint,
                    child: Icon(Icons.person, color: LightPalette.secondaryColor),
                  ),
                ),
              ),
              const Gap(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            details.mentorName,
                            style: TextStyles.subtitle.copyWith(
                              fontWeight: FontWeight.w700,
                              color: LightPalette.primaryColor,
                            ),
                          ),
                        ),
                        const Gap(5),
                        Icon(Icons.verified, size: 15, color: LightPalette.secondaryColor),
                      ],
                    ),
                    const Gap(2),
                    Text(
                      details.mentorRole,
                      style: TextStyles.caption1.copyWith(
                        fontWeight: FontWeight.w600,
                        color: LightPalette.secondaryColor,
                      ),
                    ),
                    const Gap(6),
                    Text(
                      details.mentorQuote,
                      style: TextStyles.caption1.copyWith(
                        fontStyle: FontStyle.italic,
                        color: LightPalette.greyColor,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
