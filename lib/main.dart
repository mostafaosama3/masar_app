import 'package:flutter/material.dart';
import 'package:masar_app/core/routes/routes.dart';
import 'package:masar_app/core/styles/themes.dart';

import 'features/bootcampsDetailes/views/bootcamps_screen.dart';
import 'features/explore/view/explore_screen.dart';
import 'features/shared/presentation/masar_home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.light,
      routerConfig: Routes.router,
    );
  }
}
