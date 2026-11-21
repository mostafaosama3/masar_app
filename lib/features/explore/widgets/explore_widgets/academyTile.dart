import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:masar_app/core/constants/app_images.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/text_styles.dart';
import '../../model/explore_model.dart';

class AcademyTile extends StatelessWidget {
  const AcademyTile({super.key, required this.item, required this.onFollowTap});

  final AcademyCardItem item;
  final VoidCallback onFollowTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2EAE6)),
      ),
      child: Column(
        children: [
          Image.asset(AppImages.topVetted),
          Gap(8),
          Text(
            item.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, size: 16, color: LightPalette.goldColor),
              Text(
                '${item.rating}',
                style: TextStyles.caption2.copyWith(
                  fontWeight: FontWeight.w500,
                  color: LightPalette.primaryColor,
                ),
              ),
              Text(
                ' • ${item.tracks} Tracks',
                style: TextStyles.caption2.copyWith(color: LightPalette.greyColor),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 140,
            height: 25,
            child: OutlinedButton(
              onPressed: onFollowTap,
              style: OutlinedButton.styleFrom(
                backgroundColor: item.isFollowing
                    ? LightPalette.onPrimaryColor
                    : LightPalette.primaryColor,
                foregroundColor: item.isFollowing
                    ? LightPalette.greyColor
                    : LightPalette.onPrimaryColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: Text(
                item.isFollowing ? 'Following' : '+ Follow',
                style: TextStyles.body2.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
