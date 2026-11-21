// lib/features/bootcamps/widgets/bootcamp_header.dart
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:masar_app/core/constants/app_images.dart';
import 'package:masar_app/core/functions/extensions.dart';
import 'package:masar_app/core/styles/app_colors.dart';
import 'package:masar_app/core/styles/text_styles.dart';

class BootcampHeader extends StatelessWidget {
  const BootcampHeader({super.key, required this.liveCount, required this.onAddTap});

  final int liveCount;
  final VoidCallback onAddTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top bar: Academy info + Notification + Avatar
        Row(
          children: [
            Image.asset(AppImages.techAcademyMark, height: 70, width: 70),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Tech Academy', style: TextStyles.subtitle),
                      const Gap(4),
                      Icon(Icons.verified, size: 16, color: colors.secondary),
                    ],
                  ),
                  const Gap(2),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: LightPalette.primaryColor100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Image.asset(AppImages.cloud, width: 10, height: 10),
                            Gap(6),
                            Text(
                              'Admin',
                              style: TextStyles.caption2.copyWith(
                                color: LightPalette.greyColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(6),
                      Text(
                        '• MASAR Enterprise',
                        style: TextStyles.caption2.copyWith(color: LightPalette.greyColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none_rounded)),
                Positioned(
                  top: 6,
                  right: 6,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: LightPalette.redColor,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '3',
                      style: TextStyles.caption2.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Gap(6),
            const CircleAvatar(
              radius: 20,
              backgroundColor: LightPalette.primaryColor100,
              child: Icon(Icons.business, size: 20, color: LightPalette.primaryColor),
            ),
          ],
        ),
        const Gap(18),
        // Live counter + Title + Add button
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                        decoration: BoxDecoration(
                          color: LightPalette.primaryColor100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(Icons.circle, size: 8, color: LightPalette.primaryColor),
                      ),
                      const Gap(3),
                      Text(
                        '$liveCount LIVE BOOTCAMPS',
                        style: TextStyles.caption1.copyWith(
                          color: colors.secondary,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),

                  Text('Training Bootcamps', style: TextStyles.headline2),

                  Text(
                    'Manage and monitor all your bootcamps, track performance and applications.',
                    style: TextStyles.body2.copyWith(color: LightPalette.greyColor),
                  ),
                ],
              ),
            ),
            const Gap(12),
            InkWell(
              onTap: onAddTap,
              borderRadius: BorderRadius.circular(14),
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: LightPalette.primaryColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
