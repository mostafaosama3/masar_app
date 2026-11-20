import 'package:flutter/material.dart';
import 'package:masar_app/core/styles/app_colors.dart';

class MyLearningCard extends StatelessWidget {
  const MyLearningCard({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08000000),
            blurRadius: 12,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }
}

class MyLearningPill extends StatelessWidget {
  const MyLearningPill(
    this.text, {
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: LightPalette.mintTint,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 9,
          color: LightPalette.secondaryColor,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class MyLearningChip extends StatelessWidget {
  const MyLearningChip(
    this.text, {
    super.key,
    this.selected = false,
  });

  final String text;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 9,
      ),
      decoration: BoxDecoration(
        color: selected
            ? LightPalette.primaryColor
            : Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10,
          color: selected
              ? Colors.white
              : LightPalette.greyColor,
        ),
      ),
    );
  }
}

class MyLearningMetric extends StatelessWidget {
  const MyLearningMetric(
    this.value,
    this.label, {
    super.key,
  });

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 15,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 9,
          ),
        ),
      ],
    );
  }
}

class MyLearningToolCard extends StatelessWidget {
  const MyLearningToolCard(
    this.icon,
    this.title,
    this.subtitle, {
    super.key,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return MyLearningCard(
      child: Row(
        children: [
          Icon(
            icon,
            color: LightPalette.secondaryColor,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 9,
                    color: LightPalette.greyColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
