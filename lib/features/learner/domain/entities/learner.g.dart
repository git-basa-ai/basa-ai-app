// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LearnerImpl _$$LearnerImplFromJson(Map<String, dynamic> json) =>
    _$LearnerImpl(
      uid: json['uid'] as String,
      lrn: json['lrn'] as String,
      name: json['name'] as String,
      grade: (json['grade'] as num).toInt(),
      section: json['section'] as String,
      xp: (json['xp'] as num).toInt(),
      level: (json['level'] as num).toInt(),
    );

Map<String, dynamic> _$$LearnerImplToJson(_$LearnerImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'lrn': instance.lrn,
      'name': instance.name,
      'grade': instance.grade,
      'section': instance.section,
      'xp': instance.xp,
      'level': instance.level,
    };
