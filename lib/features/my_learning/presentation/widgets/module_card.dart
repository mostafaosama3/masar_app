import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:masar_app/core/styles/app_colors.dart';
import 'package:masar_app/core/widgets/eyebrow.dart';
import 'package:masar_app/features/my_learning/data/models/learning_overview.dart';
import 'package:masar_app/features/my_learning/presentation/widgets/my_learning_components.dart';

class MyLearningModuleCard extends StatelessWidget {
  const MyLearningModuleCard({
    super.key,
    required this.number,
    required this.title,
    required this.detail,
    required this.status,
    required this.state,
  });

  final String number;
  final String title;
  final String detail;
  final String status;
  final ModuleState state;

  @override
  Widget build(BuildContext context) {
    final (background, foreground, icon) = switch (state) {
      ModuleState.done => (
          LightPalette.secondaryColor,
          Colors.white,
          Icons.check,
        ),
      ModuleState.current => (
          LightPalette.mint,
          LightPalette.secondaryColor,
          Icons.radio_button_checked,
        ),
      ModuleState.locked => (
          LightPalette.mutedBg,
          LightPalette.greyColor,
          Icons.lock_outline,
        ),
    };

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              right: 10,
            ),
            child: CircleAvatar(
              radius: 13,
              backgroundColor: background,
              child: Icon(
                icon,
                size: 15,
                color: foreground,
              ),
            ),
          ),
          Expanded(
            child: MyLearningCard(
              child: Opacity(
                opacity: state == ModuleState.locked ? .58 : 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Eyebrow(number),
                        ),
                        Text(
                          status,
                          style: const TextStyle(
                            fontSize: 9,
                            color: LightPalette.secondaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const Gap(5),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Gap(5),
                    Text(
                      detail,
                      style: const TextStyle(
                        fontSize: 10,
                        height: 1.5,
                        color: LightPalette.greyColor,
                      ),
                    ),
                    if (state == ModuleState.current)
                      const Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text(
                          'Launch Interactive Sandbox →',
                          style: TextStyle(
                            fontSize: 10,
                            color: LightPalette.secondaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
