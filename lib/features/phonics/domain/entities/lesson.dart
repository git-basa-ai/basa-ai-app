import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson.freezed.dart';
part 'lesson.g.dart';

/// Domain entity representing a phonics lesson.
@freezed
class Lesson with _$Lesson {
  const factory Lesson({
    required String id,
    required String title,
    required String phoneme,
    required String description,
    required int order,
    required int level,
    @Default(false) bool completed,
    @Default(0.0) double progress,
  }) = _Lesson;

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);
}
