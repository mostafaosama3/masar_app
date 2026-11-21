import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/text_styles.dart';

class DetailedTestimonialCard extends StatelessWidget {
  const DetailedTestimonialCard({
    super.key,
    required this.controller,
    required this.isAnonymous,
    required this.onToggleAnonymous,
  });

  final TextEditingController controller;
  final bool isAnonymous;
  final ValueChanged<bool> onToggleAnonymous;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: LightPalette.mintTint),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Detailed Testimonial',
                style: TextStyles.body1.copyWith(
                  fontWeight: FontWeight.w700,
                  color: LightPalette.primaryColor,
                ),
              ),
              Text(
                'Public Badge Feature',
                style: TextStyles.caption1.copyWith(
                  fontWeight: FontWeight.w600,
                  color: LightPalette.secondaryColor,
                ),
              ),
            ],
          ),
          const Gap(10),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: LightPalette.mintTint,
              borderRadius: BorderRadius.circular(14),
            ),
            child: TextField(
              controller: controller,
              maxLines: 4,
              style: TextStyles.caption1.copyWith(color: LightPalette.secondaryColor, height: 1.45),
              decoration: const InputDecoration.collapsed(hintText: 'Share your experience...'),
            ),
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.visibility_off_outlined, size: 16, color: LightPalette.greyColor),
                  Gap(8),
                  Text(
                    'Submit anonymously',
                    style: TextStyles.caption1.copyWith(
                      fontWeight: FontWeight.w500,
                      color: LightPalette.greyColor,
                    ),
                  ),
                ],
              ),
              Switch(
                value: isAnonymous,
                onChanged: onToggleAnonymous,
                activeTrackColor: LightPalette.secondaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
