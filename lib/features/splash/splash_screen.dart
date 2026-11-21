import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:masar_app/core/constants/app_images.dart';
import 'package:masar_app/core/routes/routes_name.dart';
import 'package:masar_app/core/widgets/app_asset_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 3), () {
      if (mounted) context.go(RouteNames.onboarding);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // The logo image already contains "MASAR" and the tagline,
    // and it has a white background, so the screen is white.
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.75,
          child: AppAssetImage(
            AppImages.logo,
            fit: BoxFit.contain,
            fallbackIcon: Icons.show_chart_rounded,
          ),
        ),
      ),
    );
  }
}