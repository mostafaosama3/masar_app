import 'package:flutter/material.dart';

class LightPalette {
  static const Color background = Color(0xFFF4F7F5);
  static const Color surface = Colors.white; // cards, inputs
  static const Color primaryColor = Color(0xFF082826); // buttons, nav bar
  static const Color onPrimaryColor = Colors.white; // text/icons on primary
  static const Color primaryColor100 = Color(0xFFDAF1DE); // chips, badges, tinted backgrounds
  static const Color secondaryColor = Color(0xFF235347);
  static const Color tertiaryColor = Color(0xFF8EB69B);
  static const Color accentColor = Color(0xFF235347); // highlights: selected nav, links, focus
  static const Color textPrimary = Color(0xFF082826);
  static const Color textInverse = Colors.white;
  static const Color greyColor = Color(0xFF5B6B67);
  static const Color borderColor = Color(0xFFD5DEDA);
  static const Color redColor = Color(0xFFEB5757);
  static const Color goldColor = Color(0xFFF2B531); // stars, trophies, achievements

  // Extra shades used by the screens (previously repeated as raw hex values).
  static const Color mint = Color(0xFFB9E8D8); // text/icons/progress on dark green
  static const Color mintTint = Color(0xFFD5F0E8); // pills, avatar backgrounds
  static const Color mutedBg = Color(0xFFE7ECE9); // locked items, tab bar
  static const Color darkTrack = Color(0xFF315B51); // progress track on dark green
}

class DarkPalette {
  static const Color background = Color(0xFF0A1F1B);
  static const Color surface = Color(0xFF102B26); // cards
  static const Color primaryColor = Color(0xFF1B4D40); // button fill
  static const Color onPrimaryColor = Color(0xFFF4F7F5);
  static const Color primaryColor100 = Color(0xFF143A32); // chips, badges
  static const Color secondaryColor = Color(0xFF3E7A68);
  static const Color tertiaryColor = Color(0xFF8EB69B);
  static const Color accentColor = Color(0xFF5FD3A8); // bright mint highlights
  static const Color textPrimary = Color(0xFFF4F7F5);
  static const Color textInverse = Color(0xFF082826);
  static const Color greyColor = Color(0xFF9DB5AE);
  static const Color borderColor = Color(0xFF1F4A40);
  static const Color redColor = Color(0xFFEB5757);
  static const Color goldColor = Color(0xFFF2B531);
}
