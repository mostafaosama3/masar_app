// lib/core/widgets/themed_screen_background.dart
import 'package:flutter/material.dart';

class ThemedScreenBackground extends StatelessWidget {
  const ThemedScreenBackground({
    super.key,
    required this.lightAsset,
    required this.darkAsset,
    required this.child,
    this.fit = BoxFit.cover,
  });

  final String lightAsset;
  final String darkAsset;
  final Widget child;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final assetPath = isDark ? darkAsset : lightAsset;

    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            assetPath,
            fit: fit,
            errorBuilder: (_, _, _) =>
                ColoredBox(color: Theme.of(context).scaffoldBackgroundColor),
          ),
        ),
        Positioned.fill(child: child),
      ],
    );
  }
}
