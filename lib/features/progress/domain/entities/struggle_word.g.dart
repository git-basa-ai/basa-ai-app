// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'struggle_word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StruggleWordImpl _$$StruggleWordImplFromJson(Map<String, dynamic> json) =>
    _$StruggleWordImpl(
      id: json['id'] as String,
      word: json['word'] as String,
      phoneme: json['phoneme'] as String,
      failCount: (json['failCount'] as num).toInt(),
    );

Map<String, dynamic> _$$StruggleWordImplToJson(_$StruggleWordImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'word': instance.word,
      'phoneme': instance.phoneme,
      'failCount': instance.failCount,
    };
