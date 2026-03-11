import 'package:flutter/material.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../../../shared/utils/constants.dart';
import '../../../../shared/widgets/bibo_mascot.dart';

/// Mouth movement guide screen showing a camera overlay with lip diagram
/// to help learners practice phoneme articulation.
class MouthGuideScreen extends StatelessWidget {
  /// The phoneme to demonstrate.
  final String phoneme;

  const MouthGuideScreen({super.key, required this.phoneme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Mouth Guide',
          style:
              AppTypography.heading3.copyWith(color: AppColors.textOnPrimary),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Spacing.lg),
          child: Column(
            children: [
              const SizedBox(height: Spacing.lg),
              // Phoneme label
              Text(
                'How to say "$phoneme"',
                style:
                    AppTypography.heading2.copyWith(color: AppColors.primary),
              ),
              const SizedBox(height: Spacing.xl),
              // Camera / face mesh placeholder
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(Radii.lg),
                    border: Border.all(
                      color: AppColors.primary.withOpacity(0.2),
                      width: 2,
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Camera feed placeholder
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.face_retouching_natural,
                            size: 80,
                            color: AppColors.primary.withOpacity(0.3),
                          ),
                          const SizedBox(height: Spacing.md),
                          Text(
                            'Camera Preview',
                            style: AppTypography.bodySecondary,
                          ),
                          const SizedBox(height: Spacing.xs),
                          Text(
                            'Face Mesh overlay will appear here',
                            style: AppTypography.bodySecondary.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      // Lip diagram overlay placeholder
                      Positioned(
                        bottom: Spacing.lg,
                        right: Spacing.lg,
                        child: Container(
                          padding: const EdgeInsets.all(Spacing.sm),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(Radii.md),
                          ),
                          child: const Icon(
                            Icons.sentiment_satisfied_alt,
                            size: 32,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: Spacing.xl),
              // Lip diagram reference card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(Spacing.lg),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(Radii.lg),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tips',
                      style: AppTypography.labelLarge,
                    ),
                    const SizedBox(height: Spacing.sm),
                    _TipRow(text: 'Watch how the mouth moves for "$phoneme"'),
                    const _TipRow(
                        text: 'Open your mouth wide and follow along'),
                    const _TipRow(text: 'Try saying it slowly first'),
                  ],
                ),
              ),
              const SizedBox(height: Spacing.xl),
              // Bibo encouragement
              const BiboMascot(
                mood: BiboMood.happy,
                size: BiboSize.small,
                message: 'Follow me! Watch how my mouth moves.',
              ),
              const SizedBox(height: Spacing.lg),
            ],
          ),
        ),
      ),
    );
  }
}

class _TipRow extends StatelessWidget {
  final String text;

  const _TipRow({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Spacing.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle_outline,
              size: 18, color: AppColors.success),
          const SizedBox(width: Spacing.sm),
          Expanded(
            child: Text(text, style: AppTypography.bodyLarge),
          ),
        ],
      ),
    );
  }
}
