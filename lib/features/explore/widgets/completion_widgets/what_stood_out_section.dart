import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/text_styles.dart';

class WhatStoodOutSection extends StatelessWidget {
  const WhatStoodOutSection({
    super.key,
    required this.highlights,
    required this.selected,
    required this.onToggle,
  });

  final List<String> highlights;
  final Set<String> selected;
  final ValueChanged<String> onToggle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What Stood Out Most?',
          style: TextStyles.body1.copyWith(
            fontWeight: FontWeight.w700,
            color: LightPalette.primaryColor,
          ),
        ),
        const Gap(10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: highlights.map((label) {
            final isSelected = selected.contains(label);
            final showCheck = isSelected && label != 'Challenging Pace';

            return InkWell(
              onTap: () => onToggle(label),
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                decoration: BoxDecoration(
                  color: isSelected ? LightPalette.mintTint : LightPalette.onPrimaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (showCheck) ...[
                      const Icon(Icons.check, size: 13, color: LightPalette.secondaryColor),
                      const Gap(5),
                    ],
                    Text(
                      label,
                      style: TextStyles.caption1.copyWith(
                        fontWeight: FontWeight.w600,
                        color: isSelected ? LightPalette.secondaryColor : LightPalette.greyColor,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
