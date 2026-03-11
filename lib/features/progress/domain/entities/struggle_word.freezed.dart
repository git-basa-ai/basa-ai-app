// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'struggle_word.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StruggleWord _$StruggleWordFromJson(Map<String, dynamic> json) {
  return _StruggleWord.fromJson(json);
}

/// @nodoc
mixin _$StruggleWord {
  String get id => throw _privateConstructorUsedError;
  String get word => throw _privateConstructorUsedError;
  String get phoneme => throw _privateConstructorUsedError;
  int get failCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StruggleWordCopyWith<StruggleWord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StruggleWordCopyWith<$Res> {
  factory $StruggleWordCopyWith(
          StruggleWord value, $Res Function(StruggleWord) then) =
      _$StruggleWordCopyWithImpl<$Res, StruggleWord>;
  @useResult
  $Res call({String id, String word, String phoneme, int failCount});
}

/// @nodoc
class _$StruggleWordCopyWithImpl<$Res, $Val extends StruggleWord>
    implements $StruggleWordCopyWith<$Res> {
  _$StruggleWordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? word = null,
    Object? phoneme = null,
    Object? failCount = null,
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
      phoneme: null == phoneme
          ? _value.phoneme
          : phoneme // ignore: cast_nullable_to_non_nullable
              as String,
      failCount: null == failCount
          ? _value.failCount
          : failCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StruggleWordImplCopyWith<$Res>
    implements $StruggleWordCopyWith<$Res> {
  factory _$$StruggleWordImplCopyWith(
          _$StruggleWordImpl value, $Res Function(_$StruggleWordImpl) then) =
      __$$StruggleWordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String word, String phoneme, int failCount});
}

/// @nodoc
class __$$StruggleWordImplCopyWithImpl<$Res>
    extends _$StruggleWordCopyWithImpl<$Res, _$StruggleWordImpl>
    implements _$$StruggleWordImplCopyWith<$Res> {
  __$$StruggleWordImplCopyWithImpl(
      _$StruggleWordImpl _value, $Res Function(_$StruggleWordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? word = null,
    Object? phoneme = null,
    Object? failCount = null,
  }) {
    return _then(_$StruggleWordImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      phoneme: null == phoneme
          ? _value.phoneme
          : phoneme // ignore: cast_nullable_to_non_nullable
              as String,
      failCount: null == failCount
          ? _value.failCount
          : failCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StruggleWordImpl implements _StruggleWord {
  const _$StruggleWordImpl(
      {required this.id,
      required this.word,
      required this.phoneme,
      required this.failCount});

  factory _$StruggleWordImpl.fromJson(Map<String, dynamic> json) =>
      _$$StruggleWordImplFromJson(json);

  @override
  final String id;
  @override
  final String word;
  @override
  final String phoneme;
  @override
  final int failCount;

  @override
  String toString() {
    return 'StruggleWord(id: $id, word: $word, phoneme: $phoneme, failCount: $failCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StruggleWordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.phoneme, phoneme) || other.phoneme == phoneme) &&
            (identical(other.failCount, failCount) ||
                other.failCount == failCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, word, phoneme, failCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StruggleWordImplCopyWith<_$StruggleWordImpl> get copyWith =>
      __$$StruggleWordImplCopyWithImpl<_$StruggleWordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StruggleWordImplToJson(
      this,
    );
  }
}

abstract class _StruggleWord implements StruggleWord {
  const factory _StruggleWord(
      {required final String id,
      required final String word,
      required final String phoneme,
      required final int failCount}) = _$StruggleWordImpl;

  factory _StruggleWord.fromJson(Map<String, dynamic> json) =
      _$StruggleWordImpl.fromJson;

  @override
  String get id;
  @override
  String get word;
  @override
  String get phoneme;
  @override
  int get failCount;
  @override
  @JsonKey(ignore: true)
  _$$StruggleWordImplCopyWith<_$StruggleWordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
