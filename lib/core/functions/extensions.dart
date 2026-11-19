import 'package:flutter/material.dart';
extension ThemeThemeExtension on BuildContext {
  ThemeData get theme=>Theme.of(this);
ColorScheme get colorScheme => theme.colorScheme;
// bool get isDark =>HiveProvider.getData(HiveProvider.KIsdark)??false;
}