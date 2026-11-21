import 'package:masar_app/features/ranking/data/models/ranking_overview.dart';
import 'package:masar_app/features/ranking/data/repositories/ranking_repository.dart';

/// Fake data. Each tab returns a different board so switching tabs is visible.
class MockRankingRepository implements RankingRepository {
  // Remembers the join so a refresh doesn't "un-join" the user.
  bool _sprintJoined = false;

  @override
  Future<RankingOverview> getRanking(RankingScope scope) async {
    await Future<void>.delayed(const Duration(milliseconds: 700));

    const badges = [
      RankingBadgeInfo(key: 'speed', title: 'Fast Submitter', subtitle: 'Top 5% speed'),
      RankingBadgeInfo(key: 'bug', title: 'Bug Hunter', subtitle: '0 regression'),
      RankingBadgeInfo(key: 'code', title: 'Clean Code', subtitle: 'Peer-approved'),
    ];

    final sprint = RankingSprint(
      id: 'sprint-flutter-animations',
      title: 'Flutter Animations Sprint',
      endsAt: DateTime.now().add(const Duration(days: 2, hours: 1)),
      prizeXp: 300,
      prizeBadge: 'Animation Guru',
      joined: _sprintJoined,
    );

    RankingProfile profile(int rank) => RankingProfile(
          name: 'Zaid Al-Omari',
          level: 7,
          levelTitle: 'Architecture Craftsman',
          rank: rank,
          totalXp: 2840,
          levelXp: 840,
          levelXpTarget: 1000,
          nextLevelTitle: 'Lead Eng',
          badgesCount: 14,
          taskQualityPercent: 98,
          streakPercent: 100,
        );

    switch (scope) {
      case RankingScope.cohort:
        return RankingOverview(
          scope: scope,
          boardTitle: 'Taqniya Cohort #12',
          profile: profile(4),
          entries: const [
            RankingEntry(rank: 1, name: 'Omar F.', role: 'Frontend Fellow', xp: 3450, weeklyChange: 150),
            RankingEntry(rank: 2, name: 'Reem H.', role: 'Mobile Associate', xp: 3120, weeklyChange: 130),
            RankingEntry(rank: 3, name: 'Khalid S.', role: 'Backend Trainee', xp: 2990, weeklyChange: 110),
            RankingEntry(rank: 4, name: 'Zaid Al-Omari', role: 'Architecture Craftsman', xp: 2840, weeklyChange: 120, isMe: true),
            RankingEntry(rank: 5, name: 'Sarah Al-Dossari', role: 'Full-Stack Trainee', xp: 2710, weeklyChange: 95),
            RankingEntry(rank: 6, name: 'Fahad Al-Mutairi', role: 'Cloud Systems Fellow', xp: 2650, weeklyChange: 60),
            RankingEntry(rank: 7, name: 'Noura Al-Ghamdi', role: 'Security Associate', xp: 2590, weeklyChange: 80),
          ],
          sprint: sprint,
          badges: badges,
          totalBadges: 14,
        );

      case RankingScope.global:
        return RankingOverview(
          scope: scope,
          boardTitle: 'Global MASAR',
          profile: profile(48),
          entries: const [
            RankingEntry(rank: 1, name: 'Lina A.', role: 'Principal Engineer', xp: 9120, weeklyChange: 310),
            RankingEntry(rank: 2, name: 'Hassan M.', role: 'Staff Engineer', xp: 8870, weeklyChange: 280),
            RankingEntry(rank: 3, name: 'Maya K.', role: 'Lead Engineer', xp: 8640, weeklyChange: 260),
            RankingEntry(rank: 47, name: 'Yousef T.', role: 'Mobile Fellow', xp: 2860, weeklyChange: 90),
            RankingEntry(rank: 48, name: 'Zaid Al-Omari', role: 'Architecture Craftsman', xp: 2840, weeklyChange: 120, isMe: true),
            RankingEntry(rank: 49, name: 'Dina R.', role: 'Frontend Associate', xp: 2835, weeklyChange: 70),
          ],
          sprint: sprint,
          badges: badges,
          totalBadges: 14,
        );

      case RankingScope.sprint:
        return RankingOverview(
          scope: scope,
          boardTitle: 'Flutter Animations Sprint',
          profile: profile(2),
          entries: const [
            RankingEntry(rank: 1, name: 'Omar F.', role: 'Frontend Fellow', xp: 420, weeklyChange: 420),
            RankingEntry(rank: 2, name: 'Zaid Al-Omari', role: 'Architecture Craftsman', xp: 390, weeklyChange: 390, isMe: true),
            RankingEntry(rank: 3, name: 'Reem H.', role: 'Mobile Associate', xp: 370, weeklyChange: 370),
            RankingEntry(rank: 4, name: 'Sarah Al-Dossari', role: 'Full-Stack Trainee', xp: 310, weeklyChange: 310),
          ],
          sprint: sprint,
          badges: badges,
          totalBadges: 14,
        );
    }
  }

  @override
  Future<void> joinSprint(String sprintId) async {
    await Future<void>.delayed(const Duration(milliseconds: 600));
    _sprintJoined = true;
  }
}
