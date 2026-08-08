import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ── App Figma palette ─────────────────────────────────
  static const Color appBackground = Color(0xFFEDEDED);
  static const Color appDarkGreen = Color(0xFF04332D);
  static const Color appRed = Color(0xFFFC1B1A);
  static const Color appGreen = Color(0xFF08A43A);
  static const Color appTeal = Color(0xFF16A99F);
  static const Color appTeal10 = Color.fromARGB(64, 26, 129, 169);

  // ── Semantic aliases ─────────────────────────────────
  static const Color primary = appTeal;
  static const Color accent = appDarkGreen;

  static const Color backgroundColor = appBackground;
  static const Color surface = appBackground;
  static const Color borderColor = appTeal10;

  static const Color textPrimary = appDarkGreen;
  static const Color textSecondary = Color(0x9904332D);
  static const Color textDisabled = Color(0x5904332D);

  static const Color error = appRed;
  static const Color warning = appRed;
  static const Color success = appGreen;
}
