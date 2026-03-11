import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../../../shared/utils/constants.dart';
import '../../../../shared/widgets/bibo_mascot.dart';

/// Mock leaderboard data.
class _LeaderboardEntry {
  final int rank;
  final String avatarLetter;
  final int xp;

  const _LeaderboardEntry({
    required this.rank,
    required this.avatarLetter,
    required this.xp,
  });
}

const _mockLeaderboard = <_LeaderboardEntry>[
  _LeaderboardEntry(rank: 1, avatarLetter: 'A', xp: 450),
  _LeaderboardEntry(rank: 2, avatarLetter: 'B', xp: 380),
  _LeaderboardEntry(rank: 3, avatarLetter: 'C', xp: 320),
  _LeaderboardEntry(rank: 4, avatarLetter: 'D', xp: 280),
  _LeaderboardEntry(rank: 5, avatarLetter: 'E', xp: 250),
  _LeaderboardEntry(rank: 6, avatarLetter: 'F', xp: 210),
  _LeaderboardEntry(rank: 7, avatarLetter: 'G', xp: 190),
  _LeaderboardEntry(rank: 8, avatarLetter: 'H', xp: 170),
];

/// Leaderboard Screen — top learners ranked by XP.
///
/// No real names shown — avatar only (Rule L3).
class LeaderboardScreen extends ConsumerWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          l10n.leaderboardTitle,
          style:
              AppTypography.heading3.copyWith(color: AppColors.textOnPrimary),
        ),
      ),
      body: Column(
        children: [
          // Class filter pill row
          Padding(
            padding: const EdgeInsets.all(Spacing.lg),
            child: SizedBox(
              height: TouchTargets.buttonHeight,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  FilterChip(
                    label: Text(l10n.leaderboardClassFilter),
                    selected: true,
                    onSelected: (_) {},
                    selectedColor: AppColors.primary.withOpacity(0.15),
                    labelStyle: AppTypography.labelMedium.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: Spacing.sm),
                  FilterChip(
                    label: const Text('G1 – Sampaguita'),
                    selected: false,
                    onSelected: (_) {},
                    labelStyle: AppTypography.labelMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(width: Spacing.sm),
                  FilterChip(
                    label: const Text('G1 – Rosal'),
                    selected: false,
                    onSelected: (_) {},
                    labelStyle: AppTypography.labelMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bibo message
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: Spacing.lg),
            child: BiboMascot(
              mood: BiboMood.happy,
              size: BiboSize.small,
              message: '',
              showBubble: false,
            ),
          ),
          const SizedBox(height: Spacing.lg),

          // Leaderboard list
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
              itemCount: _mockLeaderboard.length,
              separatorBuilder: (_, __) => const SizedBox(height: Spacing.sm),
              itemBuilder: (context, index) {
                final entry = _mockLeaderboard[index];
                final isTop3 = entry.rank <= 3;
                return Container(
                  padding: const EdgeInsets.all(Spacing.lg),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(Radii.md),
                    border: isTop3
                        ? Border.all(
                            color: AppColors.xpGold.withOpacity(0.5),
                            width: 2,
                          )
                        : Border.all(color: AppColors.border),
                  ),
                  child: Row(
                    children: [
                      // Rank
                      SizedBox(
                        width: 36,
                        child: Text(
                          l10n.leaderboardRank(entry.rank),
                          style: AppTypography.labelLarge.copyWith(
                            color: isTop3
                                ? AppColors.xpGold
                                : AppColors.textSecondary,
                          ),
                        ),
                      ),
                      const SizedBox(width: Spacing.md),
                      // Avatar (no name — Rule L3)
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            entry.avatarLetter,
                            style: AppTypography.labelLarge.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      // XP
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Spacing.md,
                          vertical: Spacing.xs,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.xpGold.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(Radii.pill),
                        ),
                        child: Text(
                          l10n.leaderboardXp(entry.xp),
                          style: AppTypography.labelMedium.copyWith(
                            color: AppColors.secondaryDark,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
