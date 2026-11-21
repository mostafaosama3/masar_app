import 'package:flutter/material.dart';
import 'package:masar_app/core/styles/app_colors.dart';


class ScreenHeader extends StatelessWidget {
  const ScreenHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'MASAR EXECUTIVE',
                style: TextStyle(
                  fontSize: 10,
                  letterSpacing: 1.1,
                  fontWeight: FontWeight.w800,
                  color: LightPalette.secondaryColor,
                ),
              ),
              Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
            ],
          ),
        ),
        Material(
          color: Colors.white,
          shape: const CircleBorder(),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none, color: LightPalette.primaryColor),
          ),
        ),
      ],
    );
  }
}
