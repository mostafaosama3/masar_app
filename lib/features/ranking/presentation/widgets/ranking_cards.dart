import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:masar_app/core/styles/app_colors.dart';
import 'package:masar_app/core/widgets/mint_progress.dart';

import 'ranking_components.dart';

const _subtleOnDark = Color(0xFFB9D4CB);

// ───────────────────────── Profile Card ─────────────────────────

class RankingProfileCard extends StatelessWidget {
  const RankingProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: LightPalette.primaryColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x22000000),
            blurRadius: 12,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: const Column(
        children: [
          Row(
            children: [
              RankingPersonAvatar(radius: 21),
              Gap(9),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Zaid Al-Omari  You',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'LEVEL 7 • ARCHITECTURE CRAFTSMAN',
                      style: TextStyle(
                        color: _subtleOnDark,
                        fontSize: 8,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '#4  COHORT RANK',
                      style: TextStyle(
                        color: _subtleOnDark,
                        fontSize: 8,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '2,840',
                    style: TextStyle(
                      color: LightPalette.mint,
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'TOTAL XP',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 8,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Gap(15),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Level Progress (840 / 1,000 XP)',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 9,
                  ),
                ),
              ),
              Text(
                '160 XP to Lead Eng',
                style: TextStyle(
                  color: LightPalette.mint,
                  fontSize: 8,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Gap(7),
          MintProgress(value: .84),
          Gap(15),
          Row(
            children: [
              RankingStatBox(
                Icons.military_tech_outlined,
                '14',
                'Badges',
              ),
              Gap(7),
              RankingStatBox(
                Icons.verified_outlined,
                '98%',
                'Task Quality',
              ),
              Gap(7),
              RankingStatBox(
                Icons.bolt,
                '100%',
                'Streak',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ───────────────────────── Sprint Card ─────────────────────────

class RankingSprintCard extends StatelessWidget {
  const RankingSprintCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: LightPalette.mintTint,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.rocket_launch_outlined,
              color: LightPalette.secondaryColor,
            ),
          ),
          const Gap(10),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '• ENDS IN 2 DAYS',
                  style: TextStyle(
                    color: LightPalette.redColor,
                    fontSize: 8,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'Flutter Animations Sprint',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'Prize: +300 XP & Animation Guru badge',
                  style: TextStyle(
                    fontSize: 9,
                    color: LightPalette.greyColor,
                  ),
                ),
              ],
            ),
          ),
          FilledButton(
            onPressed: () {},
            style: FilledButton.styleFrom(
              minimumSize: const Size(54, 38),
              padding: const EdgeInsets.symmetric(horizontal: 12),
            ),
            child: const Text(
              'Join',
              style: TextStyle(fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}

// ───────────────────────── Podium ─────────────────────────

class RankingPodium extends StatelessWidget {
  const RankingPodium({
    super.key,
    required this.name,
    required this.xp,
    required this.rank,
    required this.medal,
    required this.height,
    this.winner = false,
  });

  final String name;
  final String xp;
  final String rank;
  final String medal;
  final double height;
  final bool winner;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RankingPersonAvatar(radius: winner ? 27 : 22),
        const Gap(5),
        Text(
          name,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(
          xp,
          style: const TextStyle(
            fontSize: 9,
            color: LightPalette.secondaryColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        Container(
          height: height,
          margin: const EdgeInsets.only(
            top: 8,
            left: 3,
            right: 3,
          ),
          decoration: BoxDecoration(
            color: winner
                ? LightPalette.primaryColor
                : LightPalette.mutedBg,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(12),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  rank,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: winner
                        ? Colors.white
                        : LightPalette.secondaryColor,
                  ),
                ),
                Icon(
                  winner
                      ? Icons.workspace_premium
                      : Icons.emoji_events_outlined,
                  color: winner
                      ? LightPalette.mint
                      : LightPalette.greyColor,
                ),
                Text(
                  medal,
                  style: TextStyle(
                    fontSize: 8,
                    color: winner
                        ? Colors.white70
                        : LightPalette.greyColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ───────────────────────── Standing ─────────────────────────

class RankingStanding extends StatelessWidget {
  const RankingStanding({
    super.key,
    required this.rank,
    required this.name,
    required this.role,
    required this.xp,
    required this.change,
    this.selected = false,
  });

  final String rank;
  final String name;
  final String role;
  final String xp;
  final String change;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final subtle = selected
        ? Colors.white70
        : LightPalette.greyColor;

    return Container(
      margin: const EdgeInsets.only(bottom: 7),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: selected
            ? LightPalette.primaryColor
            : Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            child: Text(
              rank,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: selected
                    ? Colors.white
                    : LightPalette.greyColor,
              ),
            ),
          ),
          const RankingPersonAvatar(
            radius: 16,
            iconSize: 18,
          ),
          const Gap(8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: selected
                        ? Colors.white
                        : LightPalette.textPrimary,
                  ),
                ),
                Text(
                  role,
                  style: TextStyle(
                    fontSize: 8,
                    color: subtle,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                xp,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: selected
                      ? LightPalette.mint
                      : LightPalette.textPrimary,
                ),
              ),
              Text(
                change,
                style: TextStyle(
                  fontSize: 8,
                  color: selected
                      ? Colors.white70
                      : LightPalette.secondaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}