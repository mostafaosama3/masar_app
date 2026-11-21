import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:masar_app/core/routes/routes_name.dart';

import '../../explore/model/explore_model.dart';
import '../model/details_model.dart';
import '../widgets/details_widgets/bottom_apply_bar.dart';
import '../widgets/details_widgets/curriculum_section.dart';
import '../widgets/details_widgets/details_app_bar.dart';
import '../widgets/details_widgets/fast_track_card.dart';
import '../widgets/details_widgets/hero_banner_card.dart';
import '../widgets/details_widgets/mentor_card.dart';
import '../widgets/details_widgets/overview_section.dart';
import '../widgets/details_widgets/prerequisites_card.dart';
import 'completion_review_screen.dart';

class BootcampDetailsScreenn extends StatefulWidget {
  const BootcampDetailsScreenn({super.key, required this.viewData});

  factory BootcampDetailsScreenn.fromBootcamp(BootcampCardItem item, {Key? key}) {
    return BootcampDetailsScreenn(key: key, viewData: mapBootcamp(item));
  }

  factory BootcampDetailsScreenn.fromProgram(ProgramCardItem item, {Key? key}) {
    return BootcampDetailsScreenn(key: key, viewData: mapProgram(item));
  }

  final BootcampDetailsViewData viewData;

  static BootcampDetailsViewData mapBootcamp(BootcampCardItem item) {
    final modules = (item.modules == null || item.modules!.isEmpty)
        ? const [
            BootcampModuleItem(
              number: 1,
              title: 'Core Track Foundations',
              badgeText: 'Wk 1–3 • Active',
              description: 'Foundational architecture, tooling, and hands-on labs.',
              isActive: true,
              isInitiallyExpanded: true,
            ),
          ]
        : item.modules!;

    return BootcampDetailsViewData(
      sponsoredLabel: item.badge.toUpperCase(),
      accreditedLabel: 'ACCREDITED',
      deadlineLabel: item.deadline.toUpperCase(),
      title: item.title,
      academyName: item.academy,
      partnerLabel: item.partnerLabel ?? 'MASAR Verified Partner',
      rating: item.rating,
      alumniCount: item.alumni,
      durationStat: item.duration,
      durationSub: 'FULL TRACK',
      modeStat: item.format,
      modeSub: 'INTERACTIVE',
      seatsStat: item.seats,
      seatsSub: 'SEATS LEFT',
      startStat: item.startDate ?? 'Soon',
      startSub: 'COHORT STARTS',
      fitPercentText: item.fitPercent ?? '90%',
      syncSubtitle: 'MASAR Profile & GitHub synced',
      verifiedLevel: item.verifiedLevel ?? 'Verified Track',
      readinessProgress: item.readinessProgress ?? 0.85,
      overviewEyebrow: 'EXECUTIVE OVERVIEW',
      gradeLabel: item.gradeLabel ?? 'Program Track',
      overviewHeadline: item.overviewHeadline ?? item.title,
      overviewDescription:
          item.overviewDescription ??
          'Comprehensive track offered by ${item.academy} with guided mentorship and applied projects.',
      topics: item.topics ?? const ['Architecture', 'Best Practices', 'Hands-on Labs'],
      syllabusMeta: '${modules.length} Modules • ${item.duration}',
      modules: modules,
      mentorRatio: item.mentorRatio ?? '1:8 Ratio',
      mentorName: item.mentorName ?? 'Lead Instructor',
      mentorRole: item.mentorRole ?? item.academy,
      mentorQuote:
          item.mentorQuote ??
          '"Practical execution and clean architecture make the difference in production."',
      mentorImage: item.mentorImage ?? 'assets/images/mentor_tariq.png',
      prereqStatus: 'All Met (MASAR Validated)',
      prerequisites:
          item.prerequisites ??
          const [
            'Foundational programming & Git familiarity',
            'Consistent weekly commitment to live sessions',
          ],
      footerStatus: item.badge.toUpperCase(),
      footerClosing: item.deadline,
      tuitionText: item.tuitionText ?? 'SAR 0',
      ctaLabel: 'Apply in 1-Click',
    );
  }

