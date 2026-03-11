import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../../../shared/utils/constants.dart';
import '../../../../shared/widgets/activity_card.dart';
import '../../../../shared/widgets/bibo_mascot.dart';
import '../../../../shared/widgets/offline_banner.dart';
import '../../../../shared/widgets/xp_bar.dart';
import '../providers/learner_provider.dart';

/// Learner home screen with greeting, XP bar, activity cards, and Bibo.
class LearnerHomeScreen extends ConsumerWidget {
  const LearnerHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final learner = ref.watch(learnerProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          // Offline banner placeholder (always online in Phase 3).
          const OfflineBanner(isOffline: false),
          Expanded(
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(Spacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header: greeting + Bibo avatar.
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                l10n.learnerHomeGreeting(learner.name),
                                style: AppTypography.heading1,
                              ),
                              const SizedBox(height: Spacing.xs),
                              Text(
                                'Grade ${learner.grade} — ${learner.section}',
                                style: AppTypography.bodySecondary,
                              ),
                            ],
                          ),
                        ),
                        const BiboMascot(
                          message: '',
                          mood: BiboMood.happy,
                          size: BiboSize.small,
                          showBubble: false,
                        ),
                      ],
                    ),
                    const SizedBox(height: Spacing.xl),

                    // XP progress bar.
                    XpBar(
                      currentXp: learner.xp,
                      maxXp: XpConstants.xpPerLevel * (learner.level + 1),
                      level: learner.level,
                    ),
                    const SizedBox(height: Spacing.xxl),

                    // Bibo welcome bubble.
                    BiboMascot(
                      message: l10n.learnerHomeTodayLesson,
                      mood: BiboMood.happy,
                      size: BiboSize.medium,
                    ),
                    const SizedBox(height: Spacing.lg),

                    // Today's Lesson primary card.
                    ActivityCard(
                      title: l10n.learnerHomeTodayLesson,
                      description: 'Tunog ng Letrang Ii',
                      icon: Icons.menu_book_rounded,
                      progress: 0.6,
                      badge: l10n.learnerHomeStartNow,
                      onTap: () => context.push('/learner/lesson/lesson-ii'),
                    ),
                    const SizedBox(height: Spacing.lg),

                    // 2-column secondary card grid.
                    Row(
                      children: [
                        Expanded(
                          child: ActivityCard(
                            title: l10n.learnerHomeGames,
                            description: 'Quiz Time!',
                            icon: Icons.sports_esports_rounded,
                            onTap: () =>
                                context.push('/learner/quiz/lesson-aa'),
                          ),
                        ),
                        const SizedBox(width: Spacing.md),
                        Expanded(
                          child: ActivityCard(
                            title: l10n.learnerHomeWordList,
                            description: 'Picture Dictionary',
                            icon: Icons.auto_stories_rounded,
                            onTap: () => context.push('/learner/dictionary'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
