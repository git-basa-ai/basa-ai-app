import 'package:flutter/material.dart';

import '../../app/theme/colors.dart';
import '../../app/theme/typography.dart';

/// Animated XP/progress bar with level indicator.
///
/// Displays current XP progress toward the next level with a gold fill
/// and animated transition. Used in the learner home header and profile screen.
///
/// ```dart
/// XpBar(
///   currentXp: 720,
///   maxXp: 1000,
///   level: 3,
/// )
/// ```
class XpBar extends StatelessWidget {
  /// Current experience points.
  final int currentXp;

  /// XP required for the next level.
  final int maxXp;

  /// Current level number.
  final int level;

  /// Whether to show the "Level X" label. Defaults to true.
  final bool showLabel;

  const XpBar({
    super.key,
    required this.currentXp,
    required this.maxXp,
    required this.level,
    this.showLabel = true,
  });

  @override
  Widget build(BuildContext context) {
    final progress = maxXp > 0 ? (currentXp / maxXp).clamp(0.0, 1.0) : 0.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showLabel)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              children: [
                const Icon(
                  Icons.star_rounded,
                  color: AppColors.xpGold,
                  size: 20,
                ),
                const SizedBox(width: 4),
                Text(
                  'Level $level',
                  style: AppTypography.labelMedium.copyWith(
                    color: AppColors.xpGold,
                  ),
                ),
                const Spacer(),
                Text(
                  '$currentXp / $maxXp XP',
                  style: AppTypography.bodySecondary,
                ),
              ],
            ),
          ),
        ClipRRect(
          borderRadius: BorderRadius.circular(9999),
          child: SizedBox(
            height: 12,
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: progress),
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeOut,
              builder: (context, value, _) {
                return LinearProgressIndicator(
                  value: value,
                  backgroundColor: AppColors.border,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    AppColors.xpGold,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
