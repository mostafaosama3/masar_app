import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:masar_app/core/styles/app_colors.dart';

import '../../../../core/styles/text_styles.dart';

class BottomCertificateBar extends StatelessWidget {
  const BottomCertificateBar({super.key, required this.onSubmit});

  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: LightPalette.onPrimaryColor)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.workspace_premium_outlined,
                        size: 14,
                        color: LightPalette.secondaryColor,
                      ),
                      Gap(5),
                      Text(
                        'Instant Credential Release',
                        style: TextStyles.caption1.copyWith(
                          fontWeight: FontWeight.w700,
                          color: LightPalette.secondaryColor,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.lock_open_outlined, size: 13, color: LightPalette.greyColor),
                      Gap(4),
                      Text(
                        'Ready upon submission',
                        style: TextStyles.caption1.copyWith(
                          fontWeight: FontWeight.w500,
                          color: LightPalette.greyColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Gap(10),
              SizedBox(
                width: double.infinity,
                height: 46,
                child: ElevatedButton.icon(
                  onPressed: onSubmit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: LightPalette.primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  icon: Text(
                    'Submit & Claim Certificate',
                    style: TextStyles.label.copyWith(fontWeight: FontWeight.w700),
                  ),
                  label: const Icon(Icons.school_outlined, size: 18),
                ),
              ),
              const Gap(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.verified_user_outlined, size: 13, color: LightPalette.secondaryColor),
                  Gap(5),
                  Flexible(
                    child: Text(
                      'Official certificate issued by Tuwaiq Academy & Sarmad Tech',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.caption2.copyWith(color: LightPalette.greyColor),
                    ),
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
