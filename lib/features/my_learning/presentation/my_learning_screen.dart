import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:masar_app/core/styles/app_colors.dart';
import 'package:masar_app/core/widgets/eyebrow.dart';
import 'package:masar_app/core/widgets/screen_header.dart';
import 'package:masar_app/features/my_learning/presentation/widgets/module_card.dart';
import 'package:masar_app/features/my_learning/presentation/widgets/my_learning_cards.dart';
import 'package:masar_app/features/my_learning/presentation/widgets/my_learning_components.dart';

const _greyText = TextStyle(fontSize: 10, color: LightPalette.greyColor);
const _sectionTitle = TextStyle(fontSize: 18, fontWeight: FontWeight.w800);

class MyLearningScreen extends StatelessWidget {
  const MyLearningScreen({super.key, required this.onCreateBootcamp});

  final VoidCallback onCreateBootcamp;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      children: [
        const ScreenHeader(title: 'My Learning'),
        const Gap(20),

        const Row(
          children: [
            Eyebrow('ACTIVE PROGRAM'),
            Spacer(),
            MyLearningPill('Cohort W-24'),
          ],
        ),

        const Gap(9),
        const ActiveProgramCard(),

        const Gap(16),
        const MasteryCard(),

        const Gap(16),

        const Wrap(
          spacing: 7,
          runSpacing: 7,
          children: [
            MyLearningChip('Roadmap & Modules', selected: true),
            MyLearningChip('Live Sessions'),
            MyLearningChip('Tasks & Deadlines'),
          ],
        ),

        const Gap(16),
        const NextLabCard(),

        const Gap(22),

        const Row(
          children: [
            Expanded(
              child: Text('Curriculum Path', style: _sectionTitle),
            ),
            MyLearningPill('Phase 2 of 4'),
          ],
        ),

        const Text(
          'Track your progressive competency nodes',
          style: _greyText,
        ),

        const Gap(12),

        const MyLearningModuleCard(
          number: 'MODULE 01',
          title: 'Dart Deep Dive & OOP Mastery',
          detail:
              'Null-safety, asynchronous streams, mixins, and scalable architecture fundamentals.',
          status: '100% Passed',
          state: ModuleState.done,
        ),

        const MyLearningModuleCard(
          number: 'MODULE 02',
          title: 'Flutter Widgets & Adaptive UI',
          detail:
              'RenderObject lifecycles, CustomPainters, and fluid cross-device responsive views.',
          status: '100% Passed',
          state: ModuleState.done,
        ),

        const MyLearningModuleCard(
          number: 'MODULE 03 • CURRENT FOCUS',
          title: 'State Management (Bloc & Riverpod)',
          detail:
              '3.1 Event-Driven Bloc Architecture  •  Done\n'
              '3.2 HydratedBloc & Cache  •  Today\n'
              '3.3 Bloc Unit & Mock Testing  •  Nov 18',
          status: '75% Complete',
          state: ModuleState.current,
        ),

        const MyLearningModuleCard(
          number: 'MODULE 04',
          title: 'RESTful APIs, WebSockets & Offline Sync',
          detail:
              'Dio interceptors, drift SQLite database integration, and resilient offline synchronization.',
          status: 'Unlocks Nov 20',
          state: ModuleState.locked,
        ),

        const MyLearningModuleCard(
          number: 'CAPSTONE GRADUATION',
          title: 'Production SaaS Multiplatform App',
          detail:
              'Full-fledged enterprise app submission, live defense panel with industry architects.',
          status: 'Dec 15',
          state: ModuleState.locked,
        ),

        const Gap(18),

        const Text('Executive Toolbelt', style: _sectionTitle),

        const Gap(10),

        const Row(
          children: [
            Expanded(
              child: MyLearningToolCard(
                Icons.forum_outlined,
                'Discord Hub',
                '14 Online',
              ),
            ),
            Gap(9),
            Expanded(
              child: MyLearningToolCard(
                Icons.code,
                'Classroom Repo',
                'Branch: v3.2',
              ),
            ),
          ],
        ),

        const Gap(9),

        const Row(
          children: [
            Expanded(
              child: MyLearningToolCard(
                Icons.design_services_outlined,
                'Figma UI Kit',
                'v4.0 UI spec',
              ),
            ),
            Gap(9),
            Expanded(
              child: MyLearningToolCard(
                Icons.video_library_outlined,
                'Vault Archives',
                '24 Decks & Recs',
              ),
            ),
          ],
        ),

        const Gap(14),

        MyLearningCard(
          child: Row(
            children: [
              const CircleAvatar(
                backgroundColor: LightPalette.mint,
                child: Icon(
                  Icons.support_agent,
                  color: LightPalette.secondaryColor,
                ),
              ),
              const Gap(10),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '1-on-1 Mentorship',
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                    Text(
                      'Next slot open Tomorrow at 10 AM',
                      style: _greyText,
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Book Slot'),
              ),
            ],
          ),
        ),

        const Gap(10),

        OutlinedButton.icon(
          onPressed: onCreateBootcamp,
          icon: const Icon(Icons.add),
          label: const Text('Create a Bootcamp'),
        ),
      ],
    );
  }
}
