import 'package:flutter/material.dart';

import '../../app/theme/colors.dart';
import '../../app/theme/typography.dart';

/// Full-screen loading overlay with a friendly animation (Rule U7).
///
/// Never shows a blank white screen — displays a centered loading indicator
/// with an optional message. Will be upgraded to Lottie Bibo animation
/// when assets are available in Phase 4.
///
/// ```dart
/// Stack(
///   children: [
///     MyScreenContent(),
///     LoadingOverlay(
///       isLoading: ref.watch(someAsyncProvider).isLoading,
///       message: 'Loading your lessons...',
///     ),
///   ],
/// )
/// ```
class LoadingOverlay extends StatelessWidget {
  /// Whether to show the loading overlay.
  final bool isLoading;

  /// Optional message displayed below the loading indicator.
  final String? message;

  const LoadingOverlay({
    super.key,
    required this.isLoading,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: isLoading
          ? Container(
              key: const ValueKey('loading'),
              color: AppColors.background.withOpacity(0.85),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.12),
                            blurRadius: 20,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: SizedBox(
                          width: 36,
                          height: 36,
                          child: CircularProgressIndicator(
                            strokeWidth: 3.5,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (message != null) ...[
                      const SizedBox(height: 20),
                      Text(
                        message!,
                        style: AppTypography.bodyMedium.copyWith(
                          color: AppColors.textSecondary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ],
                ),
              ),
            )
          : const SizedBox.shrink(key: ValueKey('loaded')),
    );
  }
}
