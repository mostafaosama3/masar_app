/// Which leaderboard is being viewed (the three tabs on the screen).
enum RankingScope {
  cohort('Cohort', 'COHORT RANK'),
  global('Global MASAR', 'GLOBAL RANK'),
  sprint('Sprint', 'SPRINT RANK');

  const RankingScope(this.label, this.rankLabel);

  final String label;
  final String rankLabel;
}

/// Everything the Ranking screen needs for ONE scope, returned by one call.
class RankingOverview {
  const RankingOverview({
    required this.scope,
    required this.boardTitle,
    required this.profile,
    required this.entries,
    required this.sprint,
    required this.badges,
    required this.totalBadges,
  });

  final RankingScope scope;
  final String boardTitle; // Taqniya Cohort #12
  final RankingProfile profile;

  /// The whole leaderboard sorted by rank. The first 3 are the podium,
  /// the rest are the standings list.
  final List<RankingEntry> entries;

  final RankingSprint? sprint;
  final List<RankingBadgeInfo> badges;
  final int totalBadges;

  List<RankingEntry> get podium => entries.take(3).toList();
  List<RankingEntry> get standings => entries.skip(3).toList();

  RankingOverview copyWith({RankingSprint? sprint}) => RankingOverview(
        scope: scope,
        boardTitle: boardTitle,
        profile: profile,
        entries: entries,
        sprint: sprint ?? this.sprint,
        badges: badges,
        totalBadges: totalBadges,
      );

  factory RankingOverview.fromJson(Map<String, dynamic> json) => RankingOverview(
        scope: RankingScope.values.firstWhere(
          (s) => s.name == json['scope'],
          orElse: () => RankingScope.cohort,
        ),
        boardTitle: json['board_title'] as String,
        profile: RankingProfile.fromJson(json['profile'] as Map<String, dynamic>),
        entries: (json['entries'] as List)
            .map((e) => RankingEntry.fromJson(e as Map<String, dynamic>))
            .toList(),
        sprint: json['sprint'] == null
            ? null
            : RankingSprint.fromJson(json['sprint'] as Map<String, dynamic>),
        badges: (json['badges'] as List)
            .map((e) => RankingBadgeInfo.fromJson(e as Map<String, dynamic>))
            .toList(),
        totalBadges: json['total_badges'] as int,
      );
}

/// The signed-in user's own card at the top.
class RankingProfile {
  const RankingProfile({
    required this.name,
    required this.level,
    required this.levelTitle,
    required this.rank,
    required this.totalXp,
    required this.levelXp,
    required this.levelXpTarget,
    required this.nextLevelTitle,
    required this.badgesCount,
    required this.taskQualityPercent,
    required this.streakPercent,
  });

  final String name;
  final int level; // 7
  final String levelTitle; // Architecture Craftsman
  final int rank; // 4
  final int totalXp; // 2840
  final int levelXp; // 840  (progress inside the current level)
  final int levelXpTarget; // 1000
  final String nextLevelTitle; // Lead Eng
  final int badgesCount; // 14
  final int taskQualityPercent; // 98
  final int streakPercent; // 100

  double get levelProgress =>
      levelXpTarget == 0 ? 0 : (levelXp / levelXpTarget).clamp(0.0, 1.0);

  int get xpToNextLevel => (levelXpTarget - levelXp).clamp(0, levelXpTarget);

  factory RankingProfile.fromJson(Map<String, dynamic> json) => RankingProfile(
        name: json['name'] as String,
        level: json['level'] as int,
        levelTitle: json['level_title'] as String,
        rank: json['rank'] as int,
        totalXp: json['total_xp'] as int,
        levelXp: json['level_xp'] as int,
        levelXpTarget: json['level_xp_target'] as int,
        nextLevelTitle: json['next_level_title'] as String,
        badgesCount: json['badges_count'] as int,
        taskQualityPercent: json['task_quality_percent'] as int,
        streakPercent: json['streak_percent'] as int,
      );
}

class RankingEntry {
  const RankingEntry({
    required this.rank,
    required this.name,
    required this.role,
    required this.xp,
    required this.weeklyChange,
    this.isMe = false,
  });

  final int rank;
  final String name;
  final String role;
  final int xp;
  final int weeklyChange; // +120
  final bool isMe;

  factory RankingEntry.fromJson(Map<String, dynamic> json) => RankingEntry(
        rank: json['rank'] as int,
        name: json['name'] as String,
        role: json['role'] as String,
        xp: json['xp'] as int,
        weeklyChange: json['weekly_change'] as int,
        isMe: json['is_me'] as bool? ?? false,
      );
}

class RankingSprint {
  const RankingSprint({
    required this.id,
    required this.title,
    required this.endsAt,
    required this.prizeXp,
    required this.prizeBadge,
    required this.joined,
  });

  final String id;
  final String title;
  final DateTime endsAt;
  final int prizeXp; // 300
  final String prizeBadge; // Animation Guru
  final bool joined;

  RankingSprint copyWith({bool? joined}) => RankingSprint(
        id: id,
        title: title,
        endsAt: endsAt,
        prizeXp: prizeXp,
        prizeBadge: prizeBadge,
        joined: joined ?? this.joined,
      );

  factory RankingSprint.fromJson(Map<String, dynamic> json) => RankingSprint(
        id: json['id'] as String,
        title: json['title'] as String,
        endsAt: DateTime.parse(json['ends_at'] as String).toLocal(),
        prizeXp: json['prize_xp'] as int,
        prizeBadge: json['prize_badge'] as String,
        joined: json['joined'] as bool? ?? false,
      );
}

class RankingBadgeInfo {
  const RankingBadgeInfo({
    required this.key,
    required this.title,
    required this.subtitle,
  });

  /// speed | bug | code  (the UI maps this to an icon)
  final String key;
  final String title;
  final String subtitle;

  factory RankingBadgeInfo.fromJson(Map<String, dynamic> json) => RankingBadgeInfo(
        key: json['key'] as String,
        title: json['title'] as String,
        subtitle: json['subtitle'] as String,
      );
}
