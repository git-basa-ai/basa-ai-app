import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../../../shared/utils/constants.dart';
import '../providers/analytics_provider.dart';

/// Program Analytics Screen — reading level distribution, trends, struggle words, section comparison.
class ProgramAnalyticsScreen extends ConsumerWidget {
  const ProgramAnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final readingLevels = ref.watch(readingLevelProvider);
    final trends = ref.watch(scoreTrendProvider);
    final struggleWords = ref.watch(schoolStruggleWordsProvider);
    final sections = ref.watch(sectionComparisonProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          l10n.analyticsTitle,
          style:
              AppTypography.heading3.copyWith(color: AppColors.textOnPrimary),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Reading Level Distribution
            Text(l10n.analyticsReadingLevels, style: AppTypography.heading3),
            const SizedBox(height: Spacing.md),
            ...readingLevels.map((level) {
              final color = _levelColor(level.level);
              return Padding(
                padding: const EdgeInsets.only(bottom: Spacing.sm),
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
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: Spacing.md),
                      Expanded(
                        child:
                            Text(level.level, style: AppTypography.labelMedium),
                      ),
                      Text('${level.count}', style: AppTypography.heading3),
                      const SizedBox(width: Spacing.sm),
                      SizedBox(
                        width: 60,
                        child: Text(
                          '${level.percent.toStringAsFixed(1)}%',
                          style: AppTypography.bodySecondary,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: Spacing.xxl),

            // Score Trend
            Text(l10n.analyticsTrendTitle, style: AppTypography.heading3),
            const SizedBox(height: Spacing.md),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(Spacing.lg),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(Radii.lg),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: trends.map((t) {
                  final barHeight = (t.avgScore / 100) * 120;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${t.avgScore.toStringAsFixed(0)}%',
                        style: AppTypography.bodySecondary,
                      ),
                      const SizedBox(height: Spacing.xs),
                      Container(
                        width: 40,
                        height: barHeight,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.7),
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(Radii.sm),
                          ),
                        ),
                      ),
                      const SizedBox(height: Spacing.xs),
                      Text(
                        t.week.replaceAll('Week ', 'W'),
                        style: AppTypography.bodySecondary,
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: Spacing.xxl),

            // Top Struggling Words
            Text(l10n.analyticsTopStruggle, style: AppTypography.heading3),
            const SizedBox(height: Spacing.md),
            ...struggleWords.map((w) {
              final maxCount = struggleWords.first.count.toDouble();
              return Padding(
                padding: const EdgeInsets.only(bottom: Spacing.sm),
                child: Container(
                  padding: const EdgeInsets.all(Spacing.lg),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(Radii.md),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 60,
                        child: Text(w.word, style: AppTypography.labelMedium),
                      ),
                      const SizedBox(width: Spacing.md),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(Radii.pill),
                          child: LinearProgressIndicator(
                            value: w.count / maxCount,
                            minHeight: 16,
                            backgroundColor: AppColors.border,
                            color: AppColors.error.withOpacity(0.7),
                          ),
                        ),
                      ),
                      const SizedBox(width: Spacing.md),
                      Text('${w.count}', style: AppTypography.labelMedium),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: Spacing.xxl),

            // Section Comparison table
            Text(l10n.analyticsSectionComparison,
                style: AppTypography.heading3),
            const SizedBox(height: Spacing.md),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(Radii.lg),
                border: Border.all(color: AppColors.border),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: Spacing.xl,
                  columns: [
                    DataColumn(
                        label: Text(l10n.analyticsClass,
                            style: AppTypography.labelMedium)),
                    DataColumn(
                        label: Text(l10n.analyticsAvgScore,
                            style: AppTypography.labelMedium)),
                    DataColumn(
                        label: Text(l10n.analyticsOnTrack,
                            style: AppTypography.labelMedium)),
                  ],
                  rows: sections
                      .map(
                        (s) => DataRow(cells: [
                          DataCell(Text(s.className,
                              style: AppTypography.bodyMedium)),
                          DataCell(Text('${s.avgScore.toStringAsFixed(1)}%',
                              style: AppTypography.bodyMedium)),
                          DataCell(Text('${s.onTrackPercent}%',
                              style: AppTypography.bodyMedium)),
                        ]),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _levelColor(String level) {
    switch (level) {
      case 'Non-reader':
        return AppColors.error;
      case 'Frustration':
        return AppColors.secondary;
      case 'Instructional':
        return AppColors.primary;
      case 'Independent':
        return AppColors.success;
      default:
        return AppColors.textSecondary;
    }
  }
}
