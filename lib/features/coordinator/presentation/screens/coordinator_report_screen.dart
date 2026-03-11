import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../../../shared/utils/constants.dart';
import '../providers/coordinator_report_provider.dart';

/// Coordinator Report Screen — Phil-IRI comparison + section breakdown + export.
class CoordinatorReportScreen extends ConsumerWidget {
  const CoordinatorReportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final philIri = ref.watch(philIriProvider);
    final sections = ref.watch(sectionReportProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          l10n.coordinatorReportTitle,
          style:
              AppTypography.heading3.copyWith(color: AppColors.textOnPrimary),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(Spacing.lg),
        children: [
          // ── Phil-IRI Comparison ──
          Text(l10n.coordinatorReportPhilIri, style: AppTypography.heading3),
          const SizedBox(height: Spacing.sm),
          Container(
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(Radii.lg),
              border: Border.all(color: AppColors.border),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowColor: MaterialStateProperty.all(
                    AppColors.primary.withOpacity(0.1)),
                columns: [
                  const DataColumn(label: Text('Name')),
                  DataColumn(label: Text(l10n.coordinatorReportPreTest)),
                  DataColumn(label: Text(l10n.coordinatorReportPostTest)),
                  DataColumn(label: Text(l10n.coordinatorReportDelta)),
                ],
                rows: philIri.map((e) {
                  final delta = e.delta;
                  return DataRow(cells: [
                    DataCell(Text(e.name, style: AppTypography.labelMedium)),
                    DataCell(Text('${e.preTest.toStringAsFixed(0)}%')),
                    DataCell(Text('${e.postTest.toStringAsFixed(0)}%')),
                    DataCell(
                      Text(
                        '${delta >= 0 ? '+' : ''}${delta.toStringAsFixed(0)}%',
                        style: AppTypography.labelMedium.copyWith(
                          color:
                              delta >= 0 ? AppColors.success : AppColors.error,
                        ),
                      ),
                    ),
                  ]);
                }).toList(),
              ),
            ),
          ),

          const SizedBox(height: Spacing.xl),

          // ── Section Breakdown ──
          Text(l10n.coordinatorReportSectionBreakdown,
              style: AppTypography.heading3),
          const SizedBox(height: Spacing.sm),
          ...sections.map((s) => Padding(
                padding: const EdgeInsets.only(bottom: Spacing.sm),
                child: Container(
                  padding: const EdgeInsets.all(Spacing.lg),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(Radii.lg),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(s.className, style: AppTypography.labelLarge),
                      Text(s.teacher, style: AppTypography.bodySecondary),
                      const SizedBox(height: Spacing.sm),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Learners: ${s.learnerCount}',
                              style: AppTypography.bodyLarge),
                          Text(
                            'Avg: ${s.avgScore.toStringAsFixed(0)}%',
                            style: AppTypography.labelMedium
                                .copyWith(color: AppColors.primary),
                          ),
                        ],
                      ),
                      const SizedBox(height: Spacing.xs),
                      Row(
                        children: [
                          Text('On Track: ${s.onTrack}/${s.learnerCount}',
                              style: AppTypography.bodySecondary),
                          const SizedBox(width: Spacing.sm),
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(Radii.sm),
                              child: LinearProgressIndicator(
                                value: s.onTrack / s.learnerCount,
                                backgroundColor:
                                    AppColors.primary.withOpacity(0.1),
                                color: AppColors.success,
                                minHeight: 6,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )),

          const SizedBox(height: Spacing.xl),

          // ── Export Buttons ──
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(l10n.coordinatorReportExportPdf)),
                    );
                  },
                  icon: const Icon(Iconsax.document_download),
                  label: Text(l10n.coordinatorReportExportPdf),
                ),
              ),
              const SizedBox(width: Spacing.md),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(l10n.coordinatorReportExportCsv)),
                    );
                  },
                  icon: const Icon(Iconsax.document_text),
                  label: Text(l10n.coordinatorReportExportCsv),
                ),
              ),
            ],
          ),

          const SizedBox(height: Spacing.lg),
        ],
      ),
    );
  }
}
