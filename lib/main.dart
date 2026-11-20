import 'package:flutter/material.dart';
import 'package:masar_app/core/styles/themes.dart';
import 'package:masar_app/features/shared/presentation/masar_home.dart';

import 'features/bootcampsDetailes/views/bootcamps_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: BootcampsScreen());
  }
}
