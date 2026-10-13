import 'package:flutter/material.dart';

abstract final class AppColors {
  static const Color background = Color(0xFF0B1326);
  static const Color surface = Color(0xFF0B1326);
  static const Color surfaceContainerLowest = Color(0xFF060E20);
  static const Color cardSurface = Color(0xFF131B2E);
  static const Color cardSurfaceHover = Color(0xFF171F33);
  static const Color cardSurfaceHigh = Color(0xFF222A3D);
  static const Color cardBorder = Color(0x1FFFFFFF);
  static const Color cardBorderHover = Color(0x4D93CCFF);

  static const Color primary = Color(0xFF93CCFF);
  static const Color primaryContainer = Color(0xFF3198DC);
  static const Color secondary = Color(0xFFC0C1FF);
  static const Color tertiary = Color(0xFFFFB95F);
  static const Color emerald = Color(0xFF10B981);
  static const Color error = Color(0xFFFFB4AB);

  static const Color textPrimary = Color(0xFFDAE2FD);
  static const Color textSecondary = Color(0xFFBFC7D2);
  static const Color textMuted = Color(0xFF89929B);
  static const Color outlineVariant = Color(0xFF3F4850);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF93CCFF), Color(0xFFC0C1FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
