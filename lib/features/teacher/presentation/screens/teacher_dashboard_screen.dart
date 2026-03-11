import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../../../shared/utils/constants.dart';
import '../../../../shared/widgets/offline_banner.dart';
import '../providers/teacher_provider.dart';

/// Teacher dashboard with class stats, selector pills, and activity feed.
class TeacherDashboardScreen extends ConsumerWidget {
  const TeacherDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final classes = ref.watch(classListProvider);
    final selectedIndex = ref.watch(selectedClassIndexProvider);
    final selectedClass = ref.watch(selectedClassProvider);
    final activity = ref.watch(activityFeedProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          l10n.teacherDashboardTitle,
          style:
              AppTypography.heading3.copyWith(color: AppColors.textOnPrimary),
        ),
      ),
      body: Column(
        children: [
          const OfflineBanner(isOffline: false),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(Spacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Class selector pill row.
                  SizedBox(
                    height: TouchTargets.buttonHeight,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: classes.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(width: Spacing.sm),
                      itemBuilder: (context, index) {
                        final isSelected = index == selectedIndex;
                        return FilterChip(
                          label: Text(classes[index].name),
                          selected: isSelected,
                          onSelected: (_) => ref
                              .read(selectedClassIndexProvider.notifier)
                              .state = index,
                          labelStyle: AppTypography.labelMedium.copyWith(
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.textSecondary,
                          ),
                          selectedColor: AppColors.primary.withOpacity(0.15),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: Spacing.xxl),

                  // Summary stats card.
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(Spacing.xl),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(Radii.xl),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.08),
                          blurRadius: Spacing.lg,
                          offset: const Offset(0, Spacing.xs),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          l10n.teacherDashboardTotalLearners(
                              selectedClass.totalLearners),
                          style: AppTypography.heading2,
                        ),
                        const SizedBox(height: Spacing.lg),
                        Row(
                          children: [
                            _StatChip(
                              label: l10n.teacherDashboardOnTrack,
                              value: selectedClass.onTrack,
                              color: AppColors.success,
                            ),
                            const SizedBox(width: Spacing.sm),
                            _StatChip(
                              label: l10n.teacherDashboardNeedsHelp,
                              value: selectedClass.needsHelp,
                              color: AppColors.secondary,
                            ),
                            const SizedBox(width: Spacing.sm),
                            _StatChip(
                              label: l10n.teacherDashboardNonReaders,
                              value: selectedClass.nonReaders,
                              color: AppColors.error,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: Spacing.xxl),

                  // Recent activity feed.
                  Text(l10n.teacherDashboardRecentActivity,
                      style: AppTypography.heading3),
                  const SizedBox(height: Spacing.md),
                  ...activity.map(
                    (event) => Padding(
                      padding: const EdgeInsets.only(bottom: Spacing.md),
                      child: Container(
                        padding: const EdgeInsets.all(Spacing.lg),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(Radii.md),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: AppColors.primary.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  event.learnerName.substring(0, 1),
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
                                  Text(event.learnerName,
                                      style: AppTypography.labelMedium),
                                  Text(event.description,
                                      style: AppTypography.bodySecondary),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: Spacing.lg),

                  // Quick-action buttons.
                  Row(
                    children: [
                      Expanded(
                        child: _QuickActionButton(
                          label: l10n.teacherManageLearners,
                          icon: Icons.people_outline_rounded,
                          onTap: () => context.push('/teacher/manage'),
                        ),
                      ),
                      const SizedBox(width: Spacing.sm),
                      Expanded(
                        child: _QuickActionButton(
                          label: l10n.teacherViewProgress,
                          icon: Icons.trending_up_rounded,
                          onTap: () => context.push('/teacher/track-progress'),
                        ),
                      ),
                      const SizedBox(width: Spacing.sm),
                      Expanded(
                        child: _QuickActionButton(
                          label: l10n.teacherGenerateReport,
                          icon: Icons.description_outlined,
                          onTap: () => context.go('/teacher/report'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: Spacing.lg),

                  // View Full Report button.
                  SizedBox(
                    width: double.infinity,
                    height: TouchTargets.buttonHeight,
                    child: ElevatedButton(
                      onPressed: () => context.go('/teacher/report'),
                      child: Text(l10n.teacherDashboardViewReport),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  final String label;
  final int value;
  final Color color;

  const _StatChip({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: Spacing.md,
          horizontal: Spacing.sm,
        ),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(Radii.md),
        ),
        child: Column(
          children: [
            Text(
              '$value',
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
      ),
    );
  }
}

class _QuickActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _QuickActionButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: Spacing.md,
          horizontal: Spacing.sm,
        ),
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.08),
          borderRadius: BorderRadius.circular(Radii.md),
        ),
        child: Column(
          children: [
            Icon(icon, color: AppColors.primary, size: 24),
            const SizedBox(height: Spacing.xs),
            Text(
              label,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
