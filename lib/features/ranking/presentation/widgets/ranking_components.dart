import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:masar_app/core/styles/app_colors.dart';
import 'package:masar_app/core/widgets/eyebrow.dart';

// ───────────────────────── Small Components ─────────────────────────

class RankingSectionHeader extends StatelessWidget {
  const RankingSectionHeader(this.title, this.trailing, {super.key});

  final String title;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Eyebrow(title, size: 10)),
        Text(
          trailing,
          style: const TextStyle(
            fontSize: 9,
            color: LightPalette.greyColor,
          ),
        ),
      ],
    );
  }
}

class RankingPersonAvatar extends StatelessWidget {
  const RankingPersonAvatar({
    super.key,
    required this.radius,
    this.iconSize,
  });

  final double radius;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: LightPalette.mintTint,
      child: Icon(
        Icons.person,
        size: iconSize,
        color: LightPalette.secondaryColor,
      ),
    );
  }
}

class RankingStatBox extends StatelessWidget {
  const RankingStatBox(this.icon, this.value, this.label, {super.key});

  final IconData icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 9),
        decoration: BoxDecoration(
          color: const Color(0xFF20473F),
          borderRadius: BorderRadius.circular(9),
        ),
        child: Column(
          children: [
            Icon(icon, color: LightPalette.mint, size: 15),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 13,
              ),
            ),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RankingTabPill extends StatelessWidget {
  const RankingTabPill(
    this.text, {
    super.key,
    this.selected = false,
  });

  final String text;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w700,
            color: selected
                ? LightPalette.secondaryColor
                : LightPalette.greyColor,
          ),
        ),
      ),
    );
  }
}

class RankingBadge extends StatelessWidget {
  const RankingBadge(
    this.icon,
    this.title,
    this.subtitle, {
    super.key,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 13,
        horizontal: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: LightPalette.mint,
            child: Icon(
              icon,
              color: LightPalette.secondaryColor,
            ),
          ),
          const Gap(8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 8,
              color: LightPalette.greyColor,
            ),
          ),
        ],
      ),
    );
  }
}