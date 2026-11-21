import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:masar_app/core/styles/app_colors.dart';
import 'package:masar_app/core/styles/text_styles.dart';

import '../../model/details_model.dart';

class FastTrackCard extends StatelessWidget {
  const FastTrackCard({super.key, required this.details});

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
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: LightPalette.primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.bolt, color: LightPalette.mint, size: 22),
              ),
              const Positioned(
                right: -3,
                bottom: -3,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: LightPalette.mint,
                  child: Icon(Icons.check, size: 10, color: Colors.white),
                ),
              ),
            ],
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
                        'Fast-Track Ready',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.subtitle.copyWith(
                          fontWeight: FontWeight.w700,
                          color: LightPalette.primaryColor,
                        ),
                      ),
                    ),
                    const Gap(8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: LightPalette.mintTint,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '${details.fitPercentText} Fit',
                        style: TextStyles.caption2.copyWith(
                          fontWeight: FontWeight.w700,
                          color: LightPalette.secondaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(4),
                Text(
                  details.syncSubtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.caption1.copyWith(color: LightPalette.greyColor),
                ),
              ],
            ),
          ),
          const Gap(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                details.verifiedLevel,
                style: TextStyles.caption2.copyWith(
                  fontWeight: FontWeight.w700,
                  color: LightPalette.secondaryColor,
                ),
              ),
              const Gap(6),
              SizedBox(
                width: 72,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: LinearProgressIndicator(
                    value: details.readinessProgress,
                    minHeight: 5,
                    backgroundColor: LightPalette.mintTint,
                    valueColor: AlwaysStoppedAnimation<Color>(LightPalette.secondaryColor),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
