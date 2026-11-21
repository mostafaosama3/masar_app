import 'package:flutter/material.dart';
import 'package:masar_app/core/styles/app_colors.dart';


class MintProgress extends StatelessWidget {
  const MintProgress({super.key, required this.value});

  final double value;

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: LinearProgressIndicator(
      value: value,
      minHeight: 6,
      color: LightPalette.mint,
      backgroundColor: LightPalette.darkTrack,
    ),
  );
}
