import 'dart:math';

import 'package:flutter/material.dart';

import '../../app/theme/colors.dart';
import '../../app/theme/typography.dart';

/// Full-screen celebration overlay for correct answers and level-ups.
///
/// Displays a confetti particle effect, celebration message, and optional
/// XP earned counter. Auto-dismisses after 3 seconds.
///
/// ```dart
/// CelebrationOverlay(
///   isVisible: showCelebration,
///   message: 'Great job! 🌟',
///   xpEarned: 10,
///   onDismiss: () => setState(() => showCelebration = false),
/// )
/// ```
class CelebrationOverlay extends StatefulWidget {
  /// Whether the overlay is visible.
  final bool isVisible;

  /// The celebration message displayed to the learner.
  final String message;

  /// Optional XP earned to display with a count-up animation.
  final int? xpEarned;

  /// Callback when the overlay auto-dismisses or is tapped away.
  final VoidCallback onDismiss;

  const CelebrationOverlay({
    super.key,
    required this.isVisible,
    required this.message,
    this.xpEarned,
    required this.onDismiss,
  });

  @override
  State<CelebrationOverlay> createState() => _CelebrationOverlayState();
}

class _CelebrationOverlayState extends State<CelebrationOverlay>
    with TickerProviderStateMixin {
  late final AnimationController _entryController;
  late final AnimationController _confettiController;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _entryController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _confettiController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _entryController, curve: Curves.elasticOut),
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _entryController, curve: Curves.easeOut),
    );

    if (widget.isVisible) {
      _startCelebration();
    }
  }

  @override
  void didUpdateWidget(CelebrationOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isVisible && !oldWidget.isVisible) {
      _startCelebration();
    } else if (!widget.isVisible && oldWidget.isVisible) {
      _entryController.reverse();
    }
  }

  void _startCelebration() {
    _entryController.forward(from: 0);
    _confettiController.forward(from: 0);

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted && widget.isVisible) {
        widget.onDismiss();
      }
    });
  }

  @override
  void dispose() {
    _entryController.dispose();
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isVisible) {
      return const SizedBox.shrink();
    }

    final disableAnimations = MediaQuery.of(context).disableAnimations;

    return GestureDetector(
      onTap: widget.onDismiss,
      child: Container(
        color: AppColors.textPrimary.withOpacity(0.4),
        child: Stack(
          children: [
            if (!disableAnimations)
              AnimatedBuilder(
                animation: _confettiController,
                builder: (context, _) {
                  return CustomPaint(
                    size: MediaQuery.of(context).size,
                    painter: _ConfettiPainter(
                      progress: _confettiController.value,
                    ),
                  );
                },
              ),
            Center(
              child: disableAnimations
                  ? _buildContent()
                  : FadeTransition(
                      opacity: _fadeAnimation,
                      child: ScaleTransition(
                        scale: _scaleAnimation,
                        child: _buildContent(),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: AppColors.xpGold.withOpacity(0.3),
            blurRadius: 30,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.celebration_rounded,
            size: 64,
            color: AppColors.xpGold,
          ),
          const SizedBox(height: 16),
          Text(
            widget.message,
            style: AppTypography.heading2,
            textAlign: TextAlign.center,
          ),
          if (widget.xpEarned != null) ...[
            const SizedBox(height: 12),
            _XpCounter(xp: widget.xpEarned!),
          ],
        ],
      ),
    );
  }
}

/// Animated XP count-up display inside the celebration overlay.
class _XpCounter extends StatelessWidget {
  final int xp;

  const _XpCounter({required this.xp});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<int>(
      tween: IntTween(begin: 0, end: xp),
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOut,
      builder: (context, value, _) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.star_rounded, color: AppColors.xpGold, size: 28),
            const SizedBox(width: 6),
            Text(
              '+$value XP',
              style: AppTypography.heading2.copyWith(
                color: AppColors.xpGold,
              ),
            ),
          ],
        );
      },
    );
  }
}

/// Simple confetti particle painter for the celebration overlay.
///
/// Uses a seeded random for consistent particle positions across builds.
class _ConfettiPainter extends CustomPainter {
  final double progress;
  static final List<_ConfettiParticle> _particles = _generateParticles(40);

  _ConfettiPainter({required this.progress});

  static List<_ConfettiParticle> _generateParticles(int count) {
    final random = Random(42);
    return List.generate(count, (_) {
      return _ConfettiParticle(
        x: random.nextDouble(),
        speed: 0.3 + random.nextDouble() * 0.7,
        size: 4 + random.nextDouble() * 6,
        color: [
          AppColors.xpGold,
          AppColors.primary,
          AppColors.success,
          AppColors.secondary,
          AppColors.primaryLight,
        ][random.nextInt(5)],
        wobble: random.nextDouble() * 2 * pi,
      );
    });
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (final particle in _particles) {
      final y = -20 + (size.height + 40) * progress * particle.speed;
      final x = particle.x * size.width +
          sin(progress * 6 + particle.wobble) * 20;
      final opacity = (1 - progress).clamp(0.0, 1.0);

      final paint = Paint()
        ..color = particle.color.withOpacity(opacity)
        ..style = PaintingStyle.fill;

      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: Offset(x, y),
            width: particle.size,
            height: particle.size * 0.6,
          ),
          Radius.circular(particle.size * 0.2),
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_ConfettiPainter oldDelegate) =>
      oldDelegate.progress != progress;
}

/// Data model for a single confetti particle.
class _ConfettiParticle {
  final double x;
  final double speed;
  final double size;
  final Color color;
  final double wobble;

  const _ConfettiParticle({
    required this.x,
    required this.speed,
    required this.size,
    required this.color,
    required this.wobble,
  });
}
