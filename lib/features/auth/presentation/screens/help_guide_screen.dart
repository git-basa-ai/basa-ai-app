import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../../../shared/utils/constants.dart';

/// Help & Guide Menu — scrollable card list of 6 guide categories.
class HelpGuideScreen extends StatelessWidget {
  const HelpGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final categories = [
      _GuideCategory(
        icon: Iconsax.microphone,
        title: l10n.helpGuideSoundDetection,
        description: l10n.helpGuideSoundDetectionDesc,
        color: AppColors.primary,
      ),
      _GuideCategory(
        icon: Iconsax.book_1,
        title: l10n.helpGuideStorytelling,
        description: l10n.helpGuideStorytellingDesc,
        color: AppColors.secondary,
      ),
      _GuideCategory(
        icon: Iconsax.scan_barcode,
        title: l10n.helpGuideQrStories,
        description: l10n.helpGuideQrStoriesDesc,
        color: AppColors.success,
      ),
      _GuideCategory(
        icon: Iconsax.emoji_happy,
        title: l10n.helpGuideMouthDetection,
        description: l10n.helpGuideMouthDetectionDesc,
        color: AppColors.primaryLight,
      ),
      _GuideCategory(
        icon: Iconsax.image,
        title: l10n.helpGuidePictureDictionary,
        description: l10n.helpGuidePictureDictionaryDesc,
        color: AppColors.secondaryLight,
      ),
      _GuideCategory(
        icon: Iconsax.lamp_charge,
        title: l10n.helpGuideGeneralTips,
        description: l10n.helpGuideGeneralTipsDesc,
        color: AppColors.xpGold,
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          l10n.helpGuideTitle,
          style:
              AppTypography.heading3.copyWith(color: AppColors.textOnPrimary),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(Spacing.lg),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(height: Spacing.md),
        itemBuilder: (context, index) {
          final cat = categories[index];
          return _GuideCategoryCard(category: cat);
        },
      ),
    );
  }
}

class _GuideCategory {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  const _GuideCategory({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });
}

class _GuideCategoryCard extends StatelessWidget {
  final _GuideCategory category;

  const _GuideCategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Spacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(Radii.lg),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: category.color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(Radii.md),
            ),
            child: Icon(category.icon, color: category.color, size: 24),
          ),
          const SizedBox(width: Spacing.lg),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(category.title, style: AppTypography.labelMedium),
                const SizedBox(height: Spacing.xs),
                Text(category.description, style: AppTypography.bodySecondary),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColors.textSecondary,
            size: 16,
          ),
        ],
      ),
    );
  }
}
