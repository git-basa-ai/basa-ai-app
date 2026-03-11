// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonImpl _$$LessonImplFromJson(Map<String, dynamic> json) => _$LessonImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      phoneme: json['phoneme'] as String,
      description: json['description'] as String,
      order: (json['order'] as num).toInt(),
      level: (json['level'] as num).toInt(),
      completed: json['completed'] as bool? ?? false,
      progress: (json['progress'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$LessonImplToJson(_$LessonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'phoneme': instance.phoneme,
      'description': instance.description,
      'order': instance.order,
      'level': instance.level,
      'completed': instance.completed,
      'progress': instance.progress,
    };
