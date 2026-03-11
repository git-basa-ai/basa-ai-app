import 'package:freezed_annotation/freezed_annotation.dart';

part 'class_info.freezed.dart';
part 'class_info.g.dart';

/// Domain entity representing a teacher's class.
@freezed
class ClassInfo with _$ClassInfo {
  const factory ClassInfo({
    required String id,
    required String name,
    required int grade,
    required String section,
    required int totalLearners,
    required int onTrack,
    required int needsHelp,
    required int nonReaders,
  }) = _ClassInfo;

  factory ClassInfo.fromJson(Map<String, dynamic> json) =>
      _$ClassInfoFromJson(json);
}
