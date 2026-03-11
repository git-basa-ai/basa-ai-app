import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../../../shared/utils/constants.dart';
import '../../../../shared/widgets/bibo_mascot.dart';
import '../../../../shared/widgets/role_button.dart';

/// Role Selection Screen — entry point for the app.
///
/// Three role buttons: Learner, Teacher, Coordinator.
/// Utility icons: Help, Leaderboard, Settings.
class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(Spacing.xxl),
          child: Column(
            children: [
              const SizedBox(height: Spacing.xxxl),
              // Logo & title
              Text(
                l10n.roleSelectionTitle,
                style: AppTypography.heading1.copyWith(
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: Spacing.sm),
              Text(
                l10n.roleSelectionSubtitle,
                style: AppTypography.bodySecondary,
              ),
              const SizedBox(height: Spacing.xxl),
              const BiboMascot(
                mood: BiboMood.happy,
                size: BiboSize.medium,
                message: '',
                showBubble: false,
              ),
              const SizedBox(height: Spacing.xxxl),

              // Role buttons
              RoleButton(
                icon: Iconsax.book,
                label: l10n.roleSelectionLearner,
                color: AppColors.primary,
                onTap: () => context.go('/login/learner'),
              ),
              const SizedBox(height: Spacing.lg),
              RoleButton(
                icon: Iconsax.teacher,
                label: l10n.roleSelectionTeacher,
                color: AppColors.secondary,
                onTap: () => context.go('/login/teacher'),
              ),
              const SizedBox(height: Spacing.lg),
              RoleButton(
                icon: Iconsax.chart_square,
                label: l10n.roleSelectionCoordinator,
                color: AppColors.success,
                onTap: () => context.go('/coordinator-login'),
              ),
              const SizedBox(height: Spacing.xxxl),

              // Utility icons row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _UtilityButton(
                    icon: Iconsax.info_circle,
                    onTap: () => context.push('/help'),
                  ),
                  const SizedBox(width: Spacing.xxl),
                  _UtilityButton(
                    icon: Iconsax.cup,
                    onTap: () => context.push('/leaderboard'),
                  ),
                  const SizedBox(width: Spacing.xxl),
                  _UtilityButton(
                    icon: Iconsax.setting_2,
                    onTap: () => context.push('/settings'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _UtilityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _UtilityButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(icon, color: AppColors.textSecondary),
      iconSize: 28,
      style: IconButton.styleFrom(
        backgroundColor: AppColors.surface,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(Spacing.md),
      ),
    );
  }
}
