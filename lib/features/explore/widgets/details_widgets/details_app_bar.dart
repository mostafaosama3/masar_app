import 'package:flutter/material.dart';
import 'package:masar_app/core/styles/app_colors.dart';
import 'package:masar_app/core/styles/text_styles.dart';

class DetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DetailsAppBar({
    super.key,
    required this.isSaved,
    required this.onBack,
    required this.onShare,
    required this.onToggleSave,
    required this.onProfileTap,
  });

  final bool isSaved;
  final VoidCallback onBack;
  final VoidCallback onShare;
  final VoidCallback onToggleSave;
  final VoidCallback onProfileTap;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      leading: IconButton(
        onPressed: onBack,
        icon: Icon(Icons.arrow_back, color: LightPalette.primaryColor),
      ),
      title: Text(
        'Bootcamp Details',
        style: TextStyles.title2.copyWith(
          color: LightPalette.primaryColor,
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: [
        IconButton(
          onPressed: onShare,
          icon: const Icon(Icons.share_outlined, size: 20, color: LightPalette.primaryColor),
        ),
        IconButton(
          onPressed: onToggleSave,
          icon: Icon(
            isSaved ? Icons.bookmark : Icons.bookmark_border,
            size: 21,
            color: LightPalette.primaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12, left: 4),
          child: InkWell(
            onTap: onProfileTap,
            borderRadius: BorderRadius.circular(20),
            child: const CircleAvatar(
              radius: 16,
              backgroundColor: LightPalette.primaryColor,
              child: Icon(Icons.person_outline, size: 18, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
