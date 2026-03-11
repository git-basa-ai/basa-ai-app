import 'package:flutter/material.dart';

/// All color tokens for BASA AI.
///
/// Rule C2: No inline `Color(0xFF...)` values in widgets — use [AppColors] only.
class AppColors {
  AppColors._();

  // ── Primary — Bibo Blue (brand) ──────────────────────────────
  static const Color primary = Color(0xFF1565C0);
  static const Color primaryLight = Color(0xFF5E92F3);
  static const Color primaryDark = Color(0xFF003C8F);

  // ── Secondary — Warm Orange (engagement, action) ─────────────
  static const Color secondary = Color(0xFFFF8F00);
  static const Color secondaryLight = Color(0xFFFFC046);
  static const Color secondaryDark = Color(0xFFC56000);

  // ── Success — Friendly Green ─────────────────────────────────
  static const Color success = Color(0xFF4CAF50);
  static const Color successLight = Color(0xFF80E27E);

  // ── Error — Soft Red (gentle for children) ───────────────────
  static const Color error = Color(0xFFE57373);
  static const Color errorDark = Color(0xFFD32F2F);

  // ── XP / Progress — Gold ─────────────────────────────────────
  static const Color xpGold = Color(0xFFFFD600);
  static const Color xpGoldLight = Color(0xFFFFFF52);

  // ── Background & Surface ─────────────────────────────────────
  static const Color background = Color(0xFFF5F7FA);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color scaffoldBackground = Color(0xFFF5F7FA);

  // ── Text ─────────────────────────────────────────────────────
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  static const Color textOnSecondary = Color(0xFFFFFFFF);

  // ── Borders & Dividers ───────────────────────────────────────
  static const Color border = Color(0xFFE0E0E0);
  static const Color divider = Color(0xFFEEEEEE);

  // ── Answer Tile States ───────────────────────────────────────
  static const Color answerDefault = Color(0xFFFFFFFF);
  static const Color answerCorrect = Color(0xFF4CAF50);
  static const Color answerWrong = Color(0xFFE57373);
}
