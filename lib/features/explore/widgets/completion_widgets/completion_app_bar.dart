import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/text_styles.dart';

class CompletionAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CompletionAppBar({super.key, required this.onBack, required this.progress});

  final VoidCallback onBack;
  final double progress;

  @override
  Size get preferredSize => const Size.fromHeight(74);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            scrolledUnderElevation: 0,
            leading: IconButton(
              onPressed: onBack,
              icon: const Icon(Icons.arrow_back, color: LightPalette.primaryColor),
            ),
            titleSpacing: 0,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Completion & Review',
                  style: TextStyles.subtitle.copyWith(
                    fontWeight: FontWeight.w700,
                    color: LightPalette.primaryColor,
                  ),
                ),
                Gap(2),
                Text(
                  'Step 3 of 3 • Final Step',
                  style: TextStyles.caption1.copyWith(
                    fontWeight: FontWeight.w500,
                    color: LightPalette.greyColor,
                  ),
                ),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 14),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: LightPalette.mintTint,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.workspace_premium_outlined,
                          size: 14,
                          color: LightPalette.secondaryColor,
                        ),
                        Gap(4),
                        Text(
                          'Verified',
                          style: TextStyles.caption1.copyWith(
                            fontWeight: FontWeight.w700,
                            color: LightPalette.secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 3.5,
                backgroundColor: LightPalette.onPrimaryColor,
                valueColor: AlwaysStoppedAnimation<Color>(LightPalette.secondaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
