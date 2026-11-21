// lib/features/bootcamps/widgets/bootcamp_details_header.dart
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:masar_app/core/functions/extensions.dart';
import 'package:masar_app/core/styles/app_colors.dart';
import 'package:masar_app/core/styles/text_styles.dart';

import '../../model/bootcamp_model.dart';

class BootcampDetailsHeader extends StatelessWidget {
  const BootcampDetailsHeader({super.key, required this.bootcamp});

  final BootcampModel bootcamp;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final topPadding = MediaQuery.paddingOf(context).top;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        Padding(
          padding: EdgeInsets.fromLTRB(16, topPadding + 10, 16, 0),
          child: Stack(
            children: [
              Hero(
                tag: 'bootcamp-image-${bootcamp.id ?? bootcamp.title}',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: Image.asset(
                      bootcamp.imageAsset,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: LightPalette.primaryColor100,
                        child: const Icon(
                          Icons.code,
                          size: 44,
                          color: LightPalette.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 5,
                child: Material(
                  color: Colors.black.withValues(alpha: 0.35),
                  shape: const CircleBorder(),
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () => Navigator.of(context).maybePop(),
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const Gap(5),

        
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: LightPalette.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      bootcamp.statusLabel,
                      style: TextStyles.caption1.copyWith(
                        color: LightPalette.primaryColor100,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Gap(8),
                  Expanded(
                    child: Text(
                      '${bootcamp.track}  •  ${bootcamp.mode}',
                      style: TextStyles.body2.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colors.secondary,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const Gap(10),
              Text(
                bootcamp.title,
                style: TextStyles.headline2.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Gap(4),
              Text(
                '${bootcamp.dateRange} • ${bootcamp.duration}',
                style: TextStyles.caption1.copyWith(
                  color: LightPalette.greyColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
