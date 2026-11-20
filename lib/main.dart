import 'package:flutter/material.dart';
import 'package:masar_app/core/styles/themes.dart';

import 'features/bootcampsDetailes/views/bootcamps_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: const BootcampsScreen());
  }
}
