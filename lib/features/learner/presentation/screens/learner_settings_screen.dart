import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../../../shared/utils/constants.dart';
import '../../../../shared/providers/settings_provider.dart';

/// Learner Settings Screen — volume, language, music, high contrast.
class LearnerSettingsScreen extends ConsumerWidget {
  const LearnerSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final settings = ref.watch(settingsProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          l10n.learnerSettingsTitle,
          style:
              AppTypography.heading3.copyWith(color: AppColors.textOnPrimary),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Volume slider
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(Spacing.lg),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(Radii.lg),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.learnerSettingsVolume,
                      style: AppTypography.labelMedium),
                  Slider(
                    value: settings.volume,
                    onChanged: (v) =>
                        ref.read(settingsProvider.notifier).setVolume(v),
                    activeColor: AppColors.primary,
                  ),
                ],
              ),
            ),
            const SizedBox(height: Spacing.lg),

            // Language toggle
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(Spacing.lg),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(Radii.lg),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.learnerSettingsLanguage,
                      style: AppTypography.labelMedium),
                  const SizedBox(height: Spacing.md),
                  Row(
                    children: [
                      ChoiceChip(
                        label: Text(l10n.appSettingsLanguageEnglish),
                        selected: settings.language == 'English',
                        onSelected: (_) => ref
                            .read(settingsProvider.notifier)
                            .setLanguage('English'),
                        selectedColor: AppColors.primary.withOpacity(0.15),
                      ),
                      const SizedBox(width: Spacing.md),
                      ChoiceChip(
                        label: Text(l10n.appSettingsLanguageFilipino),
                        selected: settings.language == 'Filipino',
                        onSelected: (_) => ref
                            .read(settingsProvider.notifier)
                            .setLanguage('Filipino'),
                        selectedColor: AppColors.primary.withOpacity(0.15),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: Spacing.lg),

            // Background Music toggle
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(Spacing.lg),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(Radii.lg),
                border: Border.all(color: AppColors.border),
              ),
              child: SwitchListTile(
                title: Text(l10n.learnerSettingsMusic,
                    style: AppTypography.labelMedium),
                value: settings.backgroundMusic,
                onChanged: (_) =>
                    ref.read(settingsProvider.notifier).toggleMusic(),
                activeColor: AppColors.primary,
                contentPadding: EdgeInsets.zero,
              ),
            ),
            const SizedBox(height: Spacing.lg),

            // High contrast toggle
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(Spacing.lg),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(Radii.lg),
                border: Border.all(color: AppColors.border),
              ),
              child: SwitchListTile(
                title: Text(l10n.learnerSettingsHighContrast,
                    style: AppTypography.labelMedium),
                value: settings.highContrast,
                onChanged: (_) =>
                    ref.read(settingsProvider.notifier).toggleHighContrast(),
                activeColor: AppColors.primary,
                contentPadding: EdgeInsets.zero,
              ),
            ),
            const SizedBox(height: Spacing.xxl),

            // Back to Home button
            SizedBox(
              width: double.infinity,
              height: TouchTargets.buttonHeight,
              child: OutlinedButton(
                onPressed: () => context.pop(),
                child: Text(l10n.learnerSettingsBackToHome),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
