import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../../../shared/utils/constants.dart';
import '../../../../shared/widgets/offline_banner.dart';
import '../providers/report_provider.dart';

/// Teacher screen for managing and viewing enrolled learners.
class LearnerManagementScreen extends ConsumerWidget {
  const LearnerManagementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reports = ref.watch(reportProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Manage Learners',
          style:
              AppTypography.heading3.copyWith(color: AppColors.textOnPrimary),
        ),
      ),
      body: Column(
        children: [
          const OfflineBanner(isOffline: false),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(Spacing.lg),
              itemCount: reports.length,
              separatorBuilder: (_, __) => const SizedBox(height: Spacing.md),
              itemBuilder: (context, index) {
                final learner = reports[index];
                return Container(
                  padding: const EdgeInsets.all(Spacing.lg),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(Radii.lg),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            learner.name.substring(0, 1),
                            style: AppTypography.heading3.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: Spacing.lg),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(learner.name, style: AppTypography.labelLarge),
                            Text(
                              '${learner.lessonsCompleted} lessons completed',
                              style: AppTypography.bodySecondary,
                            ),
                          ],
                        ),
                      ),
                      _StatusDot(status: learner.status),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusDot extends StatelessWidget {
  final String status;

  const _StatusDot({required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;
    switch (status) {
      case 'on-track':
        color = AppColors.success;
      case 'needs-help':
        color = AppColors.secondary;
      case 'non-reader':
        color = AppColors.error;
      default:
        color = AppColors.textSecondary;
    }

    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
