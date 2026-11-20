// lib/features/bootcamps/widgets/bootcamp_filter_bar.dart
import 'package:flutter/material.dart';
import 'package:masar_app/core/functions/extensions.dart';
import 'package:masar_app/core/styles/app_colors.dart';
import 'package:masar_app/core/styles/text_styles.dart';

import '../../model/bootcamp_model.dart';

class BootcampFilterBar extends StatelessWidget {
  const BootcampFilterBar({
    super.key,
    required this.selectedStatus,
    required this.counts,
    required this.onSelect,
  });

  final BootcampStatus selectedStatus;
  final Map<BootcampStatus, int> counts;
  final ValueChanged<BootcampStatus> onSelect;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: BootcampStatus.values.map((status) {
          final isSelected = status == selectedStatus;
          final count = counts[status] ?? 0;
          final label = _shortLabel(status);

          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: InkWell(
              onTap: () => onSelect(status),
              borderRadius: BorderRadius.circular(24),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? LightPalette.primaryColor
                      : Theme.of(context).hoverColor,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: isSelected
                        ? LightPalette.primaryColor
                        : context.colorScheme.surfaceContainer,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      label,
                      style: TextStyles.caption1.copyWith(
                        color: isSelected ? Colors.white : colors.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (count > 0) ...[
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.white.withValues(alpha: 0.18)
                              : colors.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '$count',
                          style: TextStyles.caption2.copyWith(
                            color: isSelected ? Colors.white : colors.onSurface,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  String _shortLabel(BootcampStatus status) {
    switch (status) {
      case BootcampStatus.active:
        return 'Active';
      case BootcampStatus.upcoming:
        return 'Upcoming';
      case BootcampStatus.draft:
        return 'Draft';
      case BootcampStatus.completed:
        return 'Completed';
    }
  }
}
