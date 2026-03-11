import 'package:freezed_annotation/freezed_annotation.dart';

part 'learner.freezed.dart';
part 'learner.g.dart';

/// Domain entity representing a learner profile.
@freezed
class Learner with _$Learner {
  const factory Learner({
    required String uid,
    required String lrn,
    required String name,
    required int grade,
    required String section,
    required int xp,
    required int level,
  }) = _Learner;

  factory Learner.fromJson(Map<String, dynamic> json) =>
      _$LearnerFromJson(json);
}
