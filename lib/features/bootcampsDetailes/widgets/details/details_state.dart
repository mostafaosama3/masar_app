// lib/features/bootcamps/widgets/bootcamp_details_stats.dart
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:masar_app/core/functions/extensions.dart';
import 'package:masar_app/core/styles/app_colors.dart';
import 'package:masar_app/core/styles/text_styles.dart';

import '../../model/bootcamp_model.dart';

class BootcampDetailsStats extends StatelessWidget {
  const BootcampDetailsStats({super.key, required this.bootcamp});

  final BootcampModel bootcamp;

  @override
  Widget build(BuildContext context) {
    final progressPercent = (bootcamp.progress * 100).round();

    return Row(
      children: [
        Expanded(
          child: _StatTile(
            label: 'Enrolled',
            value: '${bootcamp.enrolledCount}',
          ),
        ),
        const Gap(10),
        Expanded(
          child: _StatTile(label: 'Seats Left', value: '${bootcamp.seatsLeft}'),
        ),
        const Gap(10),
        Expanded(
          child: _StatTile(label: 'Progress', value: '$progressPercent%'),
        ),
      ],
    );
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({required this.label, required this.value}) : valueColor = null;

  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).hoverColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(color: context.colorScheme.outline),
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyles.title2.copyWith(
                color: valueColor ?? context.colorScheme.onSurface,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Gap(4),
            Text(
              label,
              style: TextStyles.caption1.copyWith(
                color: LightPalette.greyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
