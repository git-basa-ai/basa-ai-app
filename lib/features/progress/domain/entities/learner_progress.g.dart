// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learner_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LearnerProgressImpl _$$LearnerProgressImplFromJson(
        Map<String, dynamic> json) =>
    _$LearnerProgressImpl(
      learnerId: json['learnerId'] as String,
      totalXp: (json['totalXp'] as num).toInt(),
      level: (json['level'] as num).toInt(),
      xpForNextLevel: (json['xpForNextLevel'] as num).toInt(),
      completedLessons: (json['completedLessons'] as num).toInt(),
      totalLessons: (json['totalLessons'] as num).toInt(),
      completedLessonIds: (json['completedLessonIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$LearnerProgressImplToJson(
        _$LearnerProgressImpl instance) =>
    <String, dynamic>{
      'learnerId': instance.learnerId,
      'totalXp': instance.totalXp,
      'level': instance.level,
      'xpForNextLevel': instance.xpForNextLevel,
      'completedLessons': instance.completedLessons,
      'totalLessons': instance.totalLessons,
      'completedLessonIds': instance.completedLessonIds,
    };
