import 'package:flutter/material.dart';

import '../../app/theme/colors.dart';
import '../../app/theme/typography.dart';

/// Display card for a phoneme with an audio button and example words.
///
/// Used in the lesson list screen and lesson detail screen to show
/// individual phoneme units from the Marungko Approach sequence.
///
/// ```dart
/// PhonemeCard(
///   phoneme: 'Bb',
///   name: 'Letra Bb',
///   exampleWords: ['bata', 'baso', 'bola'],
///   onTap: () => context.go('/learner/lesson/bb'),
///   onPlayAudio: () => audioService.playPhoneme('bb'),
/// )
/// ```
class PhonemeCard extends StatelessWidget {
  /// The phoneme symbol (e.g., "Bb", "Aa").
  final String phoneme;

  /// Display name (e.g., "Letra Bb").
  final String name;

  /// Example words using this phoneme.
  final List<String> exampleWords;

  /// Optional illustration image URL or asset path.
  final String? imageUrl;

  /// Navigate to the lesson detail for this phoneme.
  final VoidCallback onTap;

  /// Play the pronunciation audio for this phoneme.
  final VoidCallback? onPlayAudio;

  /// Progress value (0.0–1.0) for this phoneme's lessons. Null hides it.
  final double? progress;

  const PhonemeCard({
    super.key,
    required this.phoneme,
    required this.name,
    this.exampleWords = const [],
    this.imageUrl,
    required this.onTap,
    this.onPlayAudio,
    this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 12),
                if (exampleWords.isNotEmpty) _buildExampleWords(),
                if (progress != null) ...[
                  const SizedBox(height: 12),
                  _buildProgressBar(),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              phoneme,
              style: AppTypography.heading1.copyWith(
                color: AppColors.primary,
                fontSize: 28,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(name, style: AppTypography.heading3),
        ),
        if (onPlayAudio != null)
          SizedBox(
            width: 48,
            height: 48,
            child: IconButton(
              onPressed: onPlayAudio,
              icon: const Icon(
                Icons.volume_up_rounded,
                color: AppColors.primary,
              ),
              tooltip: 'Play sound',
            ),
          ),
      ],
    );
  }

  Widget _buildExampleWords() {
    return Wrap(
      spacing: 8,
      runSpacing: 6,
      children: exampleWords.map((word) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.08),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            word,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.primary,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildProgressBar() {
    final value = (progress ?? 0).clamp(0.0, 1.0);

    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: SizedBox(
        height: 6,
        child: LinearProgressIndicator(
          value: value,
          backgroundColor: AppColors.border,
          valueColor: const AlwaysStoppedAnimation<Color>(AppColors.success),
        ),
      ),
    );
  }
}
