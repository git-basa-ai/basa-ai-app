import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../../../shared/utils/constants.dart';
import '../providers/feedback_provider.dart';

/// Teacher Feedback Screen — view and add notes about a learner.
class FeedbackScreen extends ConsumerStatefulWidget {
  const FeedbackScreen({super.key});

  @override
  ConsumerState<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends ConsumerState<FeedbackScreen> {
  final _noteController = TextEditingController();

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final notes = ref.watch(feedbackProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          l10n.feedbackTitle,
          style:
              AppTypography.heading3.copyWith(color: AppColors.textOnPrimary),
        ),
      ),
      body: Column(
        children: [
          // Learner name header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(Spacing.lg),
            color: AppColors.surface,
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      'J',
                      style: AppTypography.labelLarge.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: Spacing.md),
                Text('Juan Dela Cruz', style: AppTypography.heading3),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.border),

          // Add note section
          Padding(
            padding: const EdgeInsets.all(Spacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _noteController,
                  maxLength: 300,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: l10n.feedbackHint,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Radii.md),
                    ),
                    counterText: '',
                  ),
                  onChanged: (_) => setState(() {}),
                ),
                const SizedBox(height: Spacing.sm),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      l10n.feedbackCharLimit(_noteController.text.length),
                      style: AppTypography.bodySecondary,
                    ),
                    FilledButton(
                      onPressed: _noteController.text.trim().isNotEmpty
                          ? () {
                              ref
                                  .read(feedbackProvider.notifier)
                                  .addNote(_noteController.text.trim());
                              _noteController.clear();
                              setState(() {});
                            }
                          : null,
                      child: Text(l10n.feedbackSave),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.border),

          // Feedback notes list
          Expanded(
            child: notes.isEmpty
                ? Center(
                    child: Text(l10n.feedbackEmpty,
                        style: AppTypography.bodyLarge),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(Spacing.lg),
                    itemCount: notes.length,
                    separatorBuilder: (_, __) =>
                        const SizedBox(height: Spacing.sm),
                    itemBuilder: (context, index) {
                      final note = notes[index];
                      return Container(
                        padding: const EdgeInsets.all(Spacing.lg),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(Radii.md),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(note.date, style: AppTypography.bodySecondary),
                            const SizedBox(height: Spacing.sm),
                            Text(note.text, style: AppTypography.bodyMedium),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
