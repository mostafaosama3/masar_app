import 'package:flutter/material.dart';
import 'package:masar_app/core/styles/app_colors.dart';

class MasarBottomNav extends StatelessWidget {
  const MasarBottomNav({super.key, required this.selectedIndex, required this.onTap});

  final int selectedIndex;
  final ValueChanged<int> onTap;

  static const _items = <(IconData, String)>[
    (Icons.home_outlined, 'Home'),
    (Icons.explore_outlined, 'Explore'),
    (Icons.school_outlined, 'My Learning'),
    (Icons.emoji_events_outlined, 'Ranking'),
    (Icons.person_outline, 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        margin: const EdgeInsets.fromLTRB(14, 0, 14, 10),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: LightPalette.primaryColor,
          borderRadius: BorderRadius.circular(28),
          boxShadow: const [
            BoxShadow(color: Color(0x22000000), blurRadius: 18, offset: Offset(0, 5)),
          ],
        ),
        child: Row(
          children: [
            for (final (i, (icon, label)) in _items.indexed)
              Expanded(
                child: _NavItem(icon, label, selected: i == selectedIndex, onTap: () => onTap(i)),
              ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem(this.icon, this.label, {required this.selected, required this.onTap});

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? LightPalette.mint : Colors.white70;
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 21, color: color),
          const SizedBox(height: 3),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 9,
              fontWeight: selected ? FontWeight.w700 : FontWeight.w400,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
