// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learner_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LearnerReportImpl _$$LearnerReportImplFromJson(Map<String, dynamic> json) =>
    _$LearnerReportImpl(
      learnerId: json['learnerId'] as String,
      name: json['name'] as String,
      lessonsCompleted: (json['lessonsCompleted'] as num).toInt(),
      avgScore: (json['avgScore'] as num).toDouble(),
      status: json['status'] as String,
      struggleWords: (json['struggleWords'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$LearnerReportImplToJson(_$LearnerReportImpl instance) =>
    <String, dynamic>{
      'learnerId': instance.learnerId,
      'name': instance.name,
      'lessonsCompleted': instance.lessonsCompleted,
      'avgScore': instance.avgScore,
      'status': instance.status,
      'struggleWords': instance.struggleWords,
    };
