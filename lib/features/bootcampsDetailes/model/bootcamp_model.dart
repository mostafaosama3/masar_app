// lib/features/bootcamps/models/bootcamp_model.dart
enum BootcampStatus { active, upcoming, draft, completed }

class BootcampModel {
  const BootcampModel({
    required this.id,
    required this.title,
    required this.track,
    required this.mode,
    required this.dateRange,
    required this.duration,
    required this.enrolledCount,
    required this.seatsLeft,
    required this.progress,
    required this.status,
    required this.imageAsset,
  });

  final String id;
  final String title;
  final String track;
  final String mode;
  final String dateRange;
  final String duration;
  final int enrolledCount;
  final int seatsLeft;
  final double progress; // من 0.0 إلى 1.0
  final BootcampStatus status;
  final String imageAsset;

  String get statusLabel {
    switch (status) {
      case BootcampStatus.active:
        return 'Active Bootcamp';
      case BootcampStatus.upcoming:
        return 'Upcoming Bootcamp';
      case BootcampStatus.draft:
        return 'Draft';
      case BootcampStatus.completed:
        return 'Completed';
    }
  }
}
