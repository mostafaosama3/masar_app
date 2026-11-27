
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:masar_app/core/functions/extensions.dart';
import 'package:masar_app/core/styles/text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedDay = 2;

  final Set<int> completedTasks = {};

  final List<String> days = [
    'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'
  ];

  final List<String> dates = [
    '14', '15', '16', '17', '18', '19', '20'
  ];

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 24),
          children: [
            _header(),
            const Gap(20),
            _journeyCard(),
            const Gap(12),
            _nextLesson(),
            const Gap(18),
            _quickActions(),
            const Gap(20),
            _nextSession(),
            const Gap(20),
            _urgentSubmissions(),
            const Gap(20),
            _weeklySchedule(),
            const Gap(20),
            _recommendedTrack(),
            const Gap(20),
            _achievements(),
            const Gap(20),
            _workshopBanner(),
            const Gap(20),
          ],
        ),
      ),
    );
  }

  // HEADER

  Widget _header() {
    final scheme = context.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: scheme.primary,
                borderRadius: BorderRadius.circular(14),
              ),
              alignment: Alignment.center,
              child: Text(
                'M',
                style: TextStyles.title1.copyWith(
                  color: scheme.onPrimary,
                ),
              ),
            ),
            const Gap(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Masar',
                    style: TextStyles.body1.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Your Path to Success',
                    style: TextStyles.caption1,
                  ),
                ],
              ),
            ),
            CircleAvatar(
              backgroundColor: scheme.surface,
              child: Icon(
                Icons.notifications_none_rounded,
                color: scheme.onSurface,
              ),
            ),
            const Gap(8),
            CircleAvatar(
              backgroundColor: scheme.tertiary,
              child: const Icon(Icons.person),
            ),
          ],
        ),
        const Gap(22),
        Text('Welcome back!', style: TextStyles.body2),
        const Gap(4),
        Text(
          'Mahmoud 👋',
          style: TextStyles.headline2.copyWith(
            color: scheme.onSurface,
          ),
        ),
        const Gap(8),
        Row(
          children: [
            Container(
              width: 3,
              height: 38,
              color: scheme.secondary,
            ),
            const Gap(10),
            Expanded(
              child: Text(
                'Keep going, your success is closer\nthan you think!',
                style: TextStyles.caption1,
              ),
            ),
            Icon(
              Icons.school_rounded,
              size: 60,
              color: scheme.secondary,
            ),
          ],
        ),
      ],
    );
  }

  // LEARNING JOURNEY

  Widget _journeyCard() {
    final scheme = context.colorScheme;
    final c = scheme.onPrimary;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: scheme.primary,
        borderRadius: BorderRadius.circular(26),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'YOUR LEARNING JOURNEY',
            style: TextStyles.caption1.copyWith(
              color: scheme.secondary,
            ),
          ),
          const Gap(10),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Flutter Developer Program',
                      style: TextStyles.title1.copyWith(color: c),
                    ),
                    Text(
                      'Beginner Track',
                      style: TextStyles.caption1.copyWith(
                        color: c.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: c,
                size: 28,
              ),
            ],
          ),
          const Gap(22),
          Row(
            children: [
              SizedBox(
                width: 64,
                height: 64,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CircularProgressIndicator(
                      value: 0.68,
                      strokeWidth: 5,
                      backgroundColor: Colors.white.withValues(alpha: 0.15),
                      color: scheme.secondary,
                    ),
                    Center(
                      child: Text(
                        '68%',
                        style: TextStyles.body1.copyWith(color: c),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(18),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'MODULE 5',
                      style: TextStyles.caption1.copyWith(
                        color: scheme.secondary,
                      ),
                    ),
                    Text(
                      'Flutter & Dart Basics',
                      style: TextStyles.body1.copyWith(color: c),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap(20),
          Divider(color: c.withValues(alpha: 0.15)),
          const Gap(10),
          Row(
            children: const [
              Expanded(
                child: _JourneyStat(
                  icon: Icons.play_arrow_rounded,
                  title: 'DURATION',
                  value: '8 HRS',
                ),
              ),
              Gap(8),
              Expanded(
                child: _JourneyStat(
                  icon: Icons.calendar_today_rounded,
                  title: 'DEADLINE',
                  value: '1/4/2026',
                ),
              ),
              Gap(8),
              Expanded(
                child: _JourneyStat(
                  icon: Icons.star_rounded,
                  title: 'PROGRESS',
                  value: '34/50',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // NEXT LESSON

  Widget _nextLesson() {
    final scheme = context.colorScheme;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          _iconBox(Icons.description_outlined),
          const Gap(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'NEXT LESSON',
                  style: TextStyles.caption1.copyWith(
                    color: scheme.secondary,
                  ),
                ),
                Text(
                  'State Management in Flutter',
                  maxLines: 2,
                  style: TextStyles.body1.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const Gap(8),
          _actionButton(
            'Continue',
            () => showMessage('Opening next lesson...'),
            icon: Icons.arrow_forward_rounded,
          ),
        ],
      ),
    );
  }

  // QUICK ACTIONS

  Widget _quickActions() {
    final items = [
      (Icons.fact_check_outlined, 'Quizzes', 'Test your knowledge'),
      (Icons.emoji_events_outlined, 'Projects', 'Build & Learn'),
      (Icons.code_rounded, 'Code', 'Practice'),
      (Icons.headphones_rounded, 'Get Help', 'Ask Experts'),
    ];

    final colors = [
      const Color(0xFFE2F5ED),
      const Color(0xFFF0E9FF),
      const Color(0xFFFFEEE4),
      const Color(0xFFE8F3FF),
    ];

    return Row(
      children: [
        for (int i = 0; i < items.length; i++) ...[
          if (i != 0) const Gap(8),
          Expanded(
            child: GestureDetector(
              onTap: () => showMessage('${items[i].$2} selected'),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 4,
                ),
                decoration: BoxDecoration(
                  color: colors[i],
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        items[i].$1,
                        color: i == 2
                            ? Colors.deepOrange
                            : const Color(0xFF009F75),
                      ),
                    ),
                    const Gap(8),
                    Text(
                      items[i].$2,
                      maxLines: 1,
                      style: TextStyles.caption1.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      items[i].$3,
                      textAlign: TextAlign.center,
                      style: TextStyles.caption1.copyWith(fontSize: 9),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }

  // NEXT SESSION

  Widget _nextSession() {
    final scheme = context.colorScheme;

    return Column(
      children: [
        _sectionTitle(
          Icons.calendar_month_rounded,
          'Next Session',
          'See All',
          () => showMessage('All sessions'),
        ),
        const Gap(10),
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: scheme.surface,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            children: [
              _iconBox(Icons.calendar_month_rounded),
              const Gap(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Clean Architecture',
                      style: TextStyles.body1.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Today, 7:00 PM – 8:30 PM',
                      style: TextStyles.caption1,
                    ),
                    const Gap(4),
                    Text(
                      '🎥 Online Session via Google Meet',
                      style: TextStyles.caption1,
                    ),
                  ],
                ),
              ),
              const Gap(6),
              _actionButton(
                'Join',
                () => showMessage('Meeting link is not configured yet'),
                icon: Icons.videocam,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // URGENT SUBMISSIONS

  Widget _urgentSubmissions() {
    final tasks = [
      (
        'Clean Architecture Final Project',
        'Due in 2 days • 20 points',
        'Due 11/15'
      ),
      (
        'Components in Flutter & State Management',
        'Due in 5 days • 15 points',
        'Due 11/18'
      ),
    ];

    return Column(
      children: [
        _sectionTitle(
          Icons.assignment_outlined,
          'Urgent Submissions',
          '${tasks.length - completedTasks.length} New',
          () => showMessage('All submissions'),
        ),
        const Gap(10),
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            children: [
              for (int i = 0; i < tasks.length; i++) ...[
                if (i > 0) const Divider(height: 24),
                Row(
                  children: [
                    Checkbox(
                      value: completedTasks.contains(i),
                      onChanged: (value) {
                        setState(() {
                          if (value == true) {
                            completedTasks.add(i);
                          } else {
                            completedTasks.remove(i);
                          }
                        });
                      },
                    ),
                    const Gap(6),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tasks[i].$1,
                            style: TextStyles.body1.copyWith(
                              fontWeight: FontWeight.w700,
                              decoration: completedTasks.contains(i)
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                          ),
                          Text(
                            tasks[i].$2,
                            style: TextStyles.caption1,
                          ),
                        ],
                      ),
                    ),
                    const Gap(4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 9,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: completedTasks.contains(i)
                            ? Colors.green.withValues(alpha: 0.1)
                            : Colors.red.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        tasks[i].$3,
                        style: TextStyles.caption1.copyWith(
                          fontSize: 10,
                          color: completedTasks.contains(i)
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  // WEEKLY SCHEDULE

  Widget _weeklySchedule() {
    final scheme = context.colorScheme;

    return Column(
      children: [
        _sectionTitle(
          Icons.bar_chart_rounded,
          'Weekly Schedule & Activity',
          'View Details',
          () => showMessage('Weekly activity details'),
        ),
        const Gap(10),
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: scheme.surface,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Row(
                children: List.generate(days.length, (i) {
                  final active = selectedDay == i;

                  return Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => selectedDay = i),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: active ? scheme.primary : Colors.transparent,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Column(
                          children: [
                            Text(
                              days[i],
                              style: TextStyles.caption1.copyWith(
                                fontSize: 9,
                                color: active
                                    ? scheme.secondary
                                    : scheme.onSurface.withValues(alpha: 0.5),
                              ),
                            ),
                            const Gap(5),
                            Text(
                              dates[i],
                              style: TextStyles.body1.copyWith(
                                fontWeight: FontWeight.w700,
                                color: active
                                    ? scheme.onPrimary
                                    : scheme.onSurface,
                              ),
                            ),
                            if (active)
                              Container(
                                margin: const EdgeInsets.only(top: 5),
                                width: 5,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: scheme.secondary,
                                  shape: BoxShape.circle,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
              const Gap(18),
              Row(
                children: const [
                  Expanded(
                    child: _ActivityStat(
                      icon: Icons.bar_chart_rounded,
                      value: '12/7',
                      label: 'Lessons',
                    ),
                  ),
                  Gap(8),
                  Expanded(
                    child: _ActivityStat(
                      icon: Icons.access_time_rounded,
                      value: '8h 30m',
                      label: 'Total Time',
                    ),
                  ),
                  Gap(8),
                  Expanded(
                    child: _ActivityStat(
                      icon: Icons.check_rounded,
                      value: '8 Completed',
                      label: 'This Week',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  // RECOMMENDED TRACK

  Widget _recommendedTrack() {
    final scheme = context.colorScheme;

    return Column(
      children: [
        _sectionTitle(
          Icons.star_rounded,
          'Recommended Next Track',
          'Explore All',
          () => showMessage('All learning tracks'),
        ),
        const Gap(10),
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: scheme.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Artificial Intelligence Track',
                      style: TextStyles.title1.copyWith(
                        color: scheme.onPrimary,
                      ),
                    ),
                    const Gap(6),
                    Text(
                      'Learn AI and build smart apps',
                      style: TextStyles.caption1.copyWith(
                        color: scheme.onPrimary.withValues(alpha: 0.7),
                      ),
                    ),
                    const Gap(14),
                    GestureDetector(
                      onTap: () => showMessage('Opening AI Track'),
                      child: Text(
                        'Continue Learning →',
                        style: TextStyles.body2.copyWith(
                          color: scheme.secondary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(10),
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: scheme.secondary.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.smart_toy_rounded,
                  size: 46,
                  color: scheme.secondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ACHIEVEMENTS

  Widget _achievements() {
    final scheme = context.colorScheme;

    return Column(
      children: [
        _sectionTitle(
          Icons.emoji_events_rounded,
          'Achievements & Milestones',
          'View All',
          () => showMessage('All achievements'),
        ),
        const Gap(10),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: scheme.surface,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.orange.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.workspace_premium_rounded,
                  color: Colors.orange,
                  size: 28,
                ),
              ),
              const Gap(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "You're doing great!",
                      style: TextStyles.body1.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Keep learning to unlock more achievements.',
                      style: TextStyles.caption1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // WORKSHOP BANNER

  Widget _workshopBanner() {
    final scheme = context.colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: scheme.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: scheme.secondary.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.desktop_windows_rounded,
              color: scheme.secondary,
            ),
          ),
          const Gap(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Join our next workshop!',
                  style: TextStyles.body1.copyWith(
                    color: scheme.onPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Flutter Advanced Concepts',
                  style: TextStyles.caption1.copyWith(
                    color: scheme.onPrimary.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
          IconButton.filled(
            onPressed: () => showMessage('Opening workshop'),
            style: IconButton.styleFrom(
              backgroundColor: scheme.surface,
              foregroundColor: scheme.primary,
            ),
            icon: const Icon(Icons.arrow_forward_rounded),
          ),
        ],
      ),
    );
  }

  // SHARED WIDGETS

  Widget _iconBox(IconData icon) {
    final scheme = context.colorScheme;

    return Container(
      width: 46,
      height: 46,
      decoration: BoxDecoration(
        color: scheme.tertiary.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Icon(icon, color: scheme.secondary),
    );
  }

  Widget _actionButton(
    String label,
    VoidCallback onPressed, {
    required IconData icon,
  }) {
    final scheme = context.colorScheme;

    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        minimumSize: const Size(0, 40),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label),
          const Gap(4),
          Icon(icon, size: 15),
        ],
      ),
    );
  }

  Widget _sectionTitle(
    IconData icon,
    String title,
    String action,
    VoidCallback onTap,
  ) {
    final scheme = context.colorScheme;

    return Row(
      children: [
        Icon(icon, color: scheme.secondary, size: 20),
        const Gap(7),
        Expanded(
          child: Text(
            title,
            style: TextStyles.body1.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            action,
            style: TextStyles.caption1.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

// JOURNEY STAT

class _JourneyStat extends StatelessWidget {
  const _JourneyStat({
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;

    return Container(
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: scheme.secondary, size: 17),
          const Gap(5),
          Text(
            title,
            maxLines: 1,
            style: TextStyles.caption1.copyWith(
              color: scheme.onPrimary.withValues(alpha: 0.7),
              fontSize: 8,
            ),
          ),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.caption1.copyWith(
              color: scheme.onPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

// ACTIVITY STAT

class _ActivityStat extends StatelessWidget {
  const _ActivityStat({
    required this.icon,
    required this.value,
    required this.label,
  });

  final IconData icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 5,
      ),
      decoration: BoxDecoration(
        color: scheme.tertiary.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Icon(icon, color: scheme.secondary, size: 19),
          const Gap(6),
          Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyles.body1.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            label,
            style: TextStyles.caption1.copyWith(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
