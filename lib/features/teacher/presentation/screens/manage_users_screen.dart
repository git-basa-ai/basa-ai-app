import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../../../shared/utils/constants.dart';
import '../../../../shared/widgets/learner_list_tile.dart';
import '../providers/user_management_provider.dart';

/// Manage User Access Screen — teacher can add/remove/edit learners.
class ManageUsersScreen extends ConsumerWidget {
  const ManageUsersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final learners = ref.watch(userManagementProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          l10n.manageUsersTitle,
          style:
              AppTypography.heading3.copyWith(color: AppColors.textOnPrimary),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddLearnerSheet(context, ref, l10n),
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: AppColors.textOnPrimary),
      ),
      body: learners.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(Spacing.xxl),
                child: Text(
                  l10n.manageUsersEmpty,
                  style: AppTypography.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(Spacing.lg),
              itemCount: learners.length,
              separatorBuilder: (_, __) => const SizedBox(height: Spacing.sm),
              itemBuilder: (context, index) {
                final learner = learners[index];
                return Dismissible(
                  key: Key(learner.id),
                  direction: DismissDirection.endToStart,
                  confirmDismiss: (_) => _confirmRemove(
                    context,
                    l10n,
                    learner.name,
                  ),
                  onDismissed: (_) {
                    ref
                        .read(userManagementProvider.notifier)
                        .removeLearner(learner.id);
                  },
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: Spacing.xl),
                    decoration: BoxDecoration(
                      color: AppColors.error,
                      borderRadius: BorderRadius.circular(Radii.md),
                    ),
                    child: const Icon(Icons.delete_outline_rounded,
                        color: AppColors.textOnPrimary),
                  ),
                  child: LearnerListTile(
                    name: learner.name,
                    lrn: learner.lrn,
                    section: learner.section,
                    status: learner.status,
                    onTap: () =>
                        _showEditLearnerSheet(context, ref, l10n, learner),
                  ),
                );
              },
            ),
    );
  }

  Future<bool?> _confirmRemove(
    BuildContext context,
    AppLocalizations l10n,
    String name,
  ) {
    return showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.manageUsersRemove, style: AppTypography.heading3),
        content: Text(
          l10n.manageUsersRemoveConfirm(name),
          style: AppTypography.bodyLarge,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(l10n.manageUsersCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: FilledButton.styleFrom(backgroundColor: AppColors.error),
            child: Text(l10n.manageUsersRemove),
          ),
        ],
      ),
    );
  }

  void _showAddLearnerSheet(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
  ) {
    final lrnController = TextEditingController();
    final nameController = TextEditingController();
    final gradeController = TextEditingController(text: '1');
    final sectionController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(Radii.xl)),
      ),
      builder: (ctx) => Padding(
        padding: EdgeInsets.fromLTRB(
          Spacing.xl,
          Spacing.xl,
          Spacing.xl,
          MediaQuery.of(ctx).viewInsets.bottom + Spacing.xl,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(l10n.manageUsersAddLearner, style: AppTypography.heading3),
            const SizedBox(height: Spacing.lg),
            TextField(
              controller: lrnController,
              decoration: InputDecoration(
                labelText: l10n.manageUsersLrnLabel,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Radii.md),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: Spacing.md),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: l10n.manageUsersNameLabel,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Radii.md),
                ),
              ),
            ),
            const SizedBox(height: Spacing.md),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: gradeController,
                    decoration: InputDecoration(
                      labelText: l10n.manageUsersGradeLabel,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Radii.md),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: Spacing.md),
                Expanded(
                  child: TextField(
                    controller: sectionController,
                    decoration: InputDecoration(
                      labelText: l10n.manageUsersSectionLabel,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Radii.md),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: Spacing.xl),
            SizedBox(
              height: TouchTargets.buttonHeight,
              child: FilledButton(
                onPressed: () {
                  if (nameController.text.isNotEmpty &&
                      lrnController.text.isNotEmpty) {
                    ref.read(userManagementProvider.notifier).addLearner(
                          ManagedLearner(
                            id: 'ml-${DateTime.now().millisecondsSinceEpoch}',
                            name: nameController.text,
                            lrn: lrnController.text,
                            grade: int.tryParse(gradeController.text) ?? 1,
                            section: sectionController.text,
                            status: 'on-track',
                          ),
                        );
                    Navigator.of(ctx).pop();
                  }
                },
                child: Text(l10n.manageUsersSave),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditLearnerSheet(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
    ManagedLearner learner,
  ) {
    final nameController = TextEditingController(text: learner.name);
    final sectionController = TextEditingController(text: learner.section);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(Radii.xl)),
      ),
      builder: (ctx) => Padding(
        padding: EdgeInsets.fromLTRB(
          Spacing.xl,
          Spacing.xl,
          Spacing.xl,
          MediaQuery.of(ctx).viewInsets.bottom + Spacing.xl,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Edit Learner', style: AppTypography.heading3),
            const SizedBox(height: Spacing.lg),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: l10n.manageUsersNameLabel,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Radii.md),
                ),
              ),
            ),
            const SizedBox(height: Spacing.md),
            TextField(
              controller: sectionController,
              decoration: InputDecoration(
                labelText: l10n.manageUsersSectionLabel,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Radii.md),
                ),
              ),
            ),
            const SizedBox(height: Spacing.xl),
            SizedBox(
              height: TouchTargets.buttonHeight,
              child: FilledButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: Text(l10n.manageUsersSave),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
