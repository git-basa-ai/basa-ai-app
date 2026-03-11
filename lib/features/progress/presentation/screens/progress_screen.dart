import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../../../shared/utils/constants.dart';
import '../../../../shared/widgets/bibo_mascot.dart';
import '../../../../shared/widgets/xp_bar.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../providers/progress_provider.dart';

/// Progress / profile screen with level badge, XP, lessons, and achievements.
class ProgressScreen extends ConsumerWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final progress = ref.watch(progressProvider);
    final achievements = ref.watch(achievementsProvider);
    final struggleWords = ref.watch(struggleWordsProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          l10n.progressTitle,
          style:
              AppTypography.heading3.copyWith(color: AppColors.textOnPrimary),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bibo.
            BiboMascot(
              message: l10n.progressBiboMessage,
              mood: BiboMood.celebrating,
              size: BiboSize.medium,
            ),
            const SizedBox(height: Spacing.xxl),

            // Level badge + XP bar.
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(Spacing.xl),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(Radii.xl),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.xpGold.withOpacity(0.15),
                    blurRadius: Spacing.xl,
                    offset: const Offset(0, Spacing.xs),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Level circle.
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [AppColors.xpGold, AppColors.xpGoldLight],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        l10n.progressLevel(progress.level),
                        style: AppTypography.labelLarge.copyWith(
                          color: AppColors.textPrimary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: Spacing.lg),
                  XpBar(
                    currentXp: progress.totalXp,
                    maxXp: progress.xpForNextLevel,
                    level: progress.level,
                  ),
                  const SizedBox(height: Spacing.sm),
                  Text(
                    l10n.progressNextLevel(progress.xpForNextLevel),
                    style: AppTypography.bodySecondary,
                  ),
                ],
              ),
            ),
            const SizedBox(height: Spacing.xxl),

            // Completed lessons.
            Text(l10n.progressCompletedLessons, style: AppTypography.heading3),
            const SizedBox(height: Spacing.md),
            ...progress.completedLessonIds.map(
              (id) => Padding(
                padding: const EdgeInsets.only(bottom: Spacing.sm),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.lg,
                    vertical: Spacing.md,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(Radii.md),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.check_circle_rounded,
                          color: AppColors.success, size: 24),
                      const SizedBox(width: Spacing.md),
                      Text(id, style: AppTypography.bodyLarge),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: Spacing.xxl),

            // Struggle words.
            Text(l10n.progressStruggleWords, style: AppTypography.heading3),
            const SizedBox(height: Spacing.md),
            if (struggleWords.isEmpty)
              Text('No struggle words yet!',
                  style: AppTypography.bodySecondary),
            Wrap(
              spacing: Spacing.sm,
              runSpacing: Spacing.sm,
              children: struggleWords
                  .map(
                    (sw) => Chip(
                      label: Text(sw.word, style: AppTypography.labelMedium),
                      backgroundColor: AppColors.error.withOpacity(0.1),
                      side: BorderSide(
                        color: AppColors.error.withOpacity(0.3),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: Spacing.xxl),

            // Achievement badges.
            Text(l10n.progressAchievements, style: AppTypography.heading3),
            const SizedBox(height: Spacing.md),
            SizedBox(
              height: 120,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: achievements.length,
                separatorBuilder: (_, __) => const SizedBox(width: Spacing.md),
                itemBuilder: (context, index) {
                  final ach = achievements[index];
                  return Container(
                    width: 80,
                    padding: const EdgeInsets.all(Spacing.sm),
                    decoration: BoxDecoration(
                      color: ach.earned
                          ? AppColors.xpGold.withOpacity(0.15)
                          : AppColors.border.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(Radii.lg),
                      border: Border.all(
                        color: ach.earned ? AppColors.xpGold : AppColors.border,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(ach.icon, style: const TextStyle(fontSize: 28)),
                        const SizedBox(height: Spacing.xs),
                        Text(
                          ach.title,
                          style: AppTypography.bodyMedium.copyWith(
                            color: ach.earned
                                ? AppColors.textPrimary
                                : AppColors.textSecondary,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: Spacing.xxl),

            // Logout.
            SizedBox(
              width: double.infinity,
              height: TouchTargets.buttonHeight,
              child: OutlinedButton.icon(
                onPressed: () => _showLogoutDialog(context, ref, l10n),
                icon: const Icon(Icons.logout_rounded, color: AppColors.error),
                label: Text(
                  l10n.logoutButton,
                  style: AppTypography.labelLarge.copyWith(
                    color: AppColors.error,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.error),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Radii.md),
                  ),
                ),
              ),
            ),
            const SizedBox(height: Spacing.xxxl),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
  ) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.logoutTitle, style: AppTypography.heading3),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const BiboMascot(
              mood: BiboMood.encouraging,
              size: BiboSize.small,
              message: '',
              showBubble: false,
            ),
            const SizedBox(height: Spacing.md),
            Text(l10n.logoutConfirmation, style: AppTypography.bodyLarge),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(l10n.logoutCancel),
          ),
          FilledButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              ref.read(authProvider.notifier).logout();
              context.go('/role-selection');
            },
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.error,
            ),
            child: Text(l10n.logoutButton),
          ),
        ],
      ),
    );
  }
}
