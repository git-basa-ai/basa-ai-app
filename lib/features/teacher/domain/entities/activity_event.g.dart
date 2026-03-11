// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActivityEventImpl _$$ActivityEventImplFromJson(Map<String, dynamic> json) =>
    _$ActivityEventImpl(
      id: json['id'] as String,
      learnerName: json['learnerName'] as String,
      description: json['description'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$ActivityEventImplToJson(_$ActivityEventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'learnerName': instance.learnerName,
      'description': instance.description,
      'timestamp': instance.timestamp.toIso8601String(),
    };
