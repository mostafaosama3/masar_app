import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:masar_app/core/routes/routes_name.dart';
import 'package:masar_app/features/ONboarding/onboardin.dart';
import 'package:masar_app/features/shared/presentation/masar_home.dart';
import 'package:masar_app/features/splash/splash_screen.dart';
import 'package:masar_app/features/profile/profile_screen.dart';
import 'package:masar_app/profile_data/widgets/complete_profile_screen.dart';

class Routes {
  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.splash,
    routes: [
      GoRoute(
        path: RouteNames.splash,
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),

      GoRoute(
        path: RouteNames.onboarding,
        name: 'onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),

      GoRoute(
        path: RouteNames.welcome,
        name: 'welcome',
        builder: (context, state) => const Scaffold(
          body: Center(
            child: Text('Welcome'),
          ),
        ),
      ),

      GoRoute(
        path: RouteNames.main,
        name: 'main',
        builder: (context, state) => const MasarHome(),
      ),

      GoRoute(
        path: RouteNames.profile,
        name: 'profile',
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: RouteNames.completeProfile,
        name: 'completeProfile',
        builder: (context, state) => const CompleteProfileScreen(),
      ),
    ],
  );
}