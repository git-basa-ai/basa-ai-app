import 'package:freezed_annotation/freezed_annotation.dart';

part 'learner_progress.freezed.dart';
part 'learner_progress.g.dart';

/// Domain entity representing a learner's overall progress.
@freezed
class LearnerProgress with _$LearnerProgress {
  const factory LearnerProgress({
    required String learnerId,
    required int totalXp,
    required int level,
    required int xpForNextLevel,
    required int completedLessons,
    required int totalLessons,
    required List<String> completedLessonIds,
  }) = _LearnerProgress;

  factory LearnerProgress.fromJson(Map<String, dynamic> json) =>
      _$LearnerProgressFromJson(json);
}
