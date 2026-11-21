/// Everything the My Learning screen needs, returned by ONE call.
/// Each model has a `fromJson` so the real backend can be plugged in later
/// without touching the UI.
class LearningOverview {
  const LearningOverview({
    required this.program,
    required this.mastery,
    required this.nextLab,
    required this.currentPhase,
    required this.totalPhases,
    required this.modules,
    required this.tools,
    required this.mentorship,
  });

  final ProgramInfo program;
  final MasteryStats mastery;
  final UpcomingLab? nextLab;
  final int currentPhase;
  final int totalPhases;
  final List<LearningModule> modules;
  final List<ToolLink> tools;
  final Mentorship mentorship;

  factory LearningOverview.fromJson(Map<String, dynamic> json) => LearningOverview(
        program: ProgramInfo.fromJson(json['program'] as Map<String, dynamic>),
        mastery: MasteryStats.fromJson(json['mastery'] as Map<String, dynamic>),
        nextLab: json['next_lab'] == null
            ? null
            : UpcomingLab.fromJson(json['next_lab'] as Map<String, dynamic>),
        currentPhase: json['current_phase'] as int,
        totalPhases: json['total_phases'] as int,
        modules: (json['modules'] as List)
            .map((e) => LearningModule.fromJson(e as Map<String, dynamic>))
            .toList(),
        tools: (json['tools'] as List)
            .map((e) => ToolLink.fromJson(e as Map<String, dynamic>))
            .toList(),
        mentorship: Mentorship.fromJson(json['mentorship'] as Map<String, dynamic>),
      );
}

class ProgramInfo {
  const ProgramInfo({
    required this.name,
    required this.provider,
    required this.track,
    required this.cohort,
  });

  final String name; // Flutter & Dart Mastery
  final String provider; // Taqniya Labs
  final String track; // Executive Track
  final String cohort; // Cohort W-24

  factory ProgramInfo.fromJson(Map<String, dynamic> json) => ProgramInfo(
        name: json['name'] as String,
        provider: json['provider'] as String,
        track: json['track'] as String,
        cohort: json['cohort'] as String,
      );
}

class MasteryStats {
  const MasteryStats({
    required this.progressPercent,
    required this.gradePercent,
    required this.gradeLetter,
    required this.daysAttended,
    required this.totalDays,
    required this.tasksGraded,
    required this.cohortTopPercent,
  });

  final int progressPercent; // 68
  final int gradePercent; // 96
  final String gradeLetter; // A+
  final int daysAttended; // 28
  final int totalDays; // 40
  final int tasksGraded; // 12
  final int cohortTopPercent; // 5  -> "Top 5%"

  double get progress => (progressPercent / 100).clamp(0.0, 1.0);

  factory MasteryStats.fromJson(Map<String, dynamic> json) => MasteryStats(
        progressPercent: json['progress_percent'] as int,
        gradePercent: json['grade_percent'] as int,
        gradeLetter: json['grade_letter'] as String,
        daysAttended: json['days_attended'] as int,
        totalDays: json['total_days'] as int,
        tasksGraded: json['tasks_graded'] as int,
        cohortTopPercent: json['cohort_top_percent'] as int,
      );
}

class UpcomingLab {
  const UpcomingLab({
    required this.title,
    required this.sessionNumber,
    required this.lead,
    required this.startsAt,
  });

  final String title;
  final int sessionNumber;
  final String lead; // Eng. Tariq Mansour
  final DateTime startsAt;

  factory UpcomingLab.fromJson(Map<String, dynamic> json) => UpcomingLab(
        title: json['title'] as String,
        sessionNumber: json['session_number'] as int,
        lead: json['lead'] as String,
        startsAt: DateTime.parse(json['starts_at'] as String).toLocal(),
      );
}

enum ModuleState {
  done,
  current,
  locked;

  static ModuleState parse(String? value) => ModuleState.values.firstWhere(
        (e) => e.name == value,
        orElse: () => ModuleState.locked,
      );
}

class LearningModule {
  const LearningModule({
    required this.number,
    required this.title,
    required this.detail,
    required this.status,
    required this.state,
  });

  final String number; // MODULE 01
  final String title;
  final String detail;
  final String status; // 100% Passed
  final ModuleState state;

  factory LearningModule.fromJson(Map<String, dynamic> json) => LearningModule(
        number: json['number'] as String,
        title: json['title'] as String,
        detail: json['detail'] as String,
        status: json['status'] as String,
        state: ModuleState.parse(json['state'] as String?),
      );
}

class ToolLink {
  const ToolLink({
    required this.key,
    required this.title,
    required this.subtitle,
    this.url,
  });

  /// discord | repo | figma | vault  (the UI maps this to an icon)
  final String key;
  final String title;
  final String subtitle;
  final String? url;

  factory ToolLink.fromJson(Map<String, dynamic> json) => ToolLink(
        key: json['key'] as String,
        title: json['title'] as String,
        subtitle: json['subtitle'] as String,
        url: json['url'] as String?,
      );
}

class Mentorship {
  const Mentorship({required this.nextSlotLabel});

  final String nextSlotLabel; // Tomorrow at 10 AM

  factory Mentorship.fromJson(Map<String, dynamic> json) =>
      Mentorship(nextSlotLabel: json['next_slot_label'] as String);
}
