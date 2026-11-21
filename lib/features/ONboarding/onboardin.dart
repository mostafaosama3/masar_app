import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:masar_app/core/constants/app_images.dart';
import 'package:masar_app/core/functions/extensions.dart';
import 'package:masar_app/core/routes/routes_name.dart';
import 'package:masar_app/core/styles/text_styles.dart';
import 'package:masar_app/core/widgets/app_asset_image.dart';

class _OnboardingData {
  const _OnboardingData({
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;
}

const _pages = <_OnboardingData>[
  _OnboardingData(
    image: AppImages.onboarding1,
    title: 'Discover Your Path',
    description: 'Explore top bootcamps from leading training companies.',
  ),
  _OnboardingData(
    image: AppImages.onboarding2,
    title: 'Learn & Grow',
    description: 'Attend sessions, complete tasks, and track your progress.',
  ),
  _OnboardingData(
    image: AppImages.onboarding3,
    title: 'Achieve More',
    description: 'Earn badges, climb the leaderboard, and reach new heights.',
  ),
];

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();

  int _index = 0;
  bool _isEnglish = true;

  bool get _isLast => _index == _pages.length - 1;

  void _finish() {
    context.go(RouteNames.welcome);
  }

  void _next() {
    if (_isLast) {
      _finish();
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              context.theme.scaffoldBackgroundColor,
              scheme.tertiary.withValues(alpha: 0.3),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
            child: Column(
              children: [
                // Language and Skip
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _LanguageToggle(
                      isEnglish: _isEnglish,
                      onChanged: (value) {
                        setState(() {
                          _isEnglish = value;
                        });
                      },
                    ),
                    TextButton(
                      onPressed: _finish,
                      child: const Text('Skip'),
                    ),
                  ],
                ),

                // Onboarding pages
                Expanded(
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: _pages.length,
                    onPageChanged: (index) {
                      setState(() {
                        _index = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      final page = _pages[index];

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Onboarding image directly on screen background
                          Expanded(
                            child: Center(
                              child: AppAssetImage(
                                page.image,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),

                          const Gap(16),

                          Text(
                            page.title,
                            style: TextStyles.headline2.copyWith(
                              color: scheme.primary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          const Gap(8),

                          Text(
                            page.description,
                            style: TextStyles.body2.copyWith(
                              color: scheme.onSurface.withValues(
                                alpha: 0.7,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),

                const Gap(24),

                // Indicators and Next button
                Row(
                  children: [
                    Row(
                      children: List.generate(
                        _pages.length,
                        (index) {
                          final active = index == _index;

                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            margin: const EdgeInsets.only(right: 8),
                            height: 8,
                            width: active ? 24 : 8,
                            decoration: BoxDecoration(
                              color: active
                                  ? scheme.primary
                                  : scheme.tertiary.withValues(
                                      alpha: 0.4,
                                    ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          );
                        },
                      ),
                    ),

                    const Spacer(),

                    FilledButton.icon(
                      onPressed: _next,
                      iconAlignment: IconAlignment.end,
                      icon: const Icon(
                        Icons.arrow_forward_rounded,
                        size: 18,
                      ),
                      label: Text(
                        _isLast ? 'Get Started' : 'Next',
                      ),
                      style: FilledButton.styleFrom(
                        minimumSize: const Size(130, 48),
                        shape: const StadiumBorder(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Language Toggle
class _LanguageToggle extends StatelessWidget {
  const _LanguageToggle({
    required this.isEnglish,
    required this.onChanged,
  });

  final bool isEnglish;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;

    Widget option(
      String label,
      bool selected,
      VoidCallback onTap,
    ) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: selected ? scheme.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            label,
            style: TextStyles.caption1.copyWith(
              fontWeight: FontWeight.w600,
              color: selected ? scheme.onPrimary : scheme.onSurface,
            ),
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          option(
            'EN',
            isEnglish,
            () => onChanged(true),
          ),
          option(
            'عربي',
            !isEnglish,
            () => onChanged(false),
          ),
        ],
      ),
    );
  }
}