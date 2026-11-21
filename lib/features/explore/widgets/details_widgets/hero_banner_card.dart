import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:masar_app/core/styles/app_colors.dart';
import 'package:masar_app/core/styles/text_styles.dart';

import '../../model/details_model.dart';

class HeroBannerCard extends StatelessWidget {
  const HeroBannerCard({super.key, required this.details});

  final BootcampDetailsViewData details;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [LightPalette.primaryColor, LightPalette.secondaryColor],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _BannerPill(
                text: details.sponsoredLabel,
                bgColor: LightPalette.mintTint,
                fgColor: LightPalette.secondaryColor,
                icon: Icons.verified,
              ),
              _BannerPill(
                text: details.accreditedLabel,
                bgColor: Colors.white.withValues(alpha: 0.12),
                fgColor: Colors.white.withValues(alpha: 0.9),
                icon: Icons.shield_outlined,
              ),
            ],
          ),
          const Gap(10),
          _BannerPill(
            text: details.deadlineLabel,
            bgColor: LightPalette.redColor,
            fgColor: Colors.white,
            icon: Icons.local_fire_department_outlined,
          ),
          const Gap(14),
          Text(
            details.title,
            style: TextStyles.headline2.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              height: 1.2,
            ),
          ),
          const Gap(10),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 6,
            runSpacing: 4,
            children: [
              Text(
                details.academyName,
                style: TextStyles.body2.copyWith(color: Colors.white, fontWeight: FontWeight.w700),
              ),
              const Icon(Icons.check_circle, size: 15, color: LightPalette.mint),
              Text(
                '•  ${details.partnerLabel}  •',
                style: TextStyles.caption1.copyWith(color: Colors.white.withValues(alpha: 0.78)),
              ),
            ],
          ),
          const Gap(6),
          Row(
            children: [
              Icon(Icons.star, size: 16, color: LightPalette.goldColor),
              const Gap(4),
              Text(
                '${details.rating}',
                style: TextStyles.caption1.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Gap(4),
              Text(
                '(${details.alumniCount} alumni)',
                style: TextStyles.caption1.copyWith(color: Colors.white.withValues(alpha: 0.75)),
              ),
            ],
          ),
          const Gap(16),
          Row(
            children: [
              Expanded(
                child: _StatTile(value: details.durationStat, label: details.durationSub),
              ),
              const Gap(8),
              Expanded(
                child: _StatTile(value: details.modeStat, label: details.modeSub),
              ),
              const Gap(8),
              Expanded(
                child: _StatTile(value: details.seatsStat, label: details.seatsSub, isUrgent: true),
              ),
              const Gap(8),
              Expanded(
                child: _StatTile(value: details.startStat, label: details.startSub),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BannerPill extends StatelessWidget {
  const _BannerPill({required this.text, required this.bgColor, required this.fgColor, this.icon});

  final String text;
  final Color bgColor;
  final Color fgColor;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[Icon(icon, size: 13, color: fgColor), const Gap(5)],
          Text(
            text,
            style: TextStyles.caption2.copyWith(
              fontWeight: FontWeight.w700,
              color: fgColor,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({required this.value, required this.label, this.isUrgent = false});

  final String value;
  final String label;
  final bool isUrgent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.14)),
      ),
      child: Column(
        children: [
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: isUrgent ? LightPalette.redColor : Colors.white,
            ),
          ),
          const Gap(3),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyles.caption2.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.white.withValues(alpha: 0.72),
            ),
          ),
        ],
      ),
    );
  }
}
