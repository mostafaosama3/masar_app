import 'package:flutter/material.dart';
import 'package:masar_app/core/functions/extensions.dart';

/// Image.asset with a fallback icon, so screens still run before the
/// real assets from Figma are added to assets/images/.
class AppAssetImage extends StatelessWidget {
  const AppAssetImage(
    this.path, {
    super.key,
    this.fit = BoxFit.cover,
    this.fallbackIcon = Icons.image_outlined,
  });

  final String path;
  final BoxFit fit;
  final IconData fallbackIcon;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      fit: fit,
      errorBuilder: (context, error, stackTrace) => Center(
        child: Icon(fallbackIcon, size: 48, color: context.colorScheme.tertiary),
      ),
    );
  }
}
