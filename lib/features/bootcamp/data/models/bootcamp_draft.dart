/// What the "Create bootcamp" form sends to the backend when you press Publish.
class BootcampDraft {
  const BootcampDraft({
    required this.title,
    required this.description,
    required this.skills,
    required this.capacity,
    required this.track,
    required this.level,
    required this.mode,
    required this.instructor,
    required this.timezone,
    required this.startDate,
    required this.endDate,
    required this.enrollmentDeadline,
    required this.startTime,
    required this.endTime,
    required this.days,
  });

  final String title;
  final String description;
  final List<String> skills;
  final int capacity;
  final String track;
  final String level;
  final String mode;
  final String instructor;
  final String timezone;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime enrollmentDeadline;
  final String startTime; // "16:00"
  final String endTime; // "17:30"
  final List<String> days; // [Monday, Wednesday, ...]

  /// "React, Next.js,, TypeScript " -> [React, Next.js, TypeScript]
  static List<String> parseSkills(String raw) => raw
      .split(',')
      .map((s) => s.trim())
      .where((s) => s.isNotEmpty)
      .toList();

  static String _date(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  Map<String, dynamic> toJson() => {
        'title': title.trim(),
        'description': description.trim(),
        'skills': skills,
        'capacity': capacity,
        'track': track,
        'level': level,
        'mode': mode,
        'instructor': instructor,
        'timezone': timezone,
        'start_date': _date(startDate),
        'end_date': _date(endDate),
        'enrollment_deadline': _date(enrollmentDeadline),
        'start_time': startTime,
        'end_time': endTime,
        'days': days,
      };
}
