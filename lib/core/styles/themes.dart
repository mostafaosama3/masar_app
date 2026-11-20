import 'package:flutter/material.dart';
import 'package:masar_app/core/constants/app_font.dart';
import 'package:masar_app/core/styles/app_colors.dart';
import 'package:masar_app/core/styles/text_styles.dart';

/// The colors a theme needs. Light and dark fill the same slots, so one
/// builder ([AppThemes._build]) can create both themes.
class _Palette {
  const _Palette({
    required this.background,
    required this.surface,
    required this.primary,
    required this.onPrimary,
    required this.primary100,
    required this.secondary,
    required this.tertiary,
    required this.accent,
    required this.text,
    required this.textInverse,
    required this.grey,
    required this.border,
    required this.red,
    required this.chipLabel,
  });

  final Color background, surface, primary, onPrimary, primary100;
  final Color secondary, tertiary, accent, text, textInverse;
  final Color grey, border, red, chipLabel;
}

class AppThemes {
  AppThemes._();

  static const _light = _Palette(
    background: LightPalette.background,
    surface: LightPalette.surface,
    primary: LightPalette.primaryColor,
    onPrimary: LightPalette.onPrimaryColor,
    primary100: LightPalette.primaryColor100,
    secondary: LightPalette.secondaryColor,
    tertiary: LightPalette.tertiaryColor,
    accent: LightPalette.accentColor,
    text: LightPalette.textPrimary,
    textInverse: LightPalette.textInverse,
    grey: LightPalette.greyColor,
    border: LightPalette.borderColor,
    red: LightPalette.redColor,
    chipLabel: LightPalette.secondaryColor,
  );

  static const _dark = _Palette(
    background: DarkPalette.background,
    surface: DarkPalette.surface,
    primary: DarkPalette.primaryColor,
    onPrimary: DarkPalette.onPrimaryColor,
    primary100: DarkPalette.primaryColor100,
    secondary: DarkPalette.secondaryColor,
    tertiary: DarkPalette.tertiaryColor,
    accent: DarkPalette.accentColor,
    text: DarkPalette.textPrimary,
    textInverse: DarkPalette.textInverse,
    grey: DarkPalette.greyColor,
    border: DarkPalette.borderColor,
    red: DarkPalette.redColor,
    chipLabel: DarkPalette.accentColor,
  );

  static ThemeData get lightTheme => _build(Brightness.light, _light);
  static ThemeData get darkTheme => _build(Brightness.dark, _dark);

  static ThemeData _build(Brightness brightness, _Palette p) {
    final radius = BorderRadius.circular(14);
    final buttonShape = RoundedRectangleBorder(borderRadius: radius);
    const buttonSize = Size.fromHeight(52);
    final navLabel = TextStyles.caption1.copyWith(fontWeight: FontWeight.w500);

    OutlineInputBorder inputBorder([BorderSide side = BorderSide.none]) =>
        OutlineInputBorder(borderRadius: radius, borderSide: side);

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      fontFamily: AppFonts.plusJakartaSans,
      scaffoldBackgroundColor: p.background,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      primaryColor: p.primary,
      hoverColor: p.primary100,
      dividerColor: p.border,
      colorScheme: ColorScheme.fromSeed(
        seedColor: p.primary,
        brightness: brightness,
        primary: p.primary,
        onPrimary: p.onPrimary,
        secondary: p.secondary,
        tertiary: p.tertiary,
        surface: p.surface,
        onSurface: p.text,
        surfaceContainer: p.surface,
        error: p.red,
        inversePrimary: p.textInverse,
        outline: p.border,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: p.background,
        foregroundColor: p.text,
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: TextStyles.title2.copyWith(color: p.text),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyles.caption1.copyWith(color: p.grey),
        fillColor: p.surface,
        filled: true,
        errorStyle: TextStyles.caption2.copyWith(color: p.red),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: inputBorder(),
        focusedBorder: inputBorder(BorderSide(color: p.accent, width: 1.5)),
        errorBorder: inputBorder(BorderSide(color: p.red)),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: p.primary,
          foregroundColor: p.onPrimary,
          minimumSize: buttonSize,
          textStyle: TextStyles.button,
          shape: buttonShape,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: p.primary,
          foregroundColor: p.onPrimary,
          minimumSize: buttonSize,
          textStyle: TextStyles.button,
          shape: buttonShape,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: p.text,
          minimumSize: buttonSize,
          textStyle: TextStyles.button,
          side: BorderSide(color: p.border),
          shape: buttonShape,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: p.accent, textStyle: TextStyles.label),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
      ),
      cardTheme: CardThemeData(
        color: p.surface,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: p.primary100,
        labelStyle: TextStyles.caption1.copyWith(color: p.chipLabel),
        side: BorderSide.none,
        shape: const StadiumBorder(),
      ),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: p.background,
        surfaceTintColor: Colors.transparent,
      ),
      timePickerTheme: TimePickerThemeData(
        backgroundColor: p.background,
        dialBackgroundColor: p.surface,
        hourMinuteColor: p.surface,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: p.accent,
        unselectedItemColor: p.text,
        selectedLabelStyle: navLabel,
        unselectedLabelStyle: navLabel,
      ),
    );
  }
}
