import 'package:flutter/material.dart';

import '../../app/theme/colors.dart';
import '../../app/theme/typography.dart';

/// Visual state of an answer tile in a quiz.
enum AnswerTileState {
  /// Default idle state — ready for selection.
  defaultState,

  /// User has selected this tile (awaiting confirmation).
  selected,

  /// Correct answer — green border, check badge, bounce animation.
  correct,

  /// Wrong answer — red border, X badge, shake animation.
  wrong,
}

/// Tappable answer tile for quizzes and phonics matching exercises.
///
/// Supports four visual states: default, selected, correct, and wrong.
/// Provides 800ms feedback delay before transitioning states.
///
/// ```dart
/// AnswerTile(
///   label: 'cat',
///   icon: Icons.pets_rounded,
///   state: AnswerTileState.defaultState,
///   onTap: () => ref.read(quizProvider.notifier).selectAnswer('cat'),
/// )
/// ```
class AnswerTile extends StatefulWidget {
  /// The answer text displayed in the tile.
  final String label;

  /// Optional icon above the label text.
  final IconData? icon;

  /// Current visual state of the tile.
  final AnswerTileState state;

  /// Tap handler — set to null to disable interaction.
  final VoidCallback? onTap;

  const AnswerTile({
    super.key,
    required this.label,
    this.icon,
    this.state = AnswerTileState.defaultState,
    this.onTap,
  });

  @override
  State<AnswerTile> createState() => _AnswerTileState();
}

class _AnswerTileState extends State<AnswerTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );
  }

  @override
  void didUpdateWidget(AnswerTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.state != widget.state) {
      if (widget.state == AnswerTileState.correct ||
          widget.state == AnswerTileState.wrong) {
        _animationController.forward(from: 0);
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Color get _borderColor {
    switch (widget.state) {
      case AnswerTileState.defaultState:
        return AppColors.border;
      case AnswerTileState.selected:
        return AppColors.primary;
      case AnswerTileState.correct:
        return AppColors.answerCorrect;
      case AnswerTileState.wrong:
        return AppColors.answerWrong;
    }
  }

  Color get _backgroundColor {
    switch (widget.state) {
      case AnswerTileState.defaultState:
        return AppColors.answerDefault;
      case AnswerTileState.selected:
        return AppColors.primary.withOpacity(0.05);
      case AnswerTileState.correct:
        return AppColors.answerCorrect.withOpacity(0.08);
      case AnswerTileState.wrong:
        return AppColors.answerWrong.withOpacity(0.08);
    }
  }

  double get _borderWidth {
    switch (widget.state) {
      case AnswerTileState.defaultState:
        return 1.5;
      case AnswerTileState.selected:
      case AnswerTileState.correct:
      case AnswerTileState.wrong:
        return 2.5;
    }
  }

  Widget? get _badge {
    switch (widget.state) {
      case AnswerTileState.correct:
        return const Icon(Icons.check_circle_rounded,
            color: AppColors.answerCorrect, size: 24);
      case AnswerTileState.wrong:
        return const Icon(Icons.cancel_rounded,
            color: AppColors.answerWrong, size: 24);
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final disableAnimations = MediaQuery.of(context).disableAnimations;
    final isInteractive = widget.onTap != null &&
        widget.state != AnswerTileState.correct &&
        widget.state != AnswerTileState.wrong;

    Widget tile = Container(
      constraints: const BoxConstraints(minHeight: 80, minWidth: 48),
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _borderColor, width: _borderWidth),
        boxShadow: [
          BoxShadow(
            color: _borderColor.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: isInteractive ? widget.onTap : null,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.icon != null) ...[
                  Icon(widget.icon, size: 32, color: AppColors.textPrimary),
                  const SizedBox(height: 8),
                ],
                Text(
                  widget.label,
                  style: AppTypography.labelLarge,
                  textAlign: TextAlign.center,
                ),
                if (_badge != null) ...[
                  const SizedBox(height: 8),
                  _badge!,
                ],
              ],
            ),
          ),
        ),
      ),
    );

    if (disableAnimations || widget.state == AnswerTileState.defaultState ||
        widget.state == AnswerTileState.selected) {
      return tile;
    }

    if (widget.state == AnswerTileState.correct) {
      return AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final scale = 1.0 + (_animation.value * 0.05);
          return Transform.scale(scale: scale, child: child);
        },
        child: tile,
      );
    }

    // Shake animation for wrong answer
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final shakeOffset =
            _animation.value < 0.5
                ? (_animation.value * 8) - 4
                : ((1 - _animation.value) * 8) - 4;
        return Transform.translate(
          offset: Offset(shakeOffset, 0),
          child: child,
        );
      },
      child: tile,
    );
  }
}
