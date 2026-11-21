import 'package:masar_app/features/my_learning/data/models/learning_overview.dart';
import 'package:masar_app/features/my_learning/data/repositories/my_learning_repository.dart';

/// Fake data (the same values that used to be hard-coded in the UI).
class MockMyLearningRepository implements MyLearningRepository {
  @override
  Future<LearningOverview> getOverview() async {
    await Future<void>.delayed(const Duration(milliseconds: 800));

    final now = DateTime.now();

    return LearningOverview(
      program: const ProgramInfo(
        name: 'Flutter & Dart Mastery',
        provider: 'Taqniya Labs',
        track: 'Executive Track',
        cohort: 'Cohort W-24',
      ),
      mastery: const MasteryStats(
        progressPercent: 68,
        gradePercent: 96,
        gradeLetter: 'A+',
        daysAttended: 28,
        totalDays: 40,
        tasksGraded: 12,
        cohortTopPercent: 5,
      ),
      nextLab: UpcomingLab(
        title: 'Implementing HydratedBloc State Persistence',
        sessionNumber: 19,
        lead: 'Eng. Tariq Mansour',
        startsAt: DateTime(now.year, now.month, now.day, 19),
      ),
      currentPhase: 2,
      totalPhases: 4,
      modules: const [
        LearningModule(
          number: 'MODULE 01',
          title: 'Dart Deep Dive & OOP Mastery',
          detail:
              'Null-safety, asynchronous streams, mixins, and scalable architecture fundamentals.',
          status: '100% Passed',
          state: ModuleState.done,
        ),
        LearningModule(
          number: 'MODULE 02',
          title: 'Flutter Widgets & Adaptive UI',
          detail:
              'RenderObject lifecycles, CustomPainters, and fluid cross-device responsive views.',
          status: '100% Passed',
          state: ModuleState.done,
        ),
        LearningModule(
          number: 'MODULE 03 • CURRENT FOCUS',
          title: 'State Management (Bloc & Riverpod)',
          detail: '3.1 Event-Driven Bloc Architecture  •  Done\n'
              '3.2 HydratedBloc & Cache  •  Today\n'
              '3.3 Bloc Unit & Mock Testing  •  Nov 18',
          status: '75% Complete',
          state: ModuleState.current,
        ),
        LearningModule(
          number: 'MODULE 04',
          title: 'RESTful APIs, WebSockets & Offline Sync',
          detail:
              'Dio interceptors, drift SQLite database integration, and resilient offline synchronization.',
          status: 'Unlocks Nov 20',
          state: ModuleState.locked,
        ),
        LearningModule(
          number: 'CAPSTONE GRADUATION',
          title: 'Production SaaS Multiplatform App',
          detail:
              'Full-fledged enterprise app submission, live defense panel with industry architects.',
          status: 'Dec 15',
          state: ModuleState.locked,
        ),
      ],
      tools: const [
        ToolLink(key: 'discord', title: 'Discord Hub', subtitle: '14 Online'),
        ToolLink(key: 'repo', title: 'Classroom Repo', subtitle: 'Branch: v3.2'),
        ToolLink(key: 'figma', title: 'Figma UI Kit', subtitle: 'v4.0 UI spec'),
        ToolLink(key: 'vault', title: 'Vault Archives', subtitle: '24 Decks & Recs'),
      ],
      mentorship: const Mentorship(nextSlotLabel: 'Tomorrow at 10 AM'),
    );
  }
}
