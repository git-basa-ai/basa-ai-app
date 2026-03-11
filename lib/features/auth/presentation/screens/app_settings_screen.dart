import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../../../shared/utils/constants.dart';
import '../../../../shared/providers/settings_provider.dart';

/// App Settings Screen — accessible from all roles.
///
/// Volume slider, language toggle, background music on/off, high contrast toggle.
class AppSettingsScreen extends ConsumerWidget {
  const AppSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final settings = ref.watch(settingsProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          l10n.appSettingsTitle,
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
            _SettingsSection(
              title: l10n.appSettingsVolume,
              child: Slider(
                value: settings.volume,
                onChanged: (v) =>
                    ref.read(settingsProvider.notifier).setVolume(v),
                activeColor: AppColors.primary,
              ),
            ),
            const SizedBox(height: Spacing.xxl),

            // Language toggle
            _SettingsSection(
              title: l10n.appSettingsLanguage,
              child: Row(
                children: [
                  ChoiceChip(
                    label: Text(l10n.appSettingsLanguageEnglish),
                    selected: settings.language == 'English',
                    onSelected: (_) => ref
                        .read(settingsProvider.notifier)
                        .setLanguage('English'),
                    selectedColor: AppColors.primary.withOpacity(0.15),
                    labelStyle: AppTypography.labelMedium.copyWith(
                      color: settings.language == 'English'
                          ? AppColors.primary
                          : AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(width: Spacing.md),
                  ChoiceChip(
                    label: Text(l10n.appSettingsLanguageFilipino),
                    selected: settings.language == 'Filipino',
                    onSelected: (_) => ref
                        .read(settingsProvider.notifier)
                        .setLanguage('Filipino'),
                    selectedColor: AppColors.primary.withOpacity(0.15),
                    labelStyle: AppTypography.labelMedium.copyWith(
                      color: settings.language == 'Filipino'
                          ? AppColors.primary
                          : AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: Spacing.xxl),

            // Background music toggle
            _SettingsSection(
              title: l10n.appSettingsBackgroundMusic,
              child: SwitchListTile(
                value: settings.backgroundMusic,
                onChanged: (_) =>
                    ref.read(settingsProvider.notifier).toggleMusic(),
                activeColor: AppColors.primary,
                contentPadding: EdgeInsets.zero,
                title: Text(
                  settings.backgroundMusic ? 'On' : 'Off',
                  style: AppTypography.bodyMedium,
                ),
              ),
            ),
            const SizedBox(height: Spacing.xxl),

            // High contrast toggle
            _SettingsSection(
              title: l10n.appSettingsHighContrast,
              child: SwitchListTile(
                value: settings.highContrast,
                onChanged: (_) =>
                    ref.read(settingsProvider.notifier).toggleHighContrast(),
                activeColor: AppColors.primary,
                contentPadding: EdgeInsets.zero,
                title: Text(
                  settings.highContrast ? 'On' : 'Off',
                  style: AppTypography.bodyMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  final String title;
  final Widget child;

  const _SettingsSection({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTypography.heading3),
        const SizedBox(height: Spacing.md),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(Spacing.lg),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(Radii.lg),
            border: Border.all(color: AppColors.border),
          ),
          child: child,
        ),
      ],
    );
  }
}
