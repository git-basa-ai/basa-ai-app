import 'package:flutter/material.dart';

import '../../app/theme/colors.dart';
import '../../app/theme/typography.dart';
import '../../shared/utils/constants.dart';

/// A list tile for displaying a learner with name, LRN, and status badge.
class LearnerListTile extends StatelessWidget {
  final String name;
  final String lrn;
  final String section;
  final String status;
  final VoidCallback? onTap;

  const LearnerListTile({
    super.key,
    required this.name,
    required this.lrn,
    required this.section,
    required this.status,
    this.onTap,
  });

  Color get _statusColor {
    switch (status) {
      case 'on-track':
        return AppColors.success;
      case 'needs-help':
        return AppColors.secondary;
      case 'non-reader':
        return AppColors.error;
      default:
        return AppColors.textSecondary;
    }
  }

  String get _statusLabel {
    switch (status) {
      case 'on-track':
        return 'On Track';
      case 'needs-help':
        return 'Needs Help';
      case 'non-reader':
        return 'Non-reader';
      default:
        return status;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(Radii.md),
      child: Container(
        padding: const EdgeInsets.all(Spacing.lg),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(Radii.md),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  name.isNotEmpty ? name[0] : '?',
                  style: AppTypography.labelLarge.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
            const SizedBox(width: Spacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: AppTypography.labelMedium),
                  const SizedBox(height: Spacing.xs),
                  Text(
                    'LRN: $lrn · $section',
                    style: AppTypography.bodySecondary,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.md,
                vertical: Spacing.xs,
              ),
              decoration: BoxDecoration(
                color: _statusColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(Radii.pill),
              ),
              child: Text(
                _statusLabel,
                style: AppTypography.bodyMedium.copyWith(
                  color: _statusColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
