import 'package:flutter/material.dart';
import 'package:masar_app/core/constants/app_font.dart';
import 'text_styles.dart';
import 'app_colors.dart';

class AppThemes {
  AppThemes._();

  static final _radius = BorderRadius.circular(14);

  // ───────────────────────────── LIGHT ─────────────────────────────
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
   fontFamily: AppFonts.plusJakartaSans,
    scaffoldBackgroundColor: LightPalette.background,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    primaryColor: LightPalette.primaryColor,
    hoverColor: LightPalette.primaryColor100,
    dividerColor: LightPalette.borderColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: LightPalette.primaryColor, // app theme color
      brightness: Brightness.light,
      primary: LightPalette.primaryColor,
      onPrimary: LightPalette.onPrimaryColor,
      secondary: LightPalette.secondaryColor,
      tertiary: LightPalette.tertiaryColor,
      surface: LightPalette.surface,
      onSurface: LightPalette.textPrimary, // Text color
      surfaceContainer: LightPalette.surface,
      error: LightPalette.redColor,
      inversePrimary: LightPalette.textInverse,
      outline: LightPalette.borderColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: LightPalette.background,
      foregroundColor: LightPalette.textPrimary,
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: TextStyles.title2.copyWith(
        color: LightPalette.textPrimary,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyles.caption1.copyWith(color: LightPalette.greyColor),
      fillColor: LightPalette.surface,
      filled: true,
      errorStyle: TextStyles.caption2.copyWith(color: LightPalette.redColor),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: _radius,
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: _radius,
        borderSide: const BorderSide(color: LightPalette.accentColor, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: _radius,
        borderSide: const BorderSide(color: LightPalette.redColor),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: LightPalette.primaryColor,
        foregroundColor: LightPalette.onPrimaryColor,
        minimumSize: const Size.fromHeight(52),
        textStyle: TextStyles.button,
        shape: RoundedRectangleBorder(borderRadius: _radius),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: LightPalette.primaryColor,
        foregroundColor: LightPalette.onPrimaryColor,
        minimumSize: const Size.fromHeight(52),
        textStyle: TextStyles.button,
        shape: RoundedRectangleBorder(borderRadius: _radius),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: LightPalette.textPrimary,
        minimumSize: const Size.fromHeight(52),
        textStyle: TextStyles.button,
        side: const BorderSide(color: LightPalette.borderColor),
        shape: RoundedRectangleBorder(borderRadius: _radius),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: LightPalette.accentColor,
        textStyle: TextStyles.label,
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
    ),
    cardTheme: CardThemeData(
      color: LightPalette.surface,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: LightPalette.primaryColor100,
      labelStyle: TextStyles.caption1.copyWith(
        color: LightPalette.secondaryColor,
      ),
      side: BorderSide.none,
      shape: const StadiumBorder(),
    ),
    datePickerTheme: const DatePickerThemeData(
      backgroundColor: LightPalette.background,
      surfaceTintColor: Colors.transparent,
    ),
    timePickerTheme: const TimePickerThemeData(
      backgroundColor: LightPalette.background,
      dialBackgroundColor: LightPalette.surface,
      hourMinuteColor: LightPalette.surface,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: LightPalette.accentColor,
      unselectedItemColor: LightPalette.textPrimary,
      selectedLabelStyle: TextStyles.caption1.copyWith(
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: TextStyles.caption1.copyWith(
        fontWeight: FontWeight.w500,
      ),
    ),
  );

  // ───────────────────────────── DARK ─────────────────────────────
  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: AppFonts.plusJakartaSans,
    scaffoldBackgroundColor: DarkPalette.background,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    primaryColor: DarkPalette.primaryColor,
    hoverColor: DarkPalette.primaryColor100,
    dividerColor: DarkPalette.borderColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: DarkPalette.primaryColor, // app theme color
      brightness: Brightness.dark,
      primary: DarkPalette.primaryColor,
      onPrimary: DarkPalette.onPrimaryColor,
      secondary: DarkPalette.secondaryColor,
      tertiary: DarkPalette.tertiaryColor,
      surface: DarkPalette.surface,
      onSurface: DarkPalette.textPrimary, // Text color
      surfaceContainer: DarkPalette.surface,
      error: DarkPalette.redColor,
      inversePrimary: DarkPalette.textInverse,
      outline: DarkPalette.borderColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: DarkPalette.background,
      foregroundColor: DarkPalette.textPrimary,
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: TextStyles.title2.copyWith(
        color: DarkPalette.textPrimary,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyles.caption1.copyWith(color: DarkPalette.greyColor),
      fillColor: DarkPalette.surface,
      filled: true,
      errorStyle: TextStyles.caption2.copyWith(color: DarkPalette.redColor),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: _radius,
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: _radius,
        borderSide: const BorderSide(color: DarkPalette.accentColor, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: _radius,
        borderSide: const BorderSide(color: DarkPalette.redColor),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: DarkPalette.primaryColor,
        foregroundColor: DarkPalette.onPrimaryColor,
        minimumSize: const Size.fromHeight(52),
        textStyle: TextStyles.button,
        shape: RoundedRectangleBorder(borderRadius: _radius),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: DarkPalette.primaryColor,
        foregroundColor: DarkPalette.onPrimaryColor,
        minimumSize: const Size.fromHeight(52),
        textStyle: TextStyles.button,
        shape: RoundedRectangleBorder(borderRadius: _radius),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: DarkPalette.textPrimary,
        minimumSize: const Size.fromHeight(52),
        textStyle: TextStyles.button,
        side: const BorderSide(color: DarkPalette.borderColor),
        shape: RoundedRectangleBorder(borderRadius: _radius),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: DarkPalette.accentColor,
        textStyle: TextStyles.label,
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
    ),
    cardTheme: CardThemeData(
      color: DarkPalette.surface,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: DarkPalette.primaryColor100,
      labelStyle: TextStyles.caption1.copyWith(
        color: DarkPalette.accentColor,
      ),
      side: BorderSide.none,
      shape: const StadiumBorder(),
    ),
    datePickerTheme: const DatePickerThemeData(
      backgroundColor: DarkPalette.background,
      surfaceTintColor: Colors.transparent,
    ),
    timePickerTheme: const TimePickerThemeData(
      backgroundColor: DarkPalette.background,
      dialBackgroundColor: DarkPalette.surface,
      hourMinuteColor: DarkPalette.surface,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: DarkPalette.accentColor,
      unselectedItemColor: DarkPalette.textPrimary,
      selectedLabelStyle: TextStyles.caption1.copyWith(
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: TextStyles.caption1.copyWith(
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
