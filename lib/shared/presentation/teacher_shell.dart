import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

/// Shell widget providing bottom navigation for all teacher screens.
class TeacherShell extends StatelessWidget {
  final Widget child;
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  const TeacherShell({
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
            label: l10n.navTeacherHome,
          ),
          NavigationDestination(
            icon: const Icon(Iconsax.people),
            selectedIcon: const Icon(Iconsax.people_copy),
            label: l10n.navTeacherLearners,
          ),
          NavigationDestination(
            icon: const Icon(Iconsax.document_text),
            selectedIcon: const Icon(Iconsax.document_text_copy),
            label: l10n.navTeacherReport,
          ),
          NavigationDestination(
            icon: const Icon(Iconsax.profile_circle),
            selectedIcon: const Icon(Iconsax.profile_circle_copy),
            label: l10n.navTeacherProfile,
          ),
        ],
      ),
    );
  }
}
