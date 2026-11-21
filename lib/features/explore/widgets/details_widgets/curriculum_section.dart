import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:masar_app/core/styles/app_colors.dart';
import 'package:masar_app/core/styles/text_styles.dart';

import '../../model/details_model.dart';

class CurriculumSection extends StatelessWidget {
  const CurriculumSection({
    super.key,
    required this.details,
    required this.expandedStates,
    required this.onToggleModule,
    required this.onSyllabusTap,
  });

  final BootcampDetailsViewData details;
  final List<bool> expandedStates;
  final ValueChanged<int> onToggleModule;
  final VoidCallback onSyllabusTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                'Curriculum Roadmap',
                style: TextStyles.title2.copyWith(
                  fontWeight: FontWeight.w700,
                  color: LightPalette.primaryColor,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: LightPalette.mintTint,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                details.syllabusMeta,
                style: TextStyles.caption2.copyWith(
                  fontWeight: FontWeight.w600,
                  color: LightPalette.secondaryColor,
                ),
              ),
            ),
            const Gap(8),
            InkWell(
              onTap: onSyllabusTap,
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Column(
                  children: [
                    Icon(Icons.description_outlined, size: 16, color: LightPalette.secondaryColor),
                    Text(
                      '24p\nSyllabus',
                      textAlign: TextAlign.center,
                      style: TextStyles.caption2.copyWith(
                        fontWeight: FontWeight.w700,
                        color: LightPalette.secondaryColor,
                        height: 1.15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const Gap(12),
        ...List.generate(details.modules.length, (index) {
          final mod = details.modules[index];
          final isExpanded = expandedStates[index];

          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: InkWell(
              onTap: () => onToggleModule(index),
              borderRadius: BorderRadius.circular(16),
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: mod.isActive ? LightPalette.tertiaryColor : LightPalette.primaryColor100,
                    width: mod.isActive ? 1.4 : 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 13,
                          backgroundColor: mod.isActive
                              ? LightPalette.primaryColor
                              : LightPalette.mintTint,
                          child: Text(
                            '${mod.number}',
                            style: TextStyles.caption2.copyWith(
                              fontWeight: FontWeight.w700,
                              color: mod.isActive ? Colors.white : LightPalette.secondaryColor,
                            ),
                          ),
                        ),
                        const Gap(10),
                        Expanded(
                          child: Text(
                            mod.title,
                            style: TextStyles.body2.copyWith(
                              fontWeight: FontWeight.w700,
                              color: mod.isActive
                                  ? LightPalette.primaryColor
                                  : LightPalette.secondaryColor,
                            ),
                          ),
                        ),
                        const Gap(8),
                        if (mod.isActive)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                            decoration: BoxDecoration(
                              color: LightPalette.mintTint,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              mod.badgeText,
                              style: TextStyles.caption2.copyWith(
                                fontWeight: FontWeight.w700,
                                color: LightPalette.accentColor,
                              ),
                            ),
                          )
                        else ...[
                          Text(
                            mod.badgeText,
                            style: TextStyles.caption2.copyWith(
                              fontWeight: FontWeight.w500,
                              color: LightPalette.greyColor,
                            ),
                          ),
                          const Gap(4),
                          Icon(
                            isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                            size: 18,
                            color: LightPalette.greyColor,
                          ),
                        ],
                      ],
                    ),
                    if (isExpanded) ...[
                      const Gap(8),
                      Padding(
                        padding: const EdgeInsets.only(left: 36),
                        child: Text(
                          mod.description,
                          style: TextStyles.caption1.copyWith(
                            color: LightPalette.greyColor,
                            height: 1.45,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
