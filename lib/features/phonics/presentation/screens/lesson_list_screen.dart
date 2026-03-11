import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../../../shared/utils/constants.dart';
import '../../../../shared/widgets/bibo_mascot.dart';
import '../../../../shared/widgets/offline_banner.dart';
import '../../../../shared/widgets/phoneme_card.dart';
import '../providers/lesson_provider.dart';

/// Lesson list showing all phonics lessons as PhonemeCards.
class LessonListScreen extends ConsumerWidget {
  const LessonListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final lessons = ref.watch(lessonListProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(l10n.lessonListTitle,
            style: AppTypography.heading2
                .copyWith(color: AppColors.textOnPrimary)),
      ),
      body: Column(
        children: [
          const OfflineBanner(isOffline: false),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(Spacing.lg),
              children: [
                BiboMascot(
                  message: l10n.lessonListBiboMessage,
                  mood: BiboMood.encouraging,
                  size: BiboSize.medium,
                ),
                const SizedBox(height: Spacing.lg),
                ...lessons.map(
                  (lesson) => Padding(
                    padding: const EdgeInsets.only(bottom: Spacing.md),
                    child: PhonemeCard(
                      phoneme: lesson.phoneme,
                      name: lesson.title,
                      exampleWords: const ['—'],
                      progress: lesson.progress > 0 ? lesson.progress : null,
                      onTap: () => context.push('/learner/lesson/${lesson.id}'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
