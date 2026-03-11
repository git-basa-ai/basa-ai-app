import 'package:flutter/material.dart';

import '../../app/theme/colors.dart';
import '../../app/theme/typography.dart';

/// Persistent banner indicating the device is offline.
///
/// Slides down from the top of the screen with an animation.
/// Auto-dismisses when connectivity is restored.
///
/// ```dart
/// OfflineBanner(isOffline: ref.watch(networkStateProvider) == false)
/// ```
class OfflineBanner extends StatelessWidget {
  /// Whether the device is currently offline.
  final bool isOffline;

  const OfflineBanner({super.key, required this.isOffline});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -1),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeOut),
          ),
          child: child,
        );
      },
      child: isOffline
          ? Container(
              key: const ValueKey('offline'),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: const BoxDecoration(
                color: AppColors.secondary,
              ),
              child: SafeArea(
                bottom: false,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.cloud_off_rounded,
                      color: AppColors.textOnSecondary,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'You are offline — progress is saved locally',
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.textOnSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : const SizedBox.shrink(key: ValueKey('online')),
    );
  }
}
