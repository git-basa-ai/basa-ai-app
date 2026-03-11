import 'package:freezed_annotation/freezed_annotation.dart';

part 'learner_report.freezed.dart';
part 'learner_report.g.dart';

/// Domain entity representing a learner's report row in the teacher view.
@freezed
class LearnerReport with _$LearnerReport {
  const factory LearnerReport({
    required String learnerId,
    required String name,
    required int lessonsCompleted,
    required double avgScore,
    required String status,
    required List<String> struggleWords,
  }) = _LearnerReport;

  factory LearnerReport.fromJson(Map<String, dynamic> json) =>
      _$LearnerReportFromJson(json);
}
