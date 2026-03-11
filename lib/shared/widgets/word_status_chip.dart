import 'package:flutter/material.dart';

import '../../app/theme/colors.dart';
import '../../app/theme/typography.dart';
import '../../shared/utils/constants.dart';

/// A chip for displaying word status: mastered (green) or struggling (red).
class WordStatusChip extends StatelessWidget {
  final String word;
  final bool isMastered;
  final String? detail;

  const WordStatusChip({
    super.key,
    required this.word,
    required this.isMastered,
    this.detail,
  });

  @override
  Widget build(BuildContext context) {
    final color = isMastered ? AppColors.success : AppColors.error;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.lg,
        vertical: Spacing.md,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(Radii.md),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isMastered ? Icons.check_circle_rounded : Icons.warning_rounded,
            color: color,
            size: 20,
          ),
          const SizedBox(width: Spacing.sm),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  word,
                  style: AppTypography.labelMedium.copyWith(color: color),
                ),
                if (detail != null)
                  Text(
                    detail!,
                    style: AppTypography.bodySecondary.copyWith(fontSize: 14),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
