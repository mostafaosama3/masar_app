import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:masar_app/core/styles/app_colors.dart';
import 'package:masar_app/core/widgets/eyebrow.dart';
import 'package:masar_app/core/widgets/mint_progress.dart';
import 'package:masar_app/features/my_learning/presentation/widgets/my_learning_components.dart';

class ActiveProgramCard extends StatelessWidget {
  const ActiveProgramCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MyLearningCard(
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: LightPalette.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.terminal,
              color: Colors.white,
            ),
          ),
          const Gap(12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Flutter & Dart Mastery',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Taqniya Labs • Executive Track',
                  style: TextStyle(
                    fontSize: 10,
                    color: LightPalette.greyColor,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.unfold_more,
            color: LightPalette.greyColor,
          ),
        ],
      ),
    );
  }
}

class MasteryCard extends StatelessWidget {
  const MasteryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: LightPalette.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '68%',
                style: TextStyle(
                  fontSize: 34,
                  height: 1,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFFC4E9DE),
                ),
              ),
              Gap(8),
              Padding(
                padding: EdgeInsets.only(bottom: 3),
                child: Text(
                  'Overall Mastery',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 11,
                  ),
                ),
              ),
              Spacer(),
              MyLearningPill('Grade: 96% (A+)'),
            ],
          ),
          Gap(12),
          MintProgress(value: .68),
          Gap(14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyLearningMetric('28/40', 'Days Attended'),
              MyLearningMetric('12', 'Tasks Graded'),
              MyLearningMetric('Top 5%', 'Cohort Rank'),
            ],
          ),
        ],
      ),
    );
  }
}

class NextLabCard extends StatelessWidget {
  const NextLabCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MyLearningCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.circle,
                size: 8,
                color: LightPalette.redColor,
              ),
              Gap(6),
              Eyebrow('NEXT UPCOMING LAB'),
              Spacer(),
              Text(
                'Tonight, 7:00 PM',
                style: TextStyle(
                  fontSize: 10,
                  color: LightPalette.greyColor,
                ),
              ),
            ],
          ),
          const Gap(8),
          const Text(
            'Implementing HydratedBloc State Persistence',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
            ),
          ),
          const Gap(4),
          const Text(
            'Session 19 • Lead: Eng. Tariq Mansour',
            style: TextStyle(
              fontSize: 10,
              color: LightPalette.greyColor,
            ),
          ),
          const Gap(12),
          Row(
            children: [
              Expanded(
                child: FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.video_call_outlined,
                    size: 17,
                  ),
                  label: const Text(
                    'Join Classroom',
                    style: TextStyle(fontSize: 11),
                  ),
                ),
              ),
              const Gap(8),
              IconButton.filled(
                onPressed: () {},
                style: IconButton.styleFrom(
                  backgroundColor: LightPalette.background,
                ),
                icon: const Icon(
                  Icons.folder_open,
                  size: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
