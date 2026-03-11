import 'package:flutter/material.dart';

import '../../app/theme/typography.dart';
import '../../shared/utils/constants.dart';

/// A summary stat card showing a number, label, and accent color.
///
/// Reused across Teacher and Coordinator dashboards.
class StatSummaryCard extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  final IconData? icon;

  const StatSummaryCard({
    super.key,
    required this.label,
    required this.value,
    required this.color,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Spacing.lg),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(Radii.lg),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, color: color, size: 24),
            const SizedBox(height: Spacing.sm),
          ],
          Text(
            value,
            style: AppTypography.heading2.copyWith(color: color),
          ),
          const SizedBox(height: Spacing.xs),
          Text(
            label,
            style: AppTypography.bodyMedium.copyWith(color: color),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
