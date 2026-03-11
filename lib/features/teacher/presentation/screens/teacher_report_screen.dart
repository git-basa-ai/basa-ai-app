import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../../../shared/utils/constants.dart';
import '../../../../shared/widgets/offline_banner.dart';
import '../../domain/entities/learner_report.dart';
import '../providers/report_provider.dart';

/// Teacher report screen with per-learner progress table and status colors.
class TeacherReportScreen extends ConsumerStatefulWidget {
  const TeacherReportScreen({super.key});

  @override
  ConsumerState<TeacherReportScreen> createState() =>
      _TeacherReportScreenState();
}

class _TeacherReportScreenState extends ConsumerState<TeacherReportScreen> {
  DateTimeRange? _dateRange;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final reports = ref.watch(reportProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          l10n.teacherReportTitle,
          style:
              AppTypography.heading3.copyWith(color: AppColors.textOnPrimary),
        ),
      ),
      body: Column(
        children: [
          const OfflineBanner(isOffline: false),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(Spacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date range filter + Download.
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () async {
                            final range = await showDateRangePicker(
                              context: context,
                              firstDate: DateTime.now()
                                  .subtract(const Duration(days: 365)),
                              lastDate: DateTime.now(),
                            );
                            if (range != null) {
                              setState(() => _dateRange = range);
                            }
                          },
                          icon: const Icon(Icons.date_range_rounded),
                          label: Text(
                            _dateRange != null
                                ? '${_dateRange!.start.month}/${_dateRange!.start.day} – ${_dateRange!.end.month}/${_dateRange!.end.day}'
                                : l10n.teacherReportDateRange,
                          ),
                        ),
                      ),
                      const SizedBox(width: Spacing.md),
                      SizedBox(
                        height: TouchTargets.buttonHeight,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.download_rounded),
                          label: Text(l10n.teacherReportDownload),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: Spacing.xxl),

                  // Progress data table.
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(Radii.lg),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        headingTextStyle: AppTypography.labelMedium,
                        dataTextStyle: AppTypography.bodyMedium,
                        columns: [
                          DataColumn(label: Text(l10n.teacherReportName)),
                          DataColumn(label: Text(l10n.teacherReportLessons)),
                          DataColumn(label: Text(l10n.teacherReportAvgScore)),
                          DataColumn(label: Text(l10n.teacherReportStatus)),
                          DataColumn(
                              label: Text(l10n.teacherReportStruggleWords)),
                        ],
                        rows: reports.map((r) => _buildRow(l10n, r)).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataRow _buildRow(AppLocalizations l10n, LearnerReport report) {
    return DataRow(
      cells: [
        DataCell(Text(report.name)),
        DataCell(Text('${report.lessonsCompleted}')),
        DataCell(Text('${report.avgScore.toStringAsFixed(0)}%')),
        DataCell(_StatusBadge(status: report.status, l10n: l10n)),
        DataCell(
          Text(
            report.struggleWords.isEmpty
                ? '—'
                : report.struggleWords.join(', '),
          ),
        ),
      ],
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String status;
  final AppLocalizations l10n;

  const _StatusBadge({required this.status, required this.l10n});

  @override
  Widget build(BuildContext context) {
    Color color;
    String label;
    switch (status) {
      case 'on-track':
        color = AppColors.success;
        label = l10n.teacherReportStatusOnTrack;
      case 'needs-help':
        color = AppColors.secondary;
        label = l10n.teacherReportStatusNeedsHelp;
      case 'non-reader':
        color = AppColors.error;
        label = l10n.teacherReportStatusNonReader;
      default:
        color = AppColors.textSecondary;
        label = status;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.sm,
        vertical: Spacing.xs,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(Radii.sm),
      ),
      child: Text(
        label,
        style: AppTypography.bodyMedium.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
