// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learner_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LearnerProgress _$LearnerProgressFromJson(Map<String, dynamic> json) {
  return _LearnerProgress.fromJson(json);
}

/// @nodoc
mixin _$LearnerProgress {
  String get learnerId => throw _privateConstructorUsedError;
  int get totalXp => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  int get xpForNextLevel => throw _privateConstructorUsedError;
  int get completedLessons => throw _privateConstructorUsedError;
  int get totalLessons => throw _privateConstructorUsedError;
  List<String> get completedLessonIds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LearnerProgressCopyWith<LearnerProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LearnerProgressCopyWith<$Res> {
  factory $LearnerProgressCopyWith(
          LearnerProgress value, $Res Function(LearnerProgress) then) =
      _$LearnerProgressCopyWithImpl<$Res, LearnerProgress>;
  @useResult
  $Res call(
      {String learnerId,
      int totalXp,
      int level,
      int xpForNextLevel,
      int completedLessons,
      int totalLessons,
      List<String> completedLessonIds});
}

/// @nodoc
class _$LearnerProgressCopyWithImpl<$Res, $Val extends LearnerProgress>
    implements $LearnerProgressCopyWith<$Res> {
  _$LearnerProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? learnerId = null,
    Object? totalXp = null,
    Object? level = null,
    Object? xpForNextLevel = null,
    Object? completedLessons = null,
    Object? totalLessons = null,
    Object? completedLessonIds = null,
  }) {
    return _then(_value.copyWith(
      learnerId: null == learnerId
          ? _value.learnerId
          : learnerId // ignore: cast_nullable_to_non_nullable
              as String,
      totalXp: null == totalXp
          ? _value.totalXp
          : totalXp // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      xpForNextLevel: null == xpForNextLevel
          ? _value.xpForNextLevel
          : xpForNextLevel // ignore: cast_nullable_to_non_nullable
              as int,
      completedLessons: null == completedLessons
          ? _value.completedLessons
          : completedLessons // ignore: cast_nullable_to_non_nullable
              as int,
      totalLessons: null == totalLessons
          ? _value.totalLessons
          : totalLessons // ignore: cast_nullable_to_non_nullable
              as int,
      completedLessonIds: null == completedLessonIds
          ? _value.completedLessonIds
          : completedLessonIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LearnerProgressImplCopyWith<$Res>
    implements $LearnerProgressCopyWith<$Res> {
  factory _$$LearnerProgressImplCopyWith(_$LearnerProgressImpl value,
          $Res Function(_$LearnerProgressImpl) then) =
      __$$LearnerProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String learnerId,
      int totalXp,
      int level,
      int xpForNextLevel,
      int completedLessons,
      int totalLessons,
      List<String> completedLessonIds});
}

/// @nodoc
class __$$LearnerProgressImplCopyWithImpl<$Res>
    extends _$LearnerProgressCopyWithImpl<$Res, _$LearnerProgressImpl>
    implements _$$LearnerProgressImplCopyWith<$Res> {
  __$$LearnerProgressImplCopyWithImpl(
      _$LearnerProgressImpl _value, $Res Function(_$LearnerProgressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? learnerId = null,
    Object? totalXp = null,
    Object? level = null,
    Object? xpForNextLevel = null,
    Object? completedLessons = null,
    Object? totalLessons = null,
    Object? completedLessonIds = null,
  }) {
    return _then(_$LearnerProgressImpl(
      learnerId: null == learnerId
          ? _value.learnerId
          : learnerId // ignore: cast_nullable_to_non_nullable
              as String,
      totalXp: null == totalXp
          ? _value.totalXp
          : totalXp // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      xpForNextLevel: null == xpForNextLevel
          ? _value.xpForNextLevel
          : xpForNextLevel // ignore: cast_nullable_to_non_nullable
              as int,
      completedLessons: null == completedLessons
          ? _value.completedLessons
          : completedLessons // ignore: cast_nullable_to_non_nullable
              as int,
      totalLessons: null == totalLessons
          ? _value.totalLessons
          : totalLessons // ignore: cast_nullable_to_non_nullable
              as int,
      completedLessonIds: null == completedLessonIds
          ? _value._completedLessonIds
          : completedLessonIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LearnerProgressImpl implements _LearnerProgress {
  const _$LearnerProgressImpl(
      {required this.learnerId,
      required this.totalXp,
      required this.level,
      required this.xpForNextLevel,
      required this.completedLessons,
      required this.totalLessons,
      required final List<String> completedLessonIds})
      : _completedLessonIds = completedLessonIds;

  factory _$LearnerProgressImpl.fromJson(Map<String, dynamic> json) =>
      _$$LearnerProgressImplFromJson(json);

  @override
  final String learnerId;
  @override
  final int totalXp;
  @override
  final int level;
  @override
  final int xpForNextLevel;
  @override
  final int completedLessons;
  @override
  final int totalLessons;
  final List<String> _completedLessonIds;
  @override
  List<String> get completedLessonIds {
    if (_completedLessonIds is EqualUnmodifiableListView)
      return _completedLessonIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_completedLessonIds);
  }

  @override
  String toString() {
    return 'LearnerProgress(learnerId: $learnerId, totalXp: $totalXp, level: $level, xpForNextLevel: $xpForNextLevel, completedLessons: $completedLessons, totalLessons: $totalLessons, completedLessonIds: $completedLessonIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LearnerProgressImpl &&
            (identical(other.learnerId, learnerId) ||
                other.learnerId == learnerId) &&
            (identical(other.totalXp, totalXp) || other.totalXp == totalXp) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.xpForNextLevel, xpForNextLevel) ||
                other.xpForNextLevel == xpForNextLevel) &&
            (identical(other.completedLessons, completedLessons) ||
                other.completedLessons == completedLessons) &&
            (identical(other.totalLessons, totalLessons) ||
                other.totalLessons == totalLessons) &&
            const DeepCollectionEquality()
                .equals(other._completedLessonIds, _completedLessonIds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      learnerId,
      totalXp,
      level,
      xpForNextLevel,
      completedLessons,
      totalLessons,
      const DeepCollectionEquality().hash(_completedLessonIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LearnerProgressImplCopyWith<_$LearnerProgressImpl> get copyWith =>
      __$$LearnerProgressImplCopyWithImpl<_$LearnerProgressImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LearnerProgressImplToJson(
      this,
    );
  }
}

abstract class _LearnerProgress implements LearnerProgress {
  const factory _LearnerProgress(
      {required final String learnerId,
      required final int totalXp,
      required final int level,
      required final int xpForNextLevel,
      required final int completedLessons,
      required final int totalLessons,
      required final List<String> completedLessonIds}) = _$LearnerProgressImpl;

  factory _LearnerProgress.fromJson(Map<String, dynamic> json) =
      _$LearnerProgressImpl.fromJson;

  @override
  String get learnerId;
  @override
  int get totalXp;
  @override
  int get level;
  @override
  int get xpForNextLevel;
  @override
  int get completedLessons;
  @override
  int get totalLessons;
  @override
  List<String> get completedLessonIds;
  @override
  @JsonKey(ignore: true)
  _$$LearnerProgressImplCopyWith<_$LearnerProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
