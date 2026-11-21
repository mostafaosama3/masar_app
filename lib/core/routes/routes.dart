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
      // Splash Route
      GoRoute(
        path: RouteNames.splash,
        name: RouteNames.splash,
        builder: (context, state) => const SplashScreen(),
      ),

      // Onboarding Route
      GoRoute(
        path: RouteNames.onboarding,
        name: RouteNames.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),

      // Welcome Route
      GoRoute(
        path: RouteNames.welcome,
        name: RouteNames.welcome,
        builder: (context, state) => const Scaffold(
          body: Center(
            child: Text('Welcome'),
          ),
        ),
      ),

      // Profile Route
      GoRoute(
        path: RouteNames.profile,
        name: RouteNames.profile,
        builder: (context, state) => const ProfileScreen(),
      ),
    ],
  );
}