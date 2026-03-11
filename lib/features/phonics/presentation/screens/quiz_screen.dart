import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../../../shared/utils/constants.dart';
import '../../../../shared/widgets/answer_tile.dart';
import '../../../../shared/widgets/bibo_mascot.dart';
import '../../../../shared/widgets/celebration_overlay.dart';
import '../providers/quiz_provider.dart';

/// Quiz screen with question card, 2×2 answer grid, and score tracker.
class QuizScreen extends ConsumerStatefulWidget {
  /// The lesson identifier for this quiz.
  final String lessonId;

  const QuizScreen({super.key, required this.lessonId});

  @override
  ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {
  bool _showCelebration = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final quizState = ref.watch(quizProvider(widget.lessonId));
    final notifier = ref.read(quizProvider(widget.lessonId).notifier);

    if (quizState.quizComplete) {
      return _buildResultsScreen(l10n, quizState);
    }

    final question = quizState.currentQuestion;
    if (question == null) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(child: Text(l10n.generalError)),
      );
    }

    final isCorrect = quizState.answered &&
        quizState.selectedAnswer == question.correctAnswer;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          l10n.quizTitle,
          style:
              AppTypography.heading3.copyWith(color: AppColors.textOnPrimary),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: Spacing.lg),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Spacing.md,
                  vertical: Spacing.xs,
                ),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(Radii.pill),
                ),
                child: Text(
                  l10n.quizScoreLabel(
                    quizState.score,
                    quizState.questions.length,
                  ),
                  style: AppTypography.labelMedium,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(Spacing.lg),
            child: Column(
              children: [
                // Bibo feedback.
                BiboMascot(
                  message: quizState.answered
                      ? (isCorrect ? l10n.quizCorrectBibo : l10n.quizWrongBibo)
                      : question.questionText,
                  mood: quizState.answered
                      ? (isCorrect
                          ? BiboMood.celebrating
                          : BiboMood.encouraging)
                      : BiboMood.thinking,
                  size: BiboSize.medium,
                ),
                const SizedBox(height: Spacing.xl),

                // Question card.
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(Spacing.xl),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(Radii.xl),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.08),
                        blurRadius: Spacing.md,
                        offset: const Offset(0, Spacing.xs),
                      ),
                    ],
                  ),
                  child: Text(
                    question.questionText,
                    style: AppTypography.heading2,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: Spacing.xl),

                // 2×2 answer grid.
                Expanded(
                  child: GridView.count(
                    crossAxisCount: GridConstants.answerColumns,
                    mainAxisSpacing: GridConstants.gridSpacing,
                    crossAxisSpacing: GridConstants.gridSpacing,
                    childAspectRatio: 1.8,
                    children: question.choices.map((choice) {
                      AnswerTileState tileState = AnswerTileState.defaultState;
                      if (quizState.answered) {
                        if (choice == question.correctAnswer) {
                          tileState = AnswerTileState.correct;
                        } else if (choice == quizState.selectedAnswer) {
                          tileState = AnswerTileState.wrong;
                        }
                      } else if (choice == quizState.selectedAnswer) {
                        tileState = AnswerTileState.selected;
                      }

                      return AnswerTile(
                        label: choice,
                        state: tileState,
                        onTap: quizState.answered
                            ? null
                            : () => notifier.selectAnswer(choice),
                      );
                    }).toList(),
                  ),
                ),

                // Next button.
                if (quizState.answered)
                  Padding(
                    padding: const EdgeInsets.only(top: Spacing.lg),
                    child: SizedBox(
                      width: double.infinity,
                      height: TouchTargets.buttonHeight,
                      child: ElevatedButton(
                        onPressed: () => notifier.nextQuestion(),
                        child: Text(l10n.quizNextQuestion),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          CelebrationOverlay(
            isVisible: _showCelebration,
            message: l10n.quizCompleteBibo,
            xpEarned: XpConstants.xpPerQuiz,
            onDismiss: () => setState(() => _showCelebration = false),
          ),
        ],
      ),
    );
  }

  Widget _buildResultsScreen(AppLocalizations l10n, QuizState quizState) {
    final score = quizState.score;
    final total = quizState.questions.length;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          l10n.quizTitle,
          style:
              AppTypography.heading3.copyWith(color: AppColors.textOnPrimary),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(Spacing.xxl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BiboMascot(
                message: l10n.quizCompleteBibo,
                mood: BiboMood.celebrating,
                size: BiboSize.large,
              ),
              const SizedBox(height: Spacing.xxl),
              Text(
                l10n.quizScoreLabel(score, total),
                style: AppTypography.heading1,
              ),
              const SizedBox(height: Spacing.lg),
              Text(
                l10n.lessonCompletionXpEarned(XpConstants.xpPerQuiz),
                style: AppTypography.heading2.copyWith(
                  color: AppColors.xpGold,
                ),
              ),
              const SizedBox(height: Spacing.xxxl),
              SizedBox(
                width: double.infinity,
                height: TouchTargets.buttonHeight,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate back (GoRouter will handle).
                    if (context.canPop()) {
                      context.pop();
                    }
                  },
                  child: Text(l10n.lessonCompletionContinue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
