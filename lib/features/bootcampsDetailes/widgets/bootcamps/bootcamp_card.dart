// lib/features/bootcamps/widgets/bootcamp_card.dart
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:masar_app/core/functions/extensions.dart';
import 'package:masar_app/core/styles/app_colors.dart';
import 'package:masar_app/core/styles/text_styles.dart';

import '../../../../core/routes/navigation.dart';
import '../../../../core/routes/routes_name.dart';
import '../../model/bootcamp_model.dart';
import '../../views/details_screen.dart';

class BootcampCard extends StatelessWidget {
  const BootcampCard({
    super.key,
    required this.bootcamp,
    required this.onManageTap,
    required this.onDetailsTap,
  });

  final BootcampModel bootcamp;
  final VoidCallback onManageTap;
  final VoidCallback onDetailsTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final progressPercent = (bootcamp.progress * 100).round();

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => BootcampDetailsScreen(bootcamp: bootcamp)),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top row: Status pill + Enrolled pill + Menu
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: LightPalette.primaryColor100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.circle, size: 7, color: colors.onSurface),
                        const Gap(6),
                        Text(
                          bootcamp.statusLabel,
                          style: TextStyles.caption1.copyWith(
                            color: colors.onSurface,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: LightPalette.primaryColor100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.group_outlined, size: 14, color: colors.onSurface),
                        const Gap(4),
                        Text(
                          '${bootcamp.enrolledCount} Enrolled',
                          style: TextStyles.caption1.copyWith(
                            color: colors.onSurface,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(4),
                  const Icon(Icons.more_horiz, color: LightPalette.greyColor),
                ],
              ),
              const Gap(12),
              // Middle row: Thumbnail + Info + Vertical Divider + Seats left
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'bootcamp-image-${bootcamp.id ?? bootcamp.title}',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.asset(
                          bootcamp.imageAsset,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) =>
                              const Icon(Icons.code, color: LightPalette.primaryColor, size: 30),
                        ),
                      ),
                    ),
                  ),
                  Gap(5),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bootcamp.title,
                          style: TextStyles.body2.copyWith(fontWeight: FontWeight.w700),
                        ),
                        const Gap(6),
                        Row(
                          children: [
                            Icon(Icons.local_offer_outlined, size: 12),
                            Text(
                              ' ${bootcamp.track}  |  ',
                              style: TextStyles.caption2.copyWith(color: LightPalette.primaryColor),
                            ),
                            Icon(Icons.laptop_mac_outlined, size: 12),
                            Text(
                              ' ${bootcamp.mode}',
                              style: TextStyles.caption2.copyWith(color: LightPalette.primaryColor),
                            ),
                          ],
                        ),
                        const Gap(8),
                        Row(
                          children: [
                            Icon(Icons.calendar_today_outlined, size: 10),
                            Text(
                              ' ${bootcamp.dateRange}  • ',
                              style: TextStyles.caption2.copyWith(color: LightPalette.primaryColor),
                            ),
                            Icon(Icons.access_time_outlined, size: 10),
                            Text(
                              '  ${bootcamp.duration}',
                              style: TextStyles.caption2.copyWith(color: LightPalette.primaryColor),
                            ),
                          ],
                        ),
                        const Gap(8),
                        Row(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: LinearProgressIndicator(
                                  value: bootcamp.progress,
                                  minHeight: 6,
                                  backgroundColor: LightPalette.primaryColor100,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    LightPalette.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                            const Gap(10),
                            Text(
                              '$progressPercent%',
                              style: TextStyles.caption1.copyWith(
                                fontWeight: FontWeight.w700,
                                color: LightPalette.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Gap(5),
                  SizedBox(
                    height: 70,
                    child: VerticalDivider(width: 1, thickness: 1, color: Colors.black12),
                  ),
                  const Gap(10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${bootcamp.seatsLeft}',
                        style: TextStyles.title2.copyWith(color: LightPalette.primaryColor),
                      ),
                      Text(
                        'Seats Left',
                        style: TextStyles.caption2.copyWith(color: LightPalette.primaryColor),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
