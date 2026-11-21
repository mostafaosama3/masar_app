
import 'details_model.dart';

class BootcampCardItem {
  final String title;
  final String academy;
  final String deadline;
  final String badge;
  final String duration;
  final String format;
  final String seats;
  final double rating;
  final int alumni;

  // تفاصيل إضافية اختيارية لصفحة BootcampDetailsScreen
  final String? partnerLabel;
  final String? startDate;
  final String? fitPercent;
  final String? verifiedLevel;
  final double? readinessProgress;
  final String? gradeLabel;
  final String? overviewHeadline;
  final String? overviewDescription;
  final List<String>? topics;
  final List<BootcampModuleItem>? modules;
  final String? mentorName;
  final String? mentorRole;
  final String? mentorQuote;
  final String? mentorImage;
  final String? mentorRatio;
  final List<String>? prerequisites;
  final String? tuitionText;

  const BootcampCardItem({
    required this.title,
    required this.academy,
    required this.deadline,
    required this.badge,
    required this.duration,
    required this.format,
    required this.seats,
    required this.rating,
    required this.alumni,
    this.partnerLabel,
    this.startDate,
    this.fitPercent,
    this.verifiedLevel,
    this.readinessProgress,
    this.gradeLabel,
    this.overviewHeadline,
    this.overviewDescription,
    this.topics,
    this.modules,
    this.mentorName,
    this.mentorRole,
    this.mentorQuote,
    this.mentorImage,
    this.mentorRatio,
    this.prerequisites,
    this.tuitionText,
  });
}

class AcademyCardItem {
  final String name;
  final double rating;
  final int tracks;
  bool isFollowing;

  AcademyCardItem({
    required this.name,
    required this.rating,
    required this.tracks,
    this.isFollowing = false,
  });
}

class ProgramCardItem {
  final String category;
  final String title;
  final String subtitle;
  final String instructor;
  final String startDate;
  final String duration;
  final String seats;
  final String tag;
  bool isSaved;

  // تفاصيل إضافية اختيارية لصفحة BootcampDetailsScreen
  final String? partnerLabel;
  final String? format;
  final String? fitPercent;
  final String? verifiedLevel;
  final double? readinessProgress;
  final String? gradeLabel;
  final String? overviewHeadline;
  final String? overviewDescription;
  final List<String>? topics;
  final List<BootcampModuleItem>? modules;
  final String? mentorName;
  final String? mentorRole;
  final String? mentorQuote;
  final String? mentorImage;
  final String? mentorRatio;
  final List<String>? prerequisites;
  final String? tuitionText;

  ProgramCardItem({
    required this.category,
    required this.title,
    required this.subtitle,
    required this.instructor,
    required this.startDate,
    required this.duration,
    required this.seats,
    required this.tag,
    this.isSaved = false,
    this.partnerLabel,
    this.format,
    this.fitPercent,
    this.verifiedLevel,
    this.readinessProgress,
    this.gradeLabel,
    this.overviewHeadline,
    this.overviewDescription,
    this.topics,
    this.modules,
    this.mentorName,
    this.mentorRole,
    this.mentorQuote,
    this.mentorImage,
    this.mentorRatio,
    this.prerequisites,
    this.tuitionText,
  });
}
