import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_event.freezed.dart';
part 'activity_event.g.dart';

/// Domain entity representing a recent activity event on the teacher dashboard.
@freezed
class ActivityEvent with _$ActivityEvent {
  const factory ActivityEvent({
    required String id,
    required String learnerName,
    required String description,
    required DateTime timestamp,
  }) = _ActivityEvent;

  factory ActivityEvent.fromJson(Map<String, dynamic> json) =>
      _$ActivityEventFromJson(json);
}
