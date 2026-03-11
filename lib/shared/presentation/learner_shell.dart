import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

/// Shell widget providing bottom navigation for all learner screens (Rule U5).
class LearnerShell extends StatelessWidget {
  /// The currently displayed child page.
  final Widget child;

  /// Current navigation index.
  final int currentIndex;

  /// Callback when a nav item is tapped.
  final ValueChanged<int> onDestinationSelected;

  const LearnerShell({
    super.key,
    required this.child,
    required this.currentIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: onDestinationSelected,
        destinations: [
          NavigationDestination(
            icon: const Icon(Iconsax.home_1),
            selectedIcon: const Icon(Iconsax.home_1_copy),
            label: l10n.navHome,
          ),
          NavigationDestination(
            icon: const Icon(Iconsax.book),
            selectedIcon: const Icon(Iconsax.book_copy),
            label: l10n.navLessons,
          ),
          NavigationDestination(
            icon: const Icon(Iconsax.scan_barcode),
            selectedIcon: const Icon(Iconsax.scan_barcode_copy),
            label: l10n.navScanner,
          ),
          NavigationDestination(
            icon: const Icon(Iconsax.game),
            selectedIcon: const Icon(Iconsax.game_copy),
            label: l10n.navGames,
          ),
          NavigationDestination(
            icon: const Icon(Iconsax.profile_circle),
            selectedIcon: const Icon(Iconsax.profile_circle_copy),
            label: l10n.navProfile,
          ),
        ],
      ),
    );
  }
}
