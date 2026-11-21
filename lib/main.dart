import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:masar_app/core/routes/routes.dart';
import 'package:masar_app/core/styles/themes.dart';
=======
import 'package:masar_app/core/styles/themes.dart';
import 'package:masar_app/profile_data/profile.dart';
>>>>>>> origin/personal_information

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.light,
      routerConfig: Routes.router,
=======
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system,
      home: ProfileSetupScreen(
        onGoHome: () {

        },
      ),
>>>>>>> origin/personal_information
    );
  }
}