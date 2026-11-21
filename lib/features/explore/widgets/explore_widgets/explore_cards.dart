import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:masar_app/core/constants/app_images.dart';
import 'package:masar_app/core/styles/app_colors.dart';

import '../../../../core/styles/text_styles.dart';
import '../../model/explore_model.dart';

class FeaturedBootcampTile extends StatelessWidget {
  const FeaturedBootcampTile({
    super.key,
    required this.item,
    required this.onDetailsTap,
    this.tags = const ['Flutter 3.24', 'Bloc Pattern', 'GraphQL', 'CI/CD DevOps'],
  });

  final BootcampCardItem item;
  final VoidCallback onDetailsTap;
  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2EAE6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _Badge(text: item.deadline, bg: const Color(0xFFFDECEC), fg: const Color(0xFFC93B2B)),
              _Badge(text: item.badge, bg: const Color(0xFFE7F4EE), fg: const Color(0xFF17664B)),
            ],
          ),
          const Gap(10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(AppImages.flutter, width: 44, height: 44, fit: BoxFit.cover),
              ),
              const Gap(8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.academy,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.caption2.copyWith(
                        fontWeight: FontWeight.w600,
                        color: LightPalette.accentColor,
                      ),
                    ),
                    const Gap(4),
                    Text(
                      item.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.body1.copyWith(
                        fontWeight: FontWeight.w600,
                        color: LightPalette.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap(10),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: LightPalette.mintTint,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _MiniStat(label: 'Duration', value: item.duration),
                _MiniStat(label: 'Format', value: item.format),
                _MiniStat(label: 'Availability', value: item.seats, urgent: true),
              ],
            ),
          ),
          const Gap(10),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: tags
                .map(
                  (tag) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F5F3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      tag,
                      style: TextStyles.caption2.copyWith(
                        fontWeight: FontWeight.w500,
                        color: LightPalette.greyColor,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Icon(Icons.star, size: 16, color: LightPalette.goldColor),
                    const Gap(4),
                    Flexible(
                      child: Text(
                        '${item.rating} (${item.alumni} alumni)',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.caption1.copyWith(color: LightPalette.secondaryColor),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(8),
              Flexible(
                child: ElevatedButton(
                  onPressed: onDetailsTap,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    backgroundColor: LightPalette.primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text('View Details', style: TextStyle(fontSize: 12)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProgramTilee extends StatelessWidget {
  const ProgramTilee({
    super.key,
    required this.item,
    required this.onSaveTap,
    required this.onApplyTap,
  });

  final ProgramCardItem item;
  final VoidCallback onSaveTap;
  final VoidCallback onApplyTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2EAE6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(AppImages.cloud, width: 44, height: 44, fit: BoxFit.cover),
              const Gap(8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.category,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A6B50),
                      ),
                    ),
                    Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF102A21),
                      ),
                    ),
                    Text(
                      item.subtitle,
                      style: const TextStyle(fontSize: 12, color: Color(0xFF6B8278)),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: onSaveTap,
                icon: Icon(item.isSaved ? Icons.bookmark : Icons.bookmark_border),
              ),
            ],
          ),
          const Gap(8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: LightPalette.mintTint,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Image.asset(AppImages.validProgram, width: 25, height: 25),
                const Gap(6),
                Expanded(
                  child: Text(
                    item.instructor,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.caption1.copyWith(color: LightPalette.textPrimary),
                  ),
                ),
              ],
            ),
          ),
          const Gap(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.calendar_today_outlined, size: 14),
              const Gap(4),
              Text(
                item.startDate,
                style: TextStyles.caption1.copyWith(
                  color: LightPalette.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(30),
              const Icon(Icons.schedule, size: 14),
              const Gap(4),
              Text(
                item.duration,
                style: TextStyles.caption1.copyWith(
                  color: LightPalette.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(30),
              const Icon(Icons.hourglass_empty, size: 14, color: LightPalette.redColor),
              const Gap(4),
              Text(
                item.seats,
                style: TextStyles.caption1.copyWith(
                  color: LightPalette.redColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: _Badge(
                  text: item.tag,
                  bg: LightPalette.mintTint,
                  fg: LightPalette.accentColor,
                ),
              ),
              const Gap(8),
              Flexible(
                child: ElevatedButton(
                  onPressed: onApplyTap,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    backgroundColor: LightPalette.primaryColor,
                    foregroundColor: LightPalette.onPrimaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text('Apply Now', style: TextStyle(fontSize: 12)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.text, required this.bg, required this.fg});

  final String text;
  final Color bg;
  final Color fg;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(8)),
      child: Text(
        text,
        style: TextStyles.caption1.copyWith(fontWeight: FontWeight.bold, color: fg),
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  const _MiniStat({required this.label, required this.value, this.urgent = false});

  final String label;
  final String value;
  final bool urgent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 10, color: Color(0xFF7B9187))),
        const SizedBox(height: 2),
        Text(
          value,
          style: TextStyles.caption1.copyWith(
            fontWeight: FontWeight.bold,
            color: urgent ? LightPalette.redColor : LightPalette.primaryColor,
          ),
        ),
      ],
    );
  }
}
