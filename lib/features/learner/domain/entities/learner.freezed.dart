// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Learner _$LearnerFromJson(Map<String, dynamic> json) {
  return _Learner.fromJson(json);
}

/// @nodoc
mixin _$Learner {
  String get uid => throw _privateConstructorUsedError;
  String get lrn => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get grade => throw _privateConstructorUsedError;
  String get section => throw _privateConstructorUsedError;
  int get xp => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LearnerCopyWith<Learner> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LearnerCopyWith<$Res> {
  factory $LearnerCopyWith(Learner value, $Res Function(Learner) then) =
      _$LearnerCopyWithImpl<$Res, Learner>;
  @useResult
  $Res call(
      {String uid,
      String lrn,
      String name,
      int grade,
      String section,
      int xp,
      int level});
}

/// @nodoc
class _$LearnerCopyWithImpl<$Res, $Val extends Learner>
    implements $LearnerCopyWith<$Res> {
  _$LearnerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? lrn = null,
    Object? name = null,
    Object? grade = null,
    Object? section = null,
    Object? xp = null,
    Object? level = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      lrn: null == lrn
          ? _value.lrn
          : lrn // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      grade: null == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as int,
      section: null == section
          ? _value.section
          : section // ignore: cast_nullable_to_non_nullable
              as String,
      xp: null == xp
          ? _value.xp
          : xp // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LearnerImplCopyWith<$Res> implements $LearnerCopyWith<$Res> {
  factory _$$LearnerImplCopyWith(
          _$LearnerImpl value, $Res Function(_$LearnerImpl) then) =
      __$$LearnerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String lrn,
      String name,
      int grade,
      String section,
      int xp,
      int level});
}

/// @nodoc
class __$$LearnerImplCopyWithImpl<$Res>
    extends _$LearnerCopyWithImpl<$Res, _$LearnerImpl>
    implements _$$LearnerImplCopyWith<$Res> {
  __$$LearnerImplCopyWithImpl(
      _$LearnerImpl _value, $Res Function(_$LearnerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? lrn = null,
    Object? name = null,
    Object? grade = null,
    Object? section = null,
    Object? xp = null,
    Object? level = null,
  }) {
    return _then(_$LearnerImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      lrn: null == lrn
          ? _value.lrn
          : lrn // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      grade: null == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as int,
      section: null == section
          ? _value.section
          : section // ignore: cast_nullable_to_non_nullable
              as String,
      xp: null == xp
          ? _value.xp
          : xp // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LearnerImpl implements _Learner {
  const _$LearnerImpl(
      {required this.uid,
      required this.lrn,
      required this.name,
      required this.grade,
      required this.section,
      required this.xp,
      required this.level});

  factory _$LearnerImpl.fromJson(Map<String, dynamic> json) =>
      _$$LearnerImplFromJson(json);

  @override
  final String uid;
  @override
  final String lrn;
  @override
  final String name;
  @override
  final int grade;
  @override
  final String section;
  @override
  final int xp;
  @override
  final int level;

  @override
  String toString() {
    return 'Learner(uid: $uid, lrn: $lrn, name: $name, grade: $grade, section: $section, xp: $xp, level: $level)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LearnerImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.lrn, lrn) || other.lrn == lrn) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.grade, grade) || other.grade == grade) &&
            (identical(other.section, section) || other.section == section) &&
            (identical(other.xp, xp) || other.xp == xp) &&
            (identical(other.level, level) || other.level == level));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, uid, lrn, name, grade, section, xp, level);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LearnerImplCopyWith<_$LearnerImpl> get copyWith =>
      __$$LearnerImplCopyWithImpl<_$LearnerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LearnerImplToJson(
      this,
    );
  }
}

abstract class _Learner implements Learner {
  const factory _Learner(
      {required final String uid,
      required final String lrn,
      required final String name,
      required final int grade,
      required final String section,
      required final int xp,
      required final int level}) = _$LearnerImpl;

  factory _Learner.fromJson(Map<String, dynamic> json) = _$LearnerImpl.fromJson;

  @override
  String get uid;
  @override
  String get lrn;
  @override
  String get name;
  @override
  int get grade;
  @override
  String get section;
  @override
  int get xp;
  @override
  int get level;
  @override
  @JsonKey(ignore: true)
  _$$LearnerImplCopyWith<_$LearnerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
