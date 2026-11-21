import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:masar_app/core/styles/text_styles.dart';

import '../../../../core/styles/app_colors.dart';
import '../../model/details_model.dart';

class PrerequisitesCard extends StatelessWidget {
  const PrerequisitesCard({super.key, required this.details});

  final BootcampDetailsViewData details;

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
                'PREREQUISITES',
                style: TextStyles.caption2.copyWith(
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                  color: LightPalette.greyColor,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.check_circle_outline, size: 14, color: LightPalette.accentColor),
                  const Gap(4),
                  Text(
                    details.prereqStatus,
                    style: TextStyles.caption2.copyWith(
                      fontWeight: FontWeight.w600,
                      color: LightPalette.accentColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Gap(10),
          ...details.prerequisites.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 1),
                    child: Icon(
                      Icons.check_circle_outline,
                      size: 15,
                      color: LightPalette.accentColor,
                    ),
                  ),
                  const Gap(8),
                  Expanded(
                    child: Text(
                      item,
                      style: TextStyles.caption2.copyWith(color: LightPalette.secondaryColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
