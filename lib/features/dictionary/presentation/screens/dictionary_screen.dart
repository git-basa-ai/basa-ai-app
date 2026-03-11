import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../../../shared/utils/constants.dart';
import '../../../../shared/widgets/bibo_mascot.dart';
import '../../../../shared/widgets/offline_banner.dart';
import '../providers/dictionary_provider.dart';

/// Picture dictionary with 2-column word card grid and letter filter pills.
class DictionaryScreen extends ConsumerStatefulWidget {
  const DictionaryScreen({super.key});

  @override
  ConsumerState<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends ConsumerState<DictionaryScreen> {
  String? _selectedLetter;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final letters = ref.watch(dictionaryLettersProvider);
    final entries = ref.watch(filteredDictionaryProvider(_selectedLetter));

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          l10n.dictionaryTitle,
          style:
              AppTypography.heading3.copyWith(color: AppColors.textOnPrimary),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: Spacing.md),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Spacing.sm,
                  vertical: Spacing.xs,
                ),
                decoration: BoxDecoration(
                  color: AppColors.success.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(Radii.sm),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.cloud_done_rounded,
                        size: 16, color: AppColors.success),
                    const SizedBox(width: Spacing.xs),
                    Text(
                      l10n.dictionaryOfflineLabel,
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.success,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const OfflineBanner(isOffline: false),

          // Letter filter pills.
          SizedBox(
            height: TouchTargets.buttonHeight,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: Spacing.sm),
                  child: FilterChip(
                    label: const Text('All'),
                    selected: _selectedLetter == null,
                    onSelected: (_) => setState(() => _selectedLetter = null),
                    labelStyle: AppTypography.labelMedium,
                    selectedColor: AppColors.primary.withOpacity(0.15),
                  ),
                ),
                ...letters.map(
                  (letter) => Padding(
                    padding: const EdgeInsets.only(right: Spacing.sm),
                    child: FilterChip(
                      label: Text(letter),
                      selected: _selectedLetter == letter,
                      onSelected: (_) =>
                          setState(() => _selectedLetter = letter),
                      labelStyle: AppTypography.labelMedium,
                      selectedColor: AppColors.primary.withOpacity(0.15),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: Spacing.sm),

          // Bibo helper.
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
            child: BiboMascot(
              message: l10n.dictionaryBiboMessage,
              mood: BiboMood.happy,
              size: BiboSize.small,
            ),
          ),
          const SizedBox(height: Spacing.md),

          // Word grid.
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(Spacing.lg),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: GridConstants.dictionaryColumns,
                mainAxisSpacing: GridConstants.gridSpacing,
                crossAxisSpacing: GridConstants.gridSpacing,
                childAspectRatio: 1.1,
              ),
              itemCount: entries.length,
              itemBuilder: (context, index) {
                final entry = entries[index];
                return _WordCard(word: entry.word, letter: entry.letter);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _WordCard extends StatelessWidget {
  final String word;
  final String letter;

  const _WordCard({required this.word, required this.letter});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(Radii.lg),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.08),
            blurRadius: Spacing.sm,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(Radii.lg),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(Radii.lg),
          child: Padding(
            padding: const EdgeInsets.all(Spacing.md),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image placeholder.
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(Radii.md),
                  ),
                  child: Center(
                    child: Text(
                      letter,
                      style: AppTypography.heading2.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: Spacing.sm),
                Text(
                  word,
                  style: AppTypography.labelLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: Spacing.xs),
                Icon(
                  Icons.volume_up_rounded,
                  size: 20,
                  color: AppColors.primary.withOpacity(0.6),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
