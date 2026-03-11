import 'package:flutter/material.dart';

import '../../app/theme/colors.dart';
import '../../app/theme/typography.dart';

/// Mood states for Bibo the blue owl mascot.
enum BiboMood {
  /// Default happy state.
  happy,

  /// Thinking/processing state.
  thinking,

  /// Encouraging after a wrong answer or struggle.
  encouraging,

  /// Celebrating a correct answer or level-up.
  celebrating,
}

/// Size presets for the Bibo mascot.
enum BiboSize {
  /// 48×48 dp — inline with text or header.
  small,

  /// 80×80 dp — standard display in speech bubbles.
  medium,

  /// 120×120 dp — hero display on welcome/celebration screens.
  large,
}

/// Bibo the blue owl mascot — appears on every learner-facing screen (Rule U4).
///
/// Displays a context-aware speech bubble with a friendly owl avatar.
/// Uses a placeholder owl icon until Lottie assets are integrated in Phase 4.
///
/// ```dart
/// BiboMascot(
///   message: 'Great job! Keep going!',
///   mood: BiboMood.happy,
///   size: BiboSize.medium,
/// )
/// ```
class BiboMascot extends StatefulWidget {
  /// The text displayed in the speech bubble.
  final String message;

  /// The current mood of Bibo, which affects the visual style.
  final BiboMood mood;

  /// The display size of the mascot.
  final BiboSize size;

  /// Optional tap handler for interactive Bibo moments.
  final VoidCallback? onTap;

  /// Whether to show the speech bubble.
  final bool showBubble;

  const BiboMascot({
    super.key,
    required this.message,
    this.mood = BiboMood.happy,
    this.size = BiboSize.medium,
    this.onTap,
    this.showBubble = true,
  });

  @override
  State<BiboMascot> createState() => _BiboMascotState();
}

class _BiboMascotState extends State<BiboMascot>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double get _avatarSize {
    switch (widget.size) {
      case BiboSize.small:
        return 48;
      case BiboSize.medium:
        return 80;
      case BiboSize.large:
        return 120;
    }
  }

  @override
  Widget build(BuildContext context) {
    final disableAnimations = MediaQuery.of(context).disableAnimations;

    final avatar = GestureDetector(
      onTap: widget.onTap,
      child: Image.asset(
        'assets/images/character.png',
        width: _avatarSize,
        height: _avatarSize,
        fit: BoxFit.contain,
      ),
    );

    final bubble = widget.showBubble
        ? Flexible(
            child: Container(
              margin: const EdgeInsets.only(left: 12),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.border),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.08),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                widget.message,
                style: AppTypography.bodyMedium,
              ),
            ),
          )
        : const SizedBox.shrink();

    final content = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [avatar, bubble],
    );

    if (disableAnimations) {
      return content;
    }

    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: content,
      ),
    );
  }
}
