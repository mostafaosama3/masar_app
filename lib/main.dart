import 'package:flutter/material.dart';
import 'package:masar_app/core/styles/themes.dart';
import 'package:masar_app/features/shared/presentation/masar_home.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Masar',
    theme: AppThemes.lightTheme,
    home: const MasarHome(),
  );
}
