import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:masar_app/core/styles/app_colors.dart';

import '../../../../core/styles/text_styles.dart';

class BottomApplyBar extends StatelessWidget {
  const BottomApplyBar({
    super.key,
    required this.statusText,
    required this.closingText,
    required this.tuitionText,
    required this.ctaLabel,
    required this.onApplyTap,
  });

  final String statusText;
  final String closingText;
  final String tuitionText;
  final String ctaLabel;
  final VoidCallback onApplyTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: LightPalette.onPrimaryColor,
        border: Border(top: BorderSide(color: LightPalette.onPrimaryColor)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: LightPalette.mintTint,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.verified, size: 13, color: LightPalette.secondaryColor),
                        const Gap(5),
                        Text(
                          statusText,
                          style: TextStyles.caption2.copyWith(
                            fontWeight: FontWeight.w700,
                            color: LightPalette.secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.timer_outlined, size: 14, color: LightPalette.redColor),
                      const Gap(4),
                      Text(
                        closingText,
                        style: TextStyles.caption1.copyWith(
                          fontWeight: FontWeight.w700,
                          color: LightPalette.redColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Gap(10),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'TUITION',
                        style: TextStyles.caption2.copyWith(
                          fontWeight: FontWeight.w700,
                          color: LightPalette.greyColor,
                        ),
                      ),
                      Text(
                        tuitionText,
                        style: TextStyles.body1.copyWith(
                          fontWeight: FontWeight.w800,
                          color: LightPalette.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const Gap(14),
                  Expanded(
                    child: SizedBox(
                      height: 46,
                      child: ElevatedButton.icon(
                        onPressed: onApplyTap,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: LightPalette.primaryColor,
                          foregroundColor: LightPalette.onPrimaryColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        icon: Icon(Icons.bolt, size: 18, color: LightPalette.mint),
                        label: Text(
                          ctaLabel,
                          style: TextStyles.body2.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
