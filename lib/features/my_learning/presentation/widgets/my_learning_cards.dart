import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:masar_app/core/styles/app_colors.dart';
import 'package:masar_app/core/widgets/eyebrow.dart';
import 'package:masar_app/core/widgets/mint_progress.dart';
import 'package:masar_app/features/my_learning/data/models/learning_overview.dart';
import 'package:masar_app/features/my_learning/presentation/widgets/my_learning_components.dart';

class ActiveProgramCard extends StatelessWidget {
  const ActiveProgramCard({super.key, required this.program});

  final ProgramInfo program;

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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  program.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 14,
                  ),
                ),
                Text(
                  '${program.provider} • ${program.track}',
                  style: const TextStyle(
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
  const MasteryCard({super.key, required this.mastery});

  final MasteryStats mastery;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: LightPalette.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${mastery.progressPercent}%',
                style: const TextStyle(
                  fontSize: 34,
                  height: 1,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFFC4E9DE),
                ),
              ),
              const Gap(8),
              const Padding(
                padding: EdgeInsets.only(bottom: 3),
                child: Text(
                  'Overall Mastery',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 11,
                  ),
                ),
              ),
              const Spacer(),
              MyLearningPill(
                'Grade: ${mastery.gradePercent}% (${mastery.gradeLetter})',
              ),
            ],
          ),
          const Gap(12),
          MintProgress(value: mastery.progress),
          const Gap(14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyLearningMetric(
                '${mastery.daysAttended}/${mastery.totalDays}',
                'Days Attended',
              ),
              MyLearningMetric('${mastery.tasksGraded}', 'Tasks Graded'),
              MyLearningMetric('Top ${mastery.cohortTopPercent}%', 'Cohort Rank'),
            ],
          ),
        ],
      ),
    );
  }
}

class NextLabCard extends StatelessWidget {
  const NextLabCard({super.key, required this.lab});

  final UpcomingLab lab;

  static String _time(DateTime d) {
    final hour = d.hour % 12 == 0 ? 12 : d.hour % 12;
    final minute = d.minute.toString().padLeft(2, '0');
    return '$hour:$minute ${d.hour >= 12 ? 'PM' : 'AM'}';
  }

  static const _months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ];

  static String _when(DateTime d) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final day = DateTime(d.year, d.month, d.day);
    final diff = day.difference(today).inDays;

    if (diff == 0) return '${d.hour >= 17 ? 'Tonight' : 'Today'}, ${_time(d)}';
    if (diff == 1) return 'Tomorrow, ${_time(d)}';
    return '${_months[d.month - 1]} ${d.day}, ${_time(d)}';
  }

  @override
  Widget build(BuildContext context) {
    return MyLearningCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.circle,
                size: 8,
                color: LightPalette.redColor,
              ),
              const Gap(6),
              const Eyebrow('NEXT UPCOMING LAB'),
              const Spacer(),
              Text(
                _when(lab.startsAt),
                style: const TextStyle(
                  fontSize: 10,
                  color: LightPalette.greyColor,
                ),
              ),
            ],
          ),
          const Gap(8),
          Text(
            lab.title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
            ),
          ),
          const Gap(4),
          Text(
            'Session ${lab.sessionNumber} • Lead: ${lab.lead}',
            style: const TextStyle(
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
