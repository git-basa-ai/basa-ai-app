import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../../../shared/utils/constants.dart';
import '../../../../shared/widgets/bibo_mascot.dart';
import '../../../../shared/widgets/celebration_overlay.dart';
import '../../../../shared/widgets/phoneme_card.dart';
import '../providers/lesson_provider.dart';

/// Lesson detail screen showing phoneme illustration, audio, and Speak Now.
class LessonDetailScreen extends ConsumerStatefulWidget {
  /// The lesson identifier from the route parameter.
  final String lessonId;

  const LessonDetailScreen({super.key, required this.lessonId});

  @override
  ConsumerState<LessonDetailScreen> createState() => _LessonDetailScreenState();
}

class _LessonDetailScreenState extends ConsumerState<LessonDetailScreen> {
  bool _showCelebration = false;
  bool _lessonCompleted = false;

  void _onSpeakNow() {
    // Simulate completing the lesson after speaking.
    setState(() {
      _lessonCompleted = true;
      _showCelebration = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final lesson = ref.watch(lessonByIdProvider(widget.lessonId));

    if (lesson == null) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: Text(l10n.generalError, style: AppTypography.bodyLarge)),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(lesson.title,
            style: AppTypography.heading3
                .copyWith(color: AppColors.textOnPrimary)),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(Spacing.lg),
            child: Column(
              children: [
                BiboMascot(
                  message: l10n.lessonDetailBiboEncourage,
                  mood: _lessonCompleted
                      ? BiboMood.celebrating
                      : BiboMood.encouraging,
                  size: BiboSize.medium,
                ),
                const SizedBox(height: Spacing.xxl),

                // Phoneme card display.
                PhonemeCard(
                  phoneme: lesson.phoneme,
                  name: lesson.title,
                  exampleWords: const ['Sample word 1', 'Sample word 2'],
                  progress: lesson.progress > 0 ? lesson.progress : null,
                  onTap: () {},
                ),
                const SizedBox(height: Spacing.xxl),

                // Action buttons.
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: TouchTargets.buttonHeight,
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.volume_up_rounded),
                          label: Text(l10n.lessonDetailListenFirst),
                        ),
                      ),
                    ),
                    const SizedBox(width: Spacing.md),
                    Expanded(
                      child: SizedBox(
                        height: TouchTargets.buttonHeight,
                        child: ElevatedButton.icon(
                          onPressed: _lessonCompleted ? null : _onSpeakNow,
                          icon: const Icon(Icons.mic_rounded),
                          label: Text(
                            _lessonCompleted
                                ? l10n.lessonCompletionTitle
                                : l10n.lessonDetailSpeakNow,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Spacing.lg),

                // Mouth guide link.
                SizedBox(
                  width: double.infinity,
                  height: TouchTargets.buttonHeight,
                  child: OutlinedButton.icon(
                    onPressed: () => context.push('/learner/mouth-guide'),
                    icon: const Icon(Icons.face_rounded),
                    label: Text(l10n.lessonDetailMouthGuide),
                  ),
                ),
                const SizedBox(height: Spacing.lg),

                // Quiz button.
                if (_lessonCompleted)
                  SizedBox(
                    width: double.infinity,
                    height: TouchTargets.buttonHeight,
                    child: ElevatedButton(
                      onPressed: () =>
                          context.push('/learner/quiz/${widget.lessonId}'),
                      child: Text(l10n.lessonCompletionContinue),
                    ),
                  ),
              ],
            ),
          ),

          // Celebration overlay.
          CelebrationOverlay(
            isVisible: _showCelebration,
            message: l10n.lessonCompletionTitle,
            xpEarned: XpConstants.xpPerLesson,
            onDismiss: () => setState(() => _showCelebration = false),
          ),
        ],
      ),
    );
  }
}
