// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClassInfoImpl _$$ClassInfoImplFromJson(Map<String, dynamic> json) =>
    _$ClassInfoImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      grade: (json['grade'] as num).toInt(),
      section: json['section'] as String,
      totalLearners: (json['totalLearners'] as num).toInt(),
      onTrack: (json['onTrack'] as num).toInt(),
      needsHelp: (json['needsHelp'] as num).toInt(),
      nonReaders: (json['nonReaders'] as num).toInt(),
    );

Map<String, dynamic> _$$ClassInfoImplToJson(_$ClassInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'grade': instance.grade,
      'section': instance.section,
      'totalLearners': instance.totalLearners,
      'onTrack': instance.onTrack,
      'needsHelp': instance.needsHelp,
      'nonReaders': instance.nonReaders,
    };
