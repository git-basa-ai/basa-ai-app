import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../../../shared/utils/constants.dart';
import '../../../../shared/widgets/bibo_mascot.dart';

/// Hub screen listing all available games (quizzes, dictionary, etc.).
class GamesHubScreen extends StatelessWidget {
  const GamesHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          l10n.gamesHubTitle,
          style:
              AppTypography.heading3.copyWith(color: AppColors.textOnPrimary),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(Spacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BiboMascot(
                message: l10n.gamesHubBiboMessage,
                mood: BiboMood.happy,
                size: BiboSize.medium,
              ),
              const SizedBox(height: Spacing.xxl),
              _GameCard(
                icon: Icons.quiz_rounded,
                color: AppColors.secondary,
                title: l10n.gamesHubQuizTitle,
                description: l10n.gamesHubQuizDescription,
                onTap: () => context.push('/learner/quiz/lesson-aa'),
              ),
              const SizedBox(height: Spacing.md),
              _GameCard(
                icon: Icons.auto_stories_rounded,
                color: AppColors.primary,
                title: l10n.gamesHubDictionaryTitle,
                description: l10n.gamesHubDictionaryDescription,
                onTap: () => context.push('/learner/dictionary'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GameCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String description;
  final VoidCallback onTap;

  const _GameCard({
    required this.icon,
    required this.color,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(Radii.lg),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(Radii.lg),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(Spacing.lg),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(Radii.md),
                ),
                child: Icon(icon, color: color, size: 32),
              ),
              const SizedBox(width: Spacing.lg),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppTypography.labelLarge),
                    const SizedBox(height: Spacing.xs),
                    Text(description, style: AppTypography.bodySecondary),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: AppColors.textSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
