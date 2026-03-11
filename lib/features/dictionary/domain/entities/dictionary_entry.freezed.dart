// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dictionary_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DictionaryEntry _$DictionaryEntryFromJson(Map<String, dynamic> json) {
  return _DictionaryEntry.fromJson(json);
}

/// @nodoc
mixin _$DictionaryEntry {
  String get id => throw _privateConstructorUsedError;
  String get word => throw _privateConstructorUsedError;
  String get letter => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get phoneme => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get audioUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DictionaryEntryCopyWith<DictionaryEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DictionaryEntryCopyWith<$Res> {
  factory $DictionaryEntryCopyWith(
          DictionaryEntry value, $Res Function(DictionaryEntry) then) =
      _$DictionaryEntryCopyWithImpl<$Res, DictionaryEntry>;
  @useResult
  $Res call(
      {String id,
      String word,
      String letter,
      String category,
      String phoneme,
      String? imageUrl,
      String? audioUrl});
}

/// @nodoc
class _$DictionaryEntryCopyWithImpl<$Res, $Val extends DictionaryEntry>
    implements $DictionaryEntryCopyWith<$Res> {
  _$DictionaryEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? word = null,
    Object? letter = null,
    Object? category = null,
    Object? phoneme = null,
    Object? imageUrl = freezed,
    Object? audioUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      letter: null == letter
          ? _value.letter
          : letter // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      phoneme: null == phoneme
          ? _value.phoneme
          : phoneme // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      audioUrl: freezed == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DictionaryEntryImplCopyWith<$Res>
    implements $DictionaryEntryCopyWith<$Res> {
  factory _$$DictionaryEntryImplCopyWith(_$DictionaryEntryImpl value,
          $Res Function(_$DictionaryEntryImpl) then) =
      __$$DictionaryEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String word,
      String letter,
      String category,
      String phoneme,
      String? imageUrl,
      String? audioUrl});
}

/// @nodoc
class __$$DictionaryEntryImplCopyWithImpl<$Res>
    extends _$DictionaryEntryCopyWithImpl<$Res, _$DictionaryEntryImpl>
    implements _$$DictionaryEntryImplCopyWith<$Res> {
  __$$DictionaryEntryImplCopyWithImpl(
      _$DictionaryEntryImpl _value, $Res Function(_$DictionaryEntryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? word = null,
    Object? letter = null,
    Object? category = null,
    Object? phoneme = null,
    Object? imageUrl = freezed,
    Object? audioUrl = freezed,
  }) {
    return _then(_$DictionaryEntryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      letter: null == letter
          ? _value.letter
          : letter // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      phoneme: null == phoneme
          ? _value.phoneme
          : phoneme // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      audioUrl: freezed == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DictionaryEntryImpl implements _DictionaryEntry {
  const _$DictionaryEntryImpl(
      {required this.id,
      required this.word,
      required this.letter,
      required this.category,
      required this.phoneme,
      this.imageUrl,
      this.audioUrl});

  factory _$DictionaryEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$DictionaryEntryImplFromJson(json);

  @override
  final String id;
  @override
  final String word;
  @override
  final String letter;
  @override
  final String category;
  @override
  final String phoneme;
  @override
  final String? imageUrl;
  @override
  final String? audioUrl;

  @override
  String toString() {
    return 'DictionaryEntry(id: $id, word: $word, letter: $letter, category: $category, phoneme: $phoneme, imageUrl: $imageUrl, audioUrl: $audioUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DictionaryEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.letter, letter) || other.letter == letter) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.phoneme, phoneme) || other.phoneme == phoneme) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.audioUrl, audioUrl) ||
                other.audioUrl == audioUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, word, letter, category, phoneme, imageUrl, audioUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DictionaryEntryImplCopyWith<_$DictionaryEntryImpl> get copyWith =>
      __$$DictionaryEntryImplCopyWithImpl<_$DictionaryEntryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DictionaryEntryImplToJson(
      this,
    );
  }
}

abstract class _DictionaryEntry implements DictionaryEntry {
  const factory _DictionaryEntry(
      {required final String id,
      required final String word,
      required final String letter,
      required final String category,
      required final String phoneme,
      final String? imageUrl,
      final String? audioUrl}) = _$DictionaryEntryImpl;

  factory _DictionaryEntry.fromJson(Map<String, dynamic> json) =
      _$DictionaryEntryImpl.fromJson;

  @override
  String get id;
  @override
  String get word;
  @override
  String get letter;
  @override
  String get category;
  @override
  String get phoneme;
  @override
  String? get imageUrl;
  @override
  String? get audioUrl;
  @override
  @JsonKey(ignore: true)
  _$$DictionaryEntryImplCopyWith<_$DictionaryEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
