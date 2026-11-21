import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:masar_app/core/routes/routes_name.dart';
import 'package:masar_app/profile_data/profile.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileSetupScreen(
      onGoHome: () {
        context.go(RouteNames.main);
      },
    );
  }
}