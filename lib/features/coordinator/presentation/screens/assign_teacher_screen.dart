import 'package:flutter/material.dart';
import 'package:basa_ai/l10n/generated/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../../../shared/utils/constants.dart';
import '../providers/class_assignment_provider.dart';

/// Screen for coordinator to assign teachers to classes.
///
/// Phase 3 stub — implemented with mock providers.
class AssignTeacherScreen extends ConsumerWidget {
  const AssignTeacherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final classes = ref.watch(classProvider);

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        title: Text(
          l10n.assignTeacherTitle,
          style: AppTypography.heading3.copyWith(color: AppColors.textOnPrimary),
        ),
      ),
      body: classes.isEmpty
          ? _buildEmptyState(context, l10n, ref)
          : ListView.separated(
              padding: const EdgeInsets.all(Spacing.lg),
              itemCount: classes.length,
              separatorBuilder: (_, __) => const SizedBox(height: Spacing.md),
              itemBuilder: (context, index) {
                final schoolClass = classes[index];
                return _ClassCard(schoolClass: schoolClass);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateClassSheet(context, ref, l10n),
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, AppLocalizations l10n, WidgetRef ref) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.xxxl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.class_outlined, size: 64, color: AppColors.textSecondary),
            const SizedBox(height: Spacing.md),
            Text(
              l10n.assignTeacherEmpty,
              textAlign: TextAlign.center,
              style: AppTypography.bodyLarge.copyWith(color: AppColors.textSecondary),
            ),
            const SizedBox(height: Spacing.xl),
            ElevatedButton.icon(
              onPressed: () => _showCreateClassSheet(context, ref, l10n),
              icon: const Icon(Icons.add),
              label: Text(l10n.assignTeacherCreateClass),
            ),
          ],
        ),
      ),
    );
  }

  void _showCreateClassSheet(BuildContext context, WidgetRef ref, AppLocalizations l10n) {
    String? selectedGrade;
    final nameController = TextEditingController();
    final grades = ['Grade 1', 'Grade 2', 'Grade 3', 'Grade 4', 'Grade 5', 'Grade 6'];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(Radii.lg)),
      ),
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) => Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: Spacing.lg,
            right: Spacing.lg,
            top: Spacing.lg,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.assignTeacherCreateClass, style: AppTypography.heading3),
              const SizedBox(height: Spacing.lg),
              DropdownButtonFormField<String>(
                value: selectedGrade,
                decoration: InputDecoration(
                  labelText: l10n.assignTeacherGradeLabel,
                  hintText: 'Select grade level',
                ),
                items: grades
                    .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                    .toList(),
                onChanged: (val) => setModalState(() => selectedGrade = val),
              ),
              const SizedBox(height: Spacing.md),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: l10n.assignTeacherSectionLabel,
                  hintText: 'e.g. Sampaguita',
                ),
              ),
              const SizedBox(height: Spacing.xxxl),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedGrade != null && nameController.text.isNotEmpty) {
                      ref.read(classControllerProvider).createClass(
                            selectedGrade!,
                            nameController.text,
                          );
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(l10n.assignTeacherCreateSuccess)),
                      );
                    }
                  },
                  child: Text(l10n.manageUsersSave),
                ),
              ),
              const SizedBox(height: Spacing.lg),
            ],
          ),
        ),
      ),
    );
  }
}

class _ClassCard extends ConsumerWidget {
  final SchoolClass schoolClass;

  const _ClassCard({required this.schoolClass});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final isAssigned = schoolClass.teacherId != null;

    return Container(
      padding: const EdgeInsets.all(Spacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(Radii.lg),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(schoolClass.name, style: AppTypography.heading3),
                    Text(schoolClass.grade, style: AppTypography.bodySecondary),
                  ],
                ),
              ),
              if (!isAssigned)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: Spacing.sm, vertical: Spacing.xs),
                  decoration: BoxDecoration(
                    color: AppColors.error.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(Radii.sm),
                  ),
                  child: Text(
                    l10n.assignTeacherUnassigned,
                    style: AppTypography.labelMedium.copyWith(color: AppColors.error),
                  ),
                ),
            ],
          ),
          const SizedBox(height: Spacing.lg),
          if (isAssigned)
            Row(
              children: [
                const Icon(Icons.person_outline, color: AppColors.secondary),
                const SizedBox(width: Spacing.sm),
                Text(
                  schoolClass.teacherName!,
                  style: AppTypography.labelMedium.copyWith(color: AppColors.secondary),
                ),
              ],
            )
          else
            Text(
              'No teacher assigned yet',
              style: AppTypography.bodySecondary.copyWith(fontStyle: FontStyle.italic),
            ),
          const SizedBox(height: Spacing.lg),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => _showAssignTeacherSheet(context, ref, l10n),
              child: Text(isAssigned ? l10n.assignTeacherReassign : l10n.assignTeacherButton),
            ),
          ),
        ],
      ),
    );
  }

  void _showAssignTeacherSheet(BuildContext context, WidgetRef ref, AppLocalizations l10n) {
    final teachers = ref.read(teacherProvider);

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(Radii.lg)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.assignTeacherSelectTeacher, style: AppTypography.heading3),
            const SizedBox(height: Spacing.lg),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: teachers.length,
                itemBuilder: (context, index) {
                  final teacher = teachers[index];
                  final isCurrent = teacher.id == schoolClass.teacherId;
                  
                  return ListTile(
                    leading: Icon(
                      isCurrent ? Icons.person : Icons.person_outline,
                      color: isCurrent ? AppColors.primary : null,
                    ),
                    title: Text(
                      teacher.name,
                      style: isCurrent ? const TextStyle(fontWeight: FontWeight.bold) : null,
                    ),
                    trailing: isCurrent ? const Icon(Icons.check, color: AppColors.primary) : null,
                    onTap: () {
                      ref.read(classControllerProvider).assignTeacher(schoolClass.id, teacher);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(l10n.assignTeacherSuccess)),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

