import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../../../shared/utils/constants.dart';
import '../../../../shared/widgets/word_status_chip.dart';
import '../providers/word_tracking_provider.dart';

/// Difficult / Mastered Words Screen — two-tab layout.
class WordsScreen extends ConsumerWidget {
  const WordsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final words = ref.watch(wordTrackingProvider);

    final struggling = words.where((w) => !w.isMastered).toList();
    final mastered = words.where((w) => w.isMastered).toList();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: Text(
            l10n.wordsScreenTitle,
            style:
                AppTypography.heading3.copyWith(color: AppColors.textOnPrimary),
          ),
          bottom: TabBar(
            indicatorColor: AppColors.textOnPrimary,
            labelColor: AppColors.textOnPrimary,
            unselectedLabelColor: AppColors.textOnPrimary.withOpacity(0.6),
            tabs: [
              Tab(text: '${l10n.wordsScreenStrugglingTab} 🔴'),
              Tab(text: '${l10n.wordsScreenMasteredTab} 🟢'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Struggling tab
            struggling.isEmpty
                ? Center(
                    child: Text(
                      l10n.wordsScreenNoStruggling,
                      style: AppTypography.bodyLarge,
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(Spacing.lg),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: Spacing.md,
                      mainAxisSpacing: Spacing.md,
                      childAspectRatio: 2.2,
                    ),
                    itemCount: struggling.length,
                    itemBuilder: (context, index) {
                      final w = struggling[index];
                      return WordStatusChip(
                        word: w.word,
                        isMastered: false,
                        detail: l10n.wordsScreenFailCount(w.failCount),
                      );
                    },
                  ),

            // Mastered tab
            mastered.isEmpty
                ? Center(
                    child: Text(
                      l10n.wordsScreenNoMastered,
                      style: AppTypography.bodyLarge,
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(Spacing.lg),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: Spacing.md,
                      mainAxisSpacing: Spacing.md,
                      childAspectRatio: 2.2,
                    ),
                    itemCount: mastered.length,
                    itemBuilder: (context, index) {
                      final w = mastered[index];
                      return WordStatusChip(
                        word: w.word,
                        isMastered: true,
                        detail: w.masteredDate,
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
