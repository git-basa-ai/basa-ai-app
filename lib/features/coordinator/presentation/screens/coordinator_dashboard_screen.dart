import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../../../shared/utils/constants.dart';
import '../../../../shared/widgets/stat_summary_card.dart';
import '../providers/coordinator_provider.dart';

/// Coordinator Dashboard Screen — school-wide program overview.
class CoordinatorDashboardScreen extends ConsumerWidget {
  const CoordinatorDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final overview = ref.watch(coordinatorOverviewProvider);
    final teachers = ref.watch(coordinatorTeachersProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          l10n.coordinatorDashboardTitle,
          style:
              AppTypography.heading3.copyWith(color: AppColors.textOnPrimary),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stat summary row
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: Spacing.md,
              mainAxisSpacing: Spacing.md,
              childAspectRatio: 1.25,
              children: [
                StatSummaryCard(
                  label: l10n.coordinatorTotalLearners,
                  value: '${overview.totalLearners}',
                  color: AppColors.primary,
                  icon: Icons.people_outline_rounded,
                ),
                StatSummaryCard(
                  label: l10n.coordinatorTotalTeachers,
                  value: '${overview.totalTeachers}',
                  color: AppColors.secondary,
                  icon: Icons.school_outlined,
                ),
                StatSummaryCard(
                  label: l10n.coordinatorTotalClasses,
                  value: '${overview.totalClasses}',
                  color: AppColors.success,
                  icon: Icons.class_outlined,
                ),
                StatSummaryCard(
                  label: l10n.coordinatorAvgScore,
                  value: '${overview.avgScore.toStringAsFixed(1)}%',
                  color: AppColors.xpGold,
                  icon: Icons.score_outlined,
                ),
              ],
            ),
            const SizedBox(height: Spacing.xxl),

            // Program health indicator
            Text(l10n.coordinatorProgramHealth, style: AppTypography.heading3),
            const SizedBox(height: Spacing.md),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(Spacing.xl),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(Radii.lg),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                children: [
                  Text(
                    l10n.coordinatorOnTrackPercent(overview.onTrackPercent),
                    style: AppTypography.heading2.copyWith(
                      color: AppColors.success,
                    ),
                  ),
                  const SizedBox(height: Spacing.md),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(Radii.pill),
                    child: LinearProgressIndicator(
                      value: overview.onTrackPercent / 100,
                      minHeight: 12,
                      backgroundColor: AppColors.border,
                      color: AppColors.success,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: Spacing.xxl),

            // Teachers list
            Text(l10n.coordinatorTeacherList, style: AppTypography.heading3),
            const SizedBox(height: Spacing.md),
            ...teachers.map(
              (teacher) => Padding(
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
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: AppColors.secondary.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            teacher.name[0],
                            style: AppTypography.labelLarge.copyWith(
                              color: AppColors.secondary,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: Spacing.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(teacher.name,
                                style: AppTypography.labelMedium),
                            Text(
                              '${teacher.classCount} classes · ${teacher.learnerCount} learners',
                              style: AppTypography.bodySecondary,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        teacher.lastActive,
                        style: AppTypography.bodySecondary,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: Spacing.xxl),

            // View All Analytics button
            SizedBox(
              width: double.infinity,
              height: TouchTargets.buttonHeight,
              child: ElevatedButton(
                onPressed: () => context.push('/coordinator/analytics'),
                child: Text(l10n.coordinatorViewAnalytics),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
