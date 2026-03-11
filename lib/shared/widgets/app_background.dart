import 'package:flutter/material.dart';

/// Decorates a screen body with the app background image.
///
/// Wraps [child] in a full-bleed background using `assets/images/background.png`
/// with a semi-transparent white overlay so content remains readable.
class AppBackground extends StatelessWidget {
  /// The content rendered above the background.
  final Widget child;

  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
          opacity: 0.15,
        ),
      ),
      child: child,
    );
  }
}
