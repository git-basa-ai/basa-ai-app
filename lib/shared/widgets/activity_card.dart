import 'package:flutter/material.dart';

import '../../app/theme/colors.dart';
import '../../app/theme/typography.dart';

/// Large tappable card for lessons, games, or story activities.
///
/// Follows the child-friendly design spec: full-width on mobile,
/// rounded corners (20dp), subtle blue shadow, and spring-scale on press.
///
/// ```dart
/// ActivityCard(
///   title: 'Sounds of the Letter B',
///   description: 'Learn the Bb sound with Bibo!',
///   icon: Icons.menu_book_rounded,
///   progress: 0.4,
///   onTap: () => context.go('/learner/lesson/bb'),
/// )
/// ```
class ActivityCard extends StatefulWidget {
  /// Card heading text.
  final String title;

  /// Short subtitle or description.
  final String description;

  /// Leading icon displayed in the card header.
  final IconData icon;

  /// Progress value between 0.0 and 1.0. Null hides the progress bar.
  final double? progress;

  /// Navigation or action callback when the card is tapped.
  final VoidCallback onTap;

  /// Optional trailing label (e.g., "NEW", "3 XP").
  final String? badge;

  const ActivityCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    this.progress,
    required this.onTap,
    this.badge,
  });

  @override
  State<ActivityCard> createState() => _ActivityCardState();
}

class _ActivityCardState extends State<ActivityCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _scaleController;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
      lowerBound: 0,
      upperBound: 1,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.97).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails _) => _scaleController.forward();

  void _onTapUp(TapUpDetails _) {
    _scaleController.reverse();
    widget.onTap();
  }

  void _onTapCancel() => _scaleController.reverse();

  @override
  Widget build(BuildContext context) {
    final disableAnimations = MediaQuery.of(context).disableAnimations;

    final card = Container(
      constraints: const BoxConstraints(minHeight: 48),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.12),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTapDown: disableAnimations ? null : _onTapDown,
          onTapUp: disableAnimations ? null : _onTapUp,
          onTapCancel: disableAnimations ? null : _onTapCancel,
          onTap: disableAnimations ? widget.onTap : null,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 8),
                Text(widget.description, style: AppTypography.bodySecondary),
                if (widget.progress != null) ...[
                  const SizedBox(height: 16),
                  _buildProgressBar(),
                ],
              ],
            ),
          ),
        ),
      ),
    );

    if (disableAnimations) {
      return card;
    }

    return ScaleTransition(
      scale: _scaleAnimation,
      child: card,
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(widget.icon, color: AppColors.primary, size: 28),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            widget.title,
            style: AppTypography.heading3,
          ),
        ),
        if (widget.badge != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              widget.badge!,
              style: AppTypography.labelMedium.copyWith(
                color: AppColors.textOnSecondary,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildProgressBar() {
    final progress = (widget.progress ?? 0).clamp(0.0, 1.0);
    final percentage = (progress * 100).round();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            height: 10,
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: AppColors.border,
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.success,
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          '$percentage% complete',
          style: AppTypography.bodySecondary,
        ),
      ],
    );
  }
}
