import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../../../shared/utils/constants.dart';
import '../../../../shared/widgets/bibo_mascot.dart';
import '../../../auth/presentation/providers/auth_provider.dart';

/// Coordinator profile screen with account info, quick stats, and logout.
class CoordinatorProfileScreen extends ConsumerWidget {
  const CoordinatorProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          l10n.coordinatorProfileTitle,
          style:
              AppTypography.heading3.copyWith(color: AppColors.textOnPrimary),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          children: [
            const SizedBox(height: Spacing.lg),

            // Avatar
            Container(
              width: 88,
              height: 88,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    AppColors.success,
                    AppColors.success.withOpacity(0.7),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Text(
                  l10n.coordinatorProfileName[0],
                  style: AppTypography.heading1.copyWith(
                    color: AppColors.textOnPrimary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: Spacing.lg),
            Text(l10n.coordinatorProfileName, style: AppTypography.heading2),
            const SizedBox(height: Spacing.xs),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.lg,
                vertical: Spacing.xs,
              ),
              decoration: BoxDecoration(
                color: AppColors.success.withOpacity(0.12),
                borderRadius: BorderRadius.circular(Radii.pill),
              ),
              child: Text(
                l10n.coordinatorProfileRole,
                style: AppTypography.labelMedium.copyWith(
                  color: AppColors.success,
                ),
              ),
            ),
            const SizedBox(height: Spacing.xxxl),

            // Stats row
            Row(
              children: [
                _ProfileStat(
                  icon: Iconsax.building,
                  label: l10n.coordinatorProfileSchoolsLabel,
                  value: l10n.coordinatorProfileSchoolsValue,
                  color: AppColors.primary,
                ),
                const SizedBox(width: Spacing.md),
                _ProfileStat(
                  icon: Iconsax.teacher,
                  label: l10n.coordinatorProfileTeachersLabel,
                  value: l10n.coordinatorProfileTeachersValue,
                  color: AppColors.secondary,
                ),
              ],
            ),
            const SizedBox(height: Spacing.xxxl),

            // Action tiles
            _ActionTile(
              icon: Iconsax.setting_2,
              label: l10n.appSettingsTitle,
              onTap: () => context.push('/settings'),
            ),
            const SizedBox(height: Spacing.sm),
            _ActionTile(
              icon: Iconsax.info_circle,
              label: l10n.helpGuideTitle,
              onTap: () => context.push('/help'),
            ),
            const SizedBox(height: Spacing.xxxl),

            // Logout
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

class _ProfileStat extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _ProfileStat({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(Spacing.xl),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(Radii.lg),
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: Spacing.sm),
            Text(
              value,
              style: AppTypography.heading2.copyWith(color: color),
            ),
            const SizedBox(height: Spacing.xs),
            Text(
              label,
              style: AppTypography.bodySecondary,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionTile({
    required this.icon,
    required this.label,
    required this.onTap,
  });

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
            Icon(icon, color: AppColors.textSecondary),
            const SizedBox(width: Spacing.lg),
            Expanded(
              child: Text(label, style: AppTypography.labelMedium),
            ),
            const Icon(
              Iconsax.arrow_right_3,
              color: AppColors.textSecondary,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
