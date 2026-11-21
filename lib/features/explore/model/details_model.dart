class BootcampModuleItem {
  const BootcampModuleItem({
    required this.number,
    required this.title,
    required this.badgeText,
    required this.description,
    this.isActive = false,
    this.isInitiallyExpanded = false,
  });

  final int number;
  final String title;
  final String badgeText;
  final String description;
  final bool isActive;
  final bool isInitiallyExpanded;
}

class BootcampDetailsViewData {
  const BootcampDetailsViewData({
    required this.sponsoredLabel,
    required this.accreditedLabel,
    required this.deadlineLabel,
    required this.title,
    required this.academyName,
    required this.partnerLabel,
    required this.rating,
    required this.alumniCount,
    required this.durationStat,
    required this.durationSub,
    required this.modeStat,
    required this.modeSub,
    required this.seatsStat,
    required this.seatsSub,
    required this.startStat,
    required this.startSub,
    required this.fitPercentText,
    required this.syncSubtitle,
    required this.verifiedLevel,
    required this.readinessProgress,
    required this.overviewEyebrow,
    required this.gradeLabel,
    required this.overviewHeadline,
    required this.overviewDescription,
    required this.topics,
    required this.syllabusMeta,
    required this.modules,
    required this.mentorRatio,
    required this.mentorName,
    required this.mentorRole,
    required this.mentorQuote,
    required this.mentorImage,
    required this.prereqStatus,
    required this.prerequisites,
    required this.footerStatus,
    required this.footerClosing,
    required this.tuitionText,
    required this.ctaLabel,
  });

  final String sponsoredLabel;
  final String accreditedLabel;
  final String deadlineLabel;
  final String title;
  final String academyName;
  final String partnerLabel;
  final double rating;
  final int alumniCount;
  final String durationStat;
  final String durationSub;
  final String modeStat;
  final String modeSub;
  final String seatsStat;
  final String seatsSub;
  final String startStat;
  final String startSub;
  final String fitPercentText;
  final String syncSubtitle;
  final String verifiedLevel;
  final double readinessProgress;
  final String overviewEyebrow;
  final String gradeLabel;
  final String overviewHeadline;
  final String overviewDescription;
  final List<String> topics;
  final String syllabusMeta;
  final List<BootcampModuleItem> modules;
  final String mentorRatio;
  final String mentorName;
  final String mentorRole;
  final String mentorQuote;
  final String mentorImage;
  final String prereqStatus;
  final List<String> prerequisites;
  final String footerStatus;
  final String footerClosing;
  final String tuitionText;
  final String ctaLabel;
}
