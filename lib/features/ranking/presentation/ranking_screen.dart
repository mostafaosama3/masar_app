import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:masar_app/core/styles/app_colors.dart';
import 'package:masar_app/core/widgets/screen_header.dart';

import 'widgets/ranking_cards.dart';
import 'widgets/ranking_components.dart';

class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      children: [
        const ScreenHeader(title: 'Ranking'),

        const Gap(16),

        const RankingProfileCard(),

        const Gap(16),

        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: LightPalette.mutedBg,
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Row(
            children: [
              RankingTabPill('Cohort', selected: true),
              RankingTabPill('Global MASAR'),
              RankingTabPill('Sprint'),
            ],
          ),
        ),

        const Gap(22),

        const RankingSectionHeader(
          'PODIUM LEADERS',
          'Taqniya Cohort #12',
        ),

        const Gap(14),

        const Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: RankingPodium(
                name: 'Reem H.',
                xp: '3,120 XP',
                rank: '2',
                medal: 'Silver',
                height: 102,
              ),
            ),
            Expanded(
              child: RankingPodium(
                name: 'Omar F.',
                xp: '3,450 XP',
                rank: '1',
                medal: 'Champion',
                height: 128,
                winner: true,
              ),
            ),
            Expanded(
              child: RankingPodium(
                name: 'Khalid S.',
                xp: '2,990 XP',
                rank: '3',
                medal: 'Bronze',
                height: 92,
              ),
            ),
          ],
        ),

        const Gap(20),

        const RankingSprintCard(),

        const Gap(22),

        const RankingSectionHeader(
          'STANDINGS',
          'Live sync',
        ),

        const Gap(9),

        const RankingStanding(
          rank: '4',
          name: 'Zaid Al-Omari',
          role: 'Architecture Craftsman',
          xp: '2,840 XP',
          change: '+120 this week',
          selected: true,
        ),

        const RankingStanding(
          rank: '5',
          name: 'Sarah Al-Dossari',
          role: 'Full-Stack Trainee',
          xp: '2,710 XP',
          change: '+95 this week',
        ),

        const RankingStanding(
          rank: '6',
          name: 'Fahad Al-Mutairi',
          role: 'Cloud Systems Fellow',
          xp: '2,650 XP',
          change: '+60 this week',
        ),

        const RankingStanding(
          rank: '7',
          name: 'Noura Al-Ghamdi',
          role: 'Security Associate',
          xp: '2,590 XP',
          change: '+80 this week',
        ),

        const Gap(20),

        Row(
          children: [
            const Expanded(
              child: Text(
                'Earned Badges',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('View All (14)'),
            ),
          ],
        ),

        const Row(
          children: [
            Expanded(
              child: RankingBadge(
                Icons.speed,
                'Fast Submitter',
                'Top 5% speed',
              ),
            ),
            Gap(8),
            Expanded(
              child: RankingBadge(
                Icons.bug_report_outlined,
                'Bug Hunter',
                '0 regression',
              ),
            ),
            Gap(8),
            Expanded(
              child: RankingBadge(
                Icons.code,
                'Clean Code',
                'Peer-approved',
              ),
            ),
          ],
        ),
      ],
    );
  }
}