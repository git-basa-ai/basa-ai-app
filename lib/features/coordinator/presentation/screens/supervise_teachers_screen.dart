import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../../../shared/utils/constants.dart';
import '../providers/teacher_supervision_provider.dart';

/// Supervise Teachers Screen — coordinator views all teachers and their stats.
class SuperviseTeachersScreen extends ConsumerWidget {
  const SuperviseTeachersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final teachers = ref.watch(teacherSupervisionProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          l10n.superviseTitle,
          style:
              AppTypography.heading3.copyWith(color: AppColors.textOnPrimary),
        ),
      ),
      body: teachers.isEmpty
          ? Center(
              child: Text(l10n.superviseEmpty, style: AppTypography.bodyLarge),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(Spacing.lg),
              itemCount: teachers.length,
              separatorBuilder: (_, __) => const SizedBox(height: Spacing.sm),
              itemBuilder: (context, index) {
                final teacher = teachers[index];
                return Container(
                  padding: const EdgeInsets.all(Spacing.lg),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(Radii.lg),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
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
                                Text(teacher.className,
                                    style: AppTypography.bodySecondary),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: Spacing.md),
                      Row(
                        children: [
                          _MiniStat(
                            label: 'On Track',
                            value: '${teacher.onTrack}',
                            color: AppColors.success,
                          ),
                          const SizedBox(width: Spacing.sm),
                          _MiniStat(
                            label: 'Needs Help',
                            value: '${teacher.needsHelp}',
                            color: AppColors.secondary,
                          ),
                          const SizedBox(width: Spacing.sm),
                          _MiniStat(
                            label: 'Non-readers',
                            value: '${teacher.nonReaders}',
                            color: AppColors.error,
                          ),
                        ],
                      ),
                      const SizedBox(height: Spacing.sm),
                      Text(
                        l10n.superviseLastLogin(teacher.lastLogin),
                        style: AppTypography.bodySecondary,
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _MiniStat({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: Spacing.sm,
          horizontal: Spacing.sm,
        ),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(Radii.sm),
        ),
        child: Column(
          children: [
            Text(value, style: AppTypography.labelLarge.copyWith(color: color)),
            Text(
              label,
              style: AppTypography.bodySecondary.copyWith(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
