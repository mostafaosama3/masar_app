import 'package:flutter/material.dart';

import '../../../../core/styles/app_colors.dart';

class FilterPill extends StatelessWidget {
  const FilterPill({
    super.key,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bgColor = isSelected ? LightPalette.mint : Colors.white;
    final borderColor = isSelected ? LightPalette.tertiaryColor : LightPalette.primaryColor100;
    final textColor = isSelected ? LightPalette.primaryColor : LightPalette.secondaryColor;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 15, color: textColor),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: textColor),
            ),
            if (isSelected) ...[
              const SizedBox(width: 6),
              Icon(Icons.close, size: 14, color: textColor),
            ],
          ],
        ),
      ),
    );
  }
}
