// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dictionary_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DictionaryEntryImpl _$$DictionaryEntryImplFromJson(
        Map<String, dynamic> json) =>
    _$DictionaryEntryImpl(
      id: json['id'] as String,
      word: json['word'] as String,
      letter: json['letter'] as String,
      category: json['category'] as String,
      phoneme: json['phoneme'] as String,
      imageUrl: json['imageUrl'] as String?,
      audioUrl: json['audioUrl'] as String?,
    );

Map<String, dynamic> _$$DictionaryEntryImplToJson(
        _$DictionaryEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'word': instance.word,
      'letter': instance.letter,
      'category': instance.category,
      'phoneme': instance.phoneme,
      'imageUrl': instance.imageUrl,
      'audioUrl': instance.audioUrl,
    };
