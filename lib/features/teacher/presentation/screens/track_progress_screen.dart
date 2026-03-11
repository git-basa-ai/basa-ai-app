import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../../../shared/utils/constants.dart';
import '../providers/learner_progress_provider.dart';

/// Track Learner Progress Screen — detailed per-learner view.
class TrackProgressScreen extends ConsumerWidget {
  const TrackProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final detail = ref.watch(learnerDetailProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          l10n.trackProgressTitle,
          style:
              AppTypography.heading3.copyWith(color: AppColors.textOnPrimary),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Learner header card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(Spacing.xl),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(Radii.xl),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        detail.name[0],
                        style: AppTypography.heading2.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: Spacing.md),
                  Text(detail.name, style: AppTypography.heading3),
                  Text('LRN: ${detail.lrn}',
                      style: AppTypography.bodySecondary),
                  Text(detail.gradeSection, style: AppTypography.bodySecondary),
                  const SizedBox(height: Spacing.sm),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Spacing.md,
                      vertical: Spacing.xs,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(Radii.pill),
                    ),
                    child: Text(
                      detail.readingLevel,
                      style: AppTypography.labelMedium.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: Spacing.xxl),

            // Lessons completed progress bar
            Text(l10n.trackProgressLessonsCompleted,
                style: AppTypography.heading3),
            const SizedBox(height: Spacing.md),
            Container(
              padding: const EdgeInsets.all(Spacing.lg),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(Radii.lg),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                children: [
                  Text(
                    l10n.trackProgressOf(
                        detail.lessonsCompleted, detail.totalLessons),
                    style: AppTypography.bodyLarge,
                  ),
                  const SizedBox(height: Spacing.md),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(Radii.pill),
                    child: LinearProgressIndicator(
                      value: detail.lessonsCompleted / detail.totalLessons,
                      minHeight: 12,
                      backgroundColor: AppColors.border,
                      color: AppColors.success,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: Spacing.xxl),

            // Average score + trend
            Text(l10n.trackProgressAvgScore, style: AppTypography.heading3),
            const SizedBox(height: Spacing.md),
            Container(
              padding: const EdgeInsets.all(Spacing.lg),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(Radii.lg),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${detail.avgScore.toStringAsFixed(1)}%',
                    style: AppTypography.heading1.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: Spacing.md),
                  Icon(
                    detail.isImproving
                        ? Icons.trending_up_rounded
                        : Icons.trending_down_rounded,
                    color: detail.isImproving
                        ? AppColors.success
                        : AppColors.error,
                    size: 28,
                  ),
                ],
              ),
            ),
            const SizedBox(height: Spacing.xxl),

            // Activity log
            Text(l10n.trackProgressActivityLog, style: AppTypography.heading3),
            const SizedBox(height: Spacing.md),
            ...detail.activityLog.map(
              (entry) => Padding(
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
                      Text(entry.date, style: AppTypography.bodySecondary),
                      const SizedBox(width: Spacing.md),
                      Expanded(
                        child: Text(entry.lesson,
                            style: AppTypography.labelMedium),
                      ),
                      Text(
                        '${entry.score}%',
                        style: AppTypography.labelMedium.copyWith(
                          color: entry.score >= 70
                              ? AppColors.success
                              : AppColors.error,
                        ),
                      ),
                      const SizedBox(width: Spacing.md),
                      Text(entry.duration, style: AppTypography.bodySecondary),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: Spacing.xxl),

            // Action links
            SizedBox(
              width: double.infinity,
              height: TouchTargets.buttonHeight,
              child: OutlinedButton.icon(
                onPressed: () => context.push('/teacher/words'),
                icon: const Icon(Icons.abc_rounded),
                label: Text(l10n.trackProgressViewWords),
              ),
            ),
            const SizedBox(height: Spacing.md),
            SizedBox(
              width: double.infinity,
              height: TouchTargets.buttonHeight,
              child: OutlinedButton.icon(
                onPressed: () => context.push('/teacher/feedback'),
                icon: const Icon(Icons.note_add_outlined),
                label: Text(l10n.trackProgressAddFeedback),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
