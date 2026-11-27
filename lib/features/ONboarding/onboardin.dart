import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:masar_app/core/constants/app_images.dart';
import 'package:masar_app/core/functions/extensions.dart';
import 'package:masar_app/core/localization/locale_notifier.dart.dart';
import 'package:masar_app/core/routes/routes_name.dart';
import 'package:masar_app/core/styles/text_styles.dart';
import 'package:masar_app/core/widgets/app_asset_image.dart';
import 'package:masar_app/l10n/app_localizations.dart';

const _images = [
  AppImages.onboarding1,
  AppImages.onboarding2,
  AppImages.onboarding3,
];

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _index = 0;

  bool get _isLast => _index == _images.length - 1;

  void _finish() => context.go(RouteNames.completeProfile);

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
    final l10n = AppLocalizations.of(context)!;
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    final titles = [l10n.onboarding1Title, l10n.onboarding2Title, l10n.onboarding3Title];
    final descs = [l10n.onboarding1Desc, l10n.onboarding2Desc, l10n.onboarding3Desc];

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppImages.lightBackground,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      scheme.surface,
                      scheme.tertiary.withValues(alpha: 0.35),
                    ],
                  ),
                ),
              );
            },
          ),
          Container(color: Colors.white.withValues(alpha: 0.08)),
          SafeArea(
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(24, 12, 24, 24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _LanguageToggle(
                        isEnglish: isEnglish,
                        onChanged: (value) {
                          appLocale.value = Locale(value ? 'en' : 'ar');
                        },
                      ),
                      TextButton(
                        onPressed: _finish,
                        child: Text(
                          l10n.skip,
                          style: TextStyles.body2.copyWith(
                            color: scheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: _controller,
                      itemCount: _images.length,
                      onPageChanged: (i) => setState(() => _index = i),
                      itemBuilder: (context, i) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Center(
                                child: AppAssetImage(
                                  _images[i],
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            const Gap(16),
                            Text(
                              titles[i],
                              style: TextStyles.headline2.copyWith(
                                color: scheme.primary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Gap(8),
                            Text(
                              descs[i],
                              style: TextStyles.body2.copyWith(
                                color: scheme.onSurface.withValues(alpha: 0.7),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  const Gap(24),
                  Row(
                    children: [
                      Row(
                        children: List.generate(_images.length, (i) {
                          final active = i == _index;
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            margin: const EdgeInsetsDirectional.only(end: 8),
                            height: 8,
                            width: active ? 24 : 8,
                            decoration: BoxDecoration(
                              color: active
                                  ? scheme.primary
                                  : scheme.tertiary.withValues(alpha: 0.4),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          );
                        }),
                      ),
                      const Spacer(),
                      FilledButton.icon(
                        onPressed: _next,
                        iconAlignment: IconAlignment.end,
                        icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                        label: Text(_isLast ? l10n.getStarted : l10n.next),
                        style: FilledButton.styleFrom(
                          minimumSize: const Size(130, 48),
                          shape: const StadiumBorder(),
                        ),
                      ),],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}class _LanguageToggle extends StatelessWidget {
  const _LanguageToggle({
    required this.isEnglish,
    required this.onChanged,
  });

  final bool isEnglish;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;

    Widget option(String label, bool selected, VoidCallback onTap) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
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
        color: scheme.surface.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          option('EN', isEnglish, () => onChanged(true)),
          option('عربي', !isEnglish, () => onChanged(false)),
        ],
      ),
    );
  }
}
