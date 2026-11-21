import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:masar_app/core/styles/app_colors.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/styles/text_styles.dart';

class SkillGapCard extends StatelessWidget {
  const SkillGapCard({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: SizedBox(
          width: double.infinity,
          height: 180,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // تكبير الصورة شوية عشان تغطي الحواف والهوامش اللي جوا ملف الصورة
              Transform.scale(
                scale: 1.14, // زوّدي أو قللي الرقم ده حسب حجم الصورة عندك
                child: Image.asset(AppImages.skillGap, fit: BoxFit.fill),
              ),

              // المحتوى فوق الصورة بـ padding مرتب
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'SKILL GAP EVALUATOR',
                            style: TextStyles.caption2.copyWith(
                              color: LightPalette.mint,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Gap(6),
                          Text(
                            'Not sure which track fits your career milestone?',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.subtitle.copyWith(color: LightPalette.onPrimaryColor),
                          ),
                          const Gap(6),
                          Text(
                            'Take our 3-minute executive assessment tailored to national tech initiatives.',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.caption1.copyWith(color: LightPalette.mint),
                          ),
                          const Gap(20),
                        ],
                      ),
                    ),
                    const Gap(14),
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.white24,
                      child: Icon(
                        Icons.psychology_alt_outlined,
                        color: LightPalette.onPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
