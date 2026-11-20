import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:masar_app/core/routes/routes_name.dart';
import 'package:masar_app/features/ONboarding/onboardin.dart';
import 'package:masar_app/features/splash/splash_screen.dart';
import 'package:masar_app/features/profile/profile_screen.dart';
class Routes {
  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.splash,
    routes: [
      GoRoute(
        path: RouteNames.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RouteNames.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: RouteNames.welcome,
        builder: (context, state) => const Scaffold(
          body: Center(child: Text('Welcome')),
        ),
      ),
      GoRoute(
  path: RouteNames.profile,
  name: RouteNames.profile,
  builder: (context, state) => const ProfileScreen(),
),
    ],
  );
}