import 'package:flutter/material.dart';
import 'package:masar_app/core/styles/app_colors.dart';

/// Small uppercase section label (e.g. "STANDINGS").
class Eyebrow extends StatelessWidget {
  const Eyebrow(this.text, {super.key, this.size = 9});

  final String text;
  final double size;

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w800,
      color: LightPalette.secondaryColor,
    ),
  );
}
