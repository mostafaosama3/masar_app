import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:masar_app/core/functions/formatters.dart';
import 'package:masar_app/core/functions/toast.dart';
import 'package:masar_app/core/styles/app_colors.dart';
import 'package:masar_app/core/widgets/screen_header.dart';
import 'package:masar_app/features/ranking/data/models/ranking_overview.dart';
import 'package:masar_app/features/ranking/presentation/cubit/ranking_cubit.dart';

import 'widgets/ranking_cards.dart';
import 'widgets/ranking_components.dart';

class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  static IconData _badgeIcon(String key) => switch (key) {
        'speed' => Icons.speed,
        'bug' => Icons.bug_report_outlined,
        'code' => Icons.code,
        _ => Icons.military_tech_outlined,
      };

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RankingCubit, RankingState>(
      listenWhen: (previous, current) =>
          current.joinError != null && current.joinError != previous.joinError,
      listener: (context, state) => showErrorDialog(context, state.joinError!),
      builder: (context, state) {
        final cubit = context.read<RankingCubit>();
        final overview = state.overview;
        final showContent = state.status == RankingStatus.loaded && overview != null;

        return RefreshIndicator(
          onRefresh: () => cubit.load(refresh: true),
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            children: [
              const ScreenHeader(title: 'Ranking'),

              const Gap(16),

              if (showContent) ...[
                RankingProfileCard(
                  profile: overview.profile,
                  scope: overview.scope,
                ),
                const Gap(16),
              ],

              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: LightPalette.mutedBg,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    for (final scope in RankingScope.values)
                      RankingTabPill(
                        scope.label,
                        selected: scope == state.scope,
                        onTap: () => cubit.selectScope(scope),
                      ),
                  ],
                ),
              ),

              if (state.status == RankingStatus.loading) ...const [
                Gap(100),
                Center(child: CircularProgressIndicator()),
              ],

              if (state.status == RankingStatus.failure) ...[
                const Gap(100),
                const Center(child: Text('Could not load the ranking.')),
                const Gap(12),
                Center(
                  child: OutlinedButton.icon(
                    onPressed: cubit.load,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Try again'),
                  ),
                ),
              ],

              if (showContent) ...[
                const Gap(22),
                ..._podiumSection(overview),
                ..._sprintSection(overview, state, cubit),
                const Gap(22),
                const RankingSectionHeader('STANDINGS', 'Live sync'),
                const Gap(9),
                for (final entry in overview.standings)
                  RankingStanding(
                    rank: '${entry.rank}',
                    name: entry.name,
                    role: entry.role,
                    xp: '${formatNumber(entry.xp)} XP',
                    change: '+${entry.weeklyChange} this week',
                    selected: entry.isMe,
                  ),
                const Gap(20),
                ..._badgesSection(overview),
              ],
            ],
          ),
        );
      },
    );
  }

  List<Widget> _podiumSection(RankingOverview overview) {
    final podium = overview.podium;
    if (podium.length < 3) return const [];

    Widget slot(RankingEntry e, String medal, double height, {bool winner = false}) =>
        Expanded(
          child: RankingPodium(
            name: e.name,
            xp: '${formatNumber(e.xp)} XP',
            rank: '${e.rank}',
            medal: medal,
            height: height,
            winner: winner,
          ),
        );

    return [
      RankingSectionHeader('PODIUM LEADERS', overview.boardTitle),
      const Gap(14),
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          slot(podium[1], 'Silver', 102),
          slot(podium[0], 'Champion', 128, winner: true),
          slot(podium[2], 'Bronze', 92),
        ],
      ),
      const Gap(20),
    ];
  }

  List<Widget> _sprintSection(
    RankingOverview overview,
    RankingState state,
    RankingCubit cubit,
  ) {
    final sprint = overview.sprint;
    if (sprint == null) return const [];

    return [
      RankingSprintCard(
        sprint: sprint,
        isJoining: state.isJoining,
        onJoin: cubit.joinSprint,
      ),
    ];
  }

  List<Widget> _badgesSection(RankingOverview overview) {
    return [
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
            child: Text('View All (${overview.totalBadges})'),
          ),
        ],
      ),
      Row(
        children: [
          for (var i = 0; i < overview.badges.length && i < 3; i++) ...[
            if (i > 0) const Gap(8),
            Expanded(
              child: RankingBadge(
                _badgeIcon(overview.badges[i].key),
                overview.badges[i].title,
                overview.badges[i].subtitle,
              ),
            ),
          ],
        ],
      ),
    ];
  }
}