  static BootcampDetailsViewData mapProgram(ProgramCardItem item) {
    final modules = (item.modules == null || item.modules!.isEmpty)
        ? const [
            BootcampModuleItem(
              number: 1,
              title: 'Program Kickoff & Core Concepts',
              badgeText: 'Wk 1–2 • Active',
              description: 'Structured weekly modules with practical assignments.',
              isActive: true,
              isInitiallyExpanded: true,
            ),
          ]
        : item.modules!;

    return BootcampDetailsViewData(
      sponsoredLabel: item.tag.toUpperCase(),
      accreditedLabel: item.category.toUpperCase(),
      deadlineLabel: item.seats.toUpperCase(),
      title: item.title,
      academyName: item.subtitle,
      partnerLabel: item.partnerLabel ?? item.instructor,
      rating: 4.8,
      alumniCount: 95,
      durationStat: item.duration,
      durationSub: 'DURATION',
      modeStat: item.format ?? 'Cohort',
      modeSub: 'FORMAT',
      seatsStat: item.seats,
      seatsSub: 'AVAILABILITY',
      startStat: item.startDate.replaceFirst('Starts: ', ''),
      startSub: 'COHORT STARTS',
      fitPercentText: item.fitPercent ?? '90%',
      syncSubtitle: 'MASAR Profile & GitHub synced',
      verifiedLevel: item.verifiedLevel ?? 'Verified Track',
      readinessProgress: item.readinessProgress ?? 0.85,
      overviewEyebrow: item.category.toUpperCase(),
      gradeLabel: item.gradeLabel ?? item.tag,
      overviewHeadline: item.overviewHeadline ?? item.title,
      overviewDescription: item.overviewDescription ?? '${item.subtitle} — ${item.instructor}.',
      topics: item.topics ?? const ['Core Skills', 'Applied Labs', 'Mentorship'],
      syllabusMeta: '${modules.length} Modules • ${item.duration}',
      modules: modules,
      mentorRatio: item.mentorRatio ?? '1:8 Ratio',
      mentorName: item.mentorName ?? item.instructor,
      mentorRole: item.mentorRole ?? item.subtitle,
      mentorQuote:
          item.mentorQuote ?? '"Focused cohort learning built around real-world deliverables."',
      mentorImage: item.mentorImage ?? 'assets/images/mentor_tariq.png',
      prereqStatus: 'All Met (MASAR Validated)',
      prerequisites:
          item.prerequisites ??
          const ['Commitment to weekly cohort milestones', 'Basic domain readiness'],
      footerStatus: item.tag.toUpperCase(),
      footerClosing: item.startDate,
      tuitionText: item.tuitionText ?? 'SAR 0',
      ctaLabel: 'Apply in 1-Click',
    );
  }

  @override
  State<BootcampDetailsScreenn> createState() => _BootcampDetailsScreenState();
}

class _BootcampDetailsScreenState extends State<BootcampDetailsScreenn> {
  bool isSaved = false;
  late List<bool> expandedModules;

  @override
  void initState() {
    super.initState();
    expandedModules = widget.viewData.modules.map((m) => m.isInitiallyExpanded).toList();
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final d = widget.viewData;

    return Scaffold(
      backgroundColor: const Color(0xFFF3F6F4),
      appBar: DetailsAppBar(
        isSaved: isSaved,
        onBack: () => Navigator.of(context).maybePop(),
        onShare: () => _showMessage('Share link copied'),
        onToggleSave: () {
          setState(() => isSaved = !isSaved);
          _showMessage(isSaved ? 'Saved to bookmarks' : 'Removed from bookmarks');
        },
        onProfileTap: () => _showMessage('MASAR Profile'),
      ),
      bottomNavigationBar: BottomApplyBar(
        statusText: d.footerStatus,
        closingText: d.footerClosing,
        tuitionText: d.tuitionText,
        ctaLabel: d.ctaLabel,
        onApplyTap: () => context.push(RouteNames.completionReview),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          children: [
            HeroBannerCard(details: d),
            const Gap(14),
            FastTrackCard(details: d),
            const Gap(18),
            OverviewSection(details: d),
            const Gap(20),
            CurriculumSection(
              details: d,
              expandedStates: expandedModules,
              onToggleModule: (index) {
                setState(() {
                  expandedModules[index] = !expandedModules[index];
                });
              },
              onSyllabusTap: () => _showMessage('Opening Syllabus'),
            ),
            const Gap(18),
            MentorCard(details: d),
            const Gap(14),
            PrerequisitesCard(details: d),
          ],
        ),
      ),
    );
  }
}
