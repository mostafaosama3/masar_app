import 'package:flutter/material.dart';
import 'package:masar_app/core/styles/app_colors.dart';

extension ContextTheme on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  bool get isDark => theme.brightness == Brightness.dark;

  Color get primary100 => isDark ? DarkPalette.primaryColor100 : LightPalette.primaryColor100;

  Color get accent => isDark ? DarkPalette.accentColor : LightPalette.accentColor;

  Color get grey => isDark ? DarkPalette.greyColor : LightPalette.greyColor;

  Color get chipLabel => isDark ? DarkPalette.accentColor : LightPalette.secondaryColor;
}
