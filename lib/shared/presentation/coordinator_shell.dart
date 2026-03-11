import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

/// Shell widget providing bottom navigation for all coordinator screens.
class CoordinatorShell extends StatelessWidget {
  final Widget child;
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  const CoordinatorShell({
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
            label: l10n.navCoordinatorHome,
          ),
          NavigationDestination(
            icon: const Icon(Iconsax.chart_2),
            selectedIcon: const Icon(Iconsax.chart_2_copy),
            label: l10n.navCoordinatorAnalytics,
          ),
          NavigationDestination(
            icon: const Icon(Iconsax.teacher),
            selectedIcon: const Icon(Iconsax.teacher_copy),
            label: l10n.navCoordinatorTeachers,
          ),
          NavigationDestination(
            icon: const Icon(Iconsax.profile_circle),
            selectedIcon: const Icon(Iconsax.profile_circle_copy),
            label: l10n.navCoordinatorProfile,
          ),
        ],
      ),
    );
  }
}
