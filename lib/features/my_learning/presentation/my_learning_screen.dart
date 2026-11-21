import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:masar_app/core/styles/app_colors.dart';
import 'package:masar_app/core/widgets/eyebrow.dart';
import 'package:masar_app/core/widgets/screen_header.dart';
import 'package:masar_app/features/my_learning/data/models/learning_overview.dart';
import 'package:masar_app/features/my_learning/presentation/cubit/my_learning_cubit.dart';
import 'package:masar_app/features/my_learning/presentation/widgets/module_card.dart';
import 'package:masar_app/features/my_learning/presentation/widgets/my_learning_cards.dart';
import 'package:masar_app/features/my_learning/presentation/widgets/my_learning_components.dart';

const _greyText = TextStyle(fontSize: 10, color: LightPalette.greyColor);
const _sectionTitle = TextStyle(fontSize: 18, fontWeight: FontWeight.w800);
const _listPadding = EdgeInsets.fromLTRB(16, 8, 16, 24);

class MyLearningScreen extends StatelessWidget {
  const MyLearningScreen({super.key, required this.onCreateBootcamp});

  final VoidCallback onCreateBootcamp;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyLearningCubit, MyLearningState>(
      builder: (context, state) => switch (state) {
        MyLearningInitial() || MyLearningLoading() => ListView(
            padding: _listPadding,
            children: const [
              ScreenHeader(title: 'My Learning'),
              Gap(120),
              Center(child: CircularProgressIndicator()),
            ],
          ),
        MyLearningFailure(:final message) => ListView(
            padding: _listPadding,
            children: [
              const ScreenHeader(title: 'My Learning'),
              const Gap(100),
              Center(child: Text(message)),
              const Gap(12),
              Center(
                child: OutlinedButton.icon(
                  onPressed: () => context.read<MyLearningCubit>().load(),
                  icon: const Icon(Icons.refresh),
                  label: const Text('Try again'),
                ),
              ),
            ],
          ),
        MyLearningLoaded(:final overview) => RefreshIndicator(
            onRefresh: () => context.read<MyLearningCubit>().load(refresh: true),
            child: _MyLearningContent(
              overview: overview,
              onCreateBootcamp: onCreateBootcamp,
            ),
          ),
      },
    );
  }
}

class _MyLearningContent extends StatelessWidget {
  const _MyLearningContent({
    required this.overview,
    required this.onCreateBootcamp,
  });

  final LearningOverview overview;
  final VoidCallback onCreateBootcamp;

  static IconData _toolIcon(String key) => switch (key) {
        'discord' => Icons.forum_outlined,
        'repo' => Icons.code,
        'figma' => Icons.design_services_outlined,
        'vault' => Icons.video_library_outlined,
        _ => Icons.link,
      };

  /// Lays the tools out two per row, like the design.
  List<Widget> _toolRows() {
    final rows = <Widget>[];
    for (var i = 0; i < overview.tools.length; i += 2) {
      final pair = overview.tools.skip(i).take(2).toList();
      if (i > 0) rows.add(const Gap(9));
      rows.add(
        Row(
          children: [
            for (var j = 0; j < 2; j++) ...[
              if (j == 1) const Gap(9),
              Expanded(
                child: j < pair.length
                    ? MyLearningToolCard(
                        _toolIcon(pair[j].key),
                        pair[j].title,
                        pair[j].subtitle,
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ],
        ),
      );
    }
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    final lab = overview.nextLab;

    return ListView(
      // Needed so pull-to-refresh works even when the content is short.
      physics: const AlwaysScrollableScrollPhysics(),
      padding: _listPadding,
      children: [
        const ScreenHeader(title: 'My Learning'),
        const Gap(20),

        Row(
          children: [
            const Eyebrow('ACTIVE PROGRAM'),
            const Spacer(),
            MyLearningPill(overview.program.cohort),
          ],
        ),

        const Gap(9),
        ActiveProgramCard(program: overview.program),

        const Gap(16),
        MasteryCard(mastery: overview.mastery),

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

        if (lab != null) ...[
          const Gap(16),
          NextLabCard(lab: lab),
        ],

        const Gap(22),

        Row(
          children: [
            const Expanded(
              child: Text('Curriculum Path', style: _sectionTitle),
            ),
            MyLearningPill(
              'Phase ${overview.currentPhase} of ${overview.totalPhases}',
            ),
          ],
        ),

        const Text(
          'Track your progressive competency nodes',
          style: _greyText,
        ),

        const Gap(12),

        for (final module in overview.modules)
          MyLearningModuleCard(
            number: module.number,
            title: module.title,
            detail: module.detail,
            status: module.status,
            state: module.state,
          ),

        const Gap(18),

        const Text('Executive Toolbelt', style: _sectionTitle),

        const Gap(10),

        ..._toolRows(),

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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '1-on-1 Mentorship',
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                    Text(
                      'Next slot open ${overview.mentorship.nextSlotLabel}',
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
