import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:masar_app/core/constants/app_images.dart';
import 'package:masar_app/core/functions/extensions.dart';
import 'package:masar_app/core/styles/app_colors.dart';
import 'package:masar_app/core/styles/text_styles.dart';
import 'package:masar_app/core/widgets/app_asset_image.dart';
const _stats = [
  ('24', 'Total Sessions', Icons.play_arrow_rounded),
  ('1.8K+', 'Trainees Taught', Icons.groups_rounded),
  ('4.9', 'Rating', Icons.star_rounded),
  ('98%', 'Satisfaction', Icons.sentiment_satisfied_alt_rounded),
];

const _expertise = [
  'Flutter',
  'Dart',
  'Clean Architecture',
  'State Management',
  'Firebase',
  'UI/UX',
];

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const _TopBar(),
            const _Banner(),
            const Gap(12),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Eng. Ahmed Mohamed  ',
                    style: TextStyles.title1.copyWith(color: scheme.onSurface),
                  ),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: scheme.tertiary.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star_rounded,
                              size: 14, color: scheme.secondary),
                          const Gap(4),
                          Text(
                            'Instructor',
                            style: TextStyles.caption1.copyWith(
                              color: scheme.secondary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(4),
            Text(
              'Flutter Developer & Instructor',
              style: TextStyles.body2.copyWith(color: scheme.secondary),
            ),
            const Gap(6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on_outlined,
                    size: 16, color: scheme.secondary),
                const Gap(4),
                Text('Cairo, Egypt', style: TextStyles.caption1),
                const Gap(8),
                const Text('•'),
                const Gap(8),
                Icon(Icons.calendar_month_outlined,
                    size: 16, color: scheme.secondary),
                const Gap(4),
                Text('Joined Jan 2024', style: TextStyles.caption1),
              ],
            ),
            const Gap(16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const _StatsCard(),
                  const Gap(12),
                  const _SpecializationCard(),
                  const Gap(12),
                  _SectionCard(
                    icon: Icons.person_outline_rounded,
                    title: 'About',
                    action: _LinkAction(label: 'Edit', onTap: () {}),
                    child: Text(
                      'Flutter developer and instructor with over 3 years of '
                      'experience in mobile app development. Passionate about '
                      'teaching and sharing knowledge.',
                      style: TextStyles.body2,
                    ),
                  ),
                  const Gap(12),
                  _SectionCard(
                    icon: Icons.code_rounded,
                    title: 'Expertise',
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (final item in _expertise)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: scheme.tertiary.withValues(alpha: 0.25),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              item,
                              style: TextStyles.caption1.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const Gap(12),
                  _SectionCard(
                    icon: Icons.school_outlined,
                    title: 'My Courses',
                    action: _LinkAction(label: 'View All', onTap: () {}),
                    child: const _CourseTile(),
                  ),
                  const Gap(12),
                  _SectionCard(
                    icon: Icons.emoji_events_outlined,
                    title: 'Achievements',
                    action: _LinkAction(label: 'View All', onTap: () {}),
                    child: const _AchievementsRow(),
                  ),
                  
                  const Gap(24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    return Container(
      color: scheme.surface,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Row(
            children: [
              ClipOval(
                child: SizedBox(
                  width: 44,
                  height: 44,
                  child: AppAssetImage(
                    AppImages.avatar,
                    fallbackIcon: Icons.person_rounded,
                  ),
                ),
              ),
              const Gap(12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MASAR EXECUTIVE',
                    style: TextStyles.caption1.copyWith(
                      color: scheme.secondary,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Text(
                    'Profile',
                    style: TextStyles.title1.copyWith(color: scheme.onSurface),
                  ),
                ],
              ),
              const Spacer(),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: scheme.surface,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.08),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: const Icon(Icons.notifications_none_rounded),
                  ),
                  Positioned(
                    right: 12,
                    top: 10,
                    child: Container(
                      width: 9,
                      height: 9,
                      decoration: const BoxDecoration(
                        color: LightPalette.redColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Banner extends StatelessWidget {
  const _Banner();

  Widget _circleButton(Widget icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.15),
          shape: BoxShape.circle,
        ),
        child: icon,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    return SizedBox(
      height: 250,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 190,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  scheme.primary,
                  scheme.primary,
                  context.theme.scaffoldBackgroundColor,
                ],
                stops: const [0, 0.45, 1],
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                _circleButton(
                  const Icon(Icons.arrow_back_rounded, color: Colors.white),
                  () => context.pop(),
                ),
                const Spacer(),
                _circleButton(
                  const Icon(Icons.qr_code_2_rounded, color: Colors.white),
                  () {},
                ),
                const Gap(8),
                _circleButton(
                  const Icon(Icons.tune_rounded, color: Colors.white),
                  () {},
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 116,
                  height: 116,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: scheme.surface,
                    border: Border.all(color: scheme.secondary, width: 3),
                  ),
                  child: ClipOval(
                    child: AppAssetImage(
                      AppImages.avatar,
                      fallbackIcon: Icons.person_rounded,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: scheme.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.camera_alt_outlined,
                        size: 16, color: scheme.onPrimary),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: scheme.surface,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.check_circle_rounded,
                        size: 24, color: scheme.secondary),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatsCard extends StatelessWidget {
  const _StatsCard();

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: IntrinsicHeight(
          child: Row(
            children: [
              for (var i = 0; i < _stats.length; i++) ...[
                if (i != 0) VerticalDivider(width: 1, color: scheme.outline),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        _stats[i].$1,
                        style: TextStyles.title1.copyWith(
                          color: scheme.onSurface,
                        ),
                      ),
                      const Gap(2),
                      Text(
                        _stats[i].$2,
                        textAlign: TextAlign.center,
                        style: TextStyles.caption1.copyWith(
                          color: scheme.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                      const Spacer(),
                      Icon(_stats[i].$3, size: 18, color: scheme.secondary),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _SpecializationCard extends StatelessWidget {
  const _SpecializationCard();

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: scheme.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.workspace_premium_outlined,
                color: scheme.onPrimary),
          ),
          const Gap(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Specialization',
                  style: TextStyles.caption1.copyWith(
                    color: scheme.onPrimary.withValues(alpha: 0.7),
                  ),
                ),
                Text(
                  'Flutter Development',
                  style: TextStyles.subtitle.copyWith(
                    color: scheme.onPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Text(
            'View All',
            style: TextStyles.caption1.copyWith(color: scheme.onPrimary),
          ),
          Icon(Icons.chevron_right_rounded, color: scheme.onPrimary),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.icon,
    required this.title,
    required this.child,
    this.action,
  });

  final IconData icon;
  final String title;
  final Widget child;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: scheme.secondary),
                const Gap(8),
                Text(
                  title,
                  style: TextStyles.subtitle.copyWith(
                    color: scheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                ?action,
              ],
            ),
            const Gap(12),
            child,
          ],
        ),
      ),
    );
  }
}

class _LinkAction extends StatelessWidget {
  const _LinkAction({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: TextStyles.caption1),
          if (label != 'Edit') const Icon(Icons.chevron_right_rounded, size: 18),
        ],
      ),
    );
  }
}

class _CourseTile extends StatelessWidget {
  const _CourseTile();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            width: 100,
            height: 70,
            child: AppAssetImage(AppImages.course),
          ),
        ),
        const Gap(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Complete Flutter Bootcamp',
                style: TextStyles.body1.copyWith(fontWeight: FontWeight.w600),
              ),
              const Gap(6),
              Row(
                children: [
                  const Icon(Icons.access_time_rounded, size: 16),
                  const Gap(4),
                  Text('24h', style: TextStyles.caption1),
                  const Gap(12),
                  const Icon(Icons.star_rounded,
                      size: 16, color: LightPalette.goldColor),
                  const Gap(4),
                  Text('4.8', style: TextStyles.caption1),
                ],
              ),
            ],
          ),
        ),
        const Icon(Icons.chevron_right_rounded),
      ],
    );
  }
}

class _AchievementsRow extends StatelessWidget {
  const _AchievementsRow();

  @override
  Widget build(BuildContext context) {
    // TODO: replace with the real badge images from Figma
    final badges = <(Color, IconData)>[
      (const Color(0xFF1E7B5A), Icons.star_rounded),
      (const Color(0xFF6D4FD6), Icons.rocket_launch_rounded),
      (LightPalette.goldColor, Icons.workspace_premium_rounded),
      (const Color(0xFF2E8B6A), Icons.emoji_events_rounded),
      (const Color(0xFF9B87E8), Icons.star_rounded),
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (final b in badges)
          Stack(
            alignment: Alignment.center,
            children: [
              Icon(Icons.hexagon_rounded, size: 56, color: b.$1),
              Icon(b.$2, size: 24, color: Colors.white),
            ],
          ),
      ],
    );
  }
}