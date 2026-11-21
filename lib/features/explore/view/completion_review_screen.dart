import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:masar_app/core/routes/routes_name.dart';

import '../widgets/completion_widgets/bottom_certificate_bar.dart';
import '../widgets/completion_widgets/completion_app_bar.dart';
import '../widgets/completion_widgets/core_dimension_scores_section.dart';
import '../widgets/completion_widgets/detailed_testimonial_card.dart';
import '../widgets/completion_widgets/graduation_banner_card.dart';
import '../widgets/completion_widgets/likelihood_card.dart';
import '../widgets/completion_widgets/overall_experience_card.dart';
import '../widgets/completion_widgets/what_stood_out_section.dart';

class CompletionReviewScreen extends StatefulWidget {
  const CompletionReviewScreen({super.key});

  @override
  State<CompletionReviewScreen> createState() => _CompletionReviewScreenState();
}

class _CompletionReviewScreenState extends State<CompletionReviewScreen> {
  int selectedStars = 5;
  int selectedLikelihood = 10;
  bool isAnonymous = false;
  final Set<String> selectedHighlights = {
    'Architecture',
    'Mentor Reviews',
    'Career Readiness',
    'Dart Patterns',
  };
  final TextEditingController testimonialController = TextEditingController(
    text: 'The deep dive into BLoC & custom renderers gave me confidence to lead mobile architecture discussions at work. Eng. Tariq\'s feedback was transformative.',
  );

  static const List<String> _allHighlights = [
    'Architecture',
    'Mentor Reviews',
    'Career Readiness',
    'Dart Patterns',
    'Challenging Pace',
  ];

  @override
  void dispose() {
    testimonialController.dispose();
    super.dispose();
  }

  void _showSnack(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6F4),
      appBar: CompletionAppBar(progress: 1.0, onBack: () => context.pop()),
      bottomNavigationBar: BottomCertificateBar(
        onSubmit: () {
          _showSnack('Certificate claim submitted!');
          context.go(RouteNames.main);
        },
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 24),
          children: [
            const GraduationBannerCard(),
            const Gap(14),
            OverallExperienceCard(
              stars: selectedStars,
              onSelectStar: (value) => setState(() => selectedStars = value),
            ),
            const Gap(18),
            const CoreDimensionScoresSection(),
            const Gap(18),
            WhatStoodOutSection(
              highlights: _allHighlights,
              selected: selectedHighlights,
              onToggle: (item) {
                setState(() {
                  if (selectedHighlights.contains(item)) {
                    selectedHighlights.remove(item);
                  } else {
                    selectedHighlights.add(item);
                  }
                });
              },
            ),
            const Gap(18),
            DetailedTestimonialCard(
              controller: testimonialController,
              isAnonymous: isAnonymous,
              onToggleAnonymous: (val) => setState(() => isAnonymous = val),
            ),
            const Gap(14),
            LikelihoodCard(
              selectedValue: selectedLikelihood,
              onSelectValue: (val) => setState(() => selectedLikelihood = val),
            ),
          ],
        ),
      ),
    );
  }
}
