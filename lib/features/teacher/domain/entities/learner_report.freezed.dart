// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learner_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LearnerReport _$LearnerReportFromJson(Map<String, dynamic> json) {
  return _LearnerReport.fromJson(json);
}

/// @nodoc
mixin _$LearnerReport {
  String get learnerId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get lessonsCompleted => throw _privateConstructorUsedError;
  double get avgScore => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  List<String> get struggleWords => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LearnerReportCopyWith<LearnerReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LearnerReportCopyWith<$Res> {
  factory $LearnerReportCopyWith(
          LearnerReport value, $Res Function(LearnerReport) then) =
      _$LearnerReportCopyWithImpl<$Res, LearnerReport>;
  @useResult
  $Res call(
      {String learnerId,
      String name,
      int lessonsCompleted,
      double avgScore,
      String status,
      List<String> struggleWords});
}

/// @nodoc
class _$LearnerReportCopyWithImpl<$Res, $Val extends LearnerReport>
    implements $LearnerReportCopyWith<$Res> {
  _$LearnerReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? learnerId = null,
    Object? name = null,
    Object? lessonsCompleted = null,
    Object? avgScore = null,
    Object? status = null,
    Object? struggleWords = null,
  }) {
    return _then(_value.copyWith(
      learnerId: null == learnerId
          ? _value.learnerId
          : learnerId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lessonsCompleted: null == lessonsCompleted
          ? _value.lessonsCompleted
          : lessonsCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      avgScore: null == avgScore
          ? _value.avgScore
          : avgScore // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      struggleWords: null == struggleWords
          ? _value.struggleWords
          : struggleWords // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LearnerReportImplCopyWith<$Res>
    implements $LearnerReportCopyWith<$Res> {
  factory _$$LearnerReportImplCopyWith(
          _$LearnerReportImpl value, $Res Function(_$LearnerReportImpl) then) =
      __$$LearnerReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String learnerId,
      String name,
      int lessonsCompleted,
      double avgScore,
      String status,
      List<String> struggleWords});
}

/// @nodoc
class __$$LearnerReportImplCopyWithImpl<$Res>
    extends _$LearnerReportCopyWithImpl<$Res, _$LearnerReportImpl>
    implements _$$LearnerReportImplCopyWith<$Res> {
  __$$LearnerReportImplCopyWithImpl(
      _$LearnerReportImpl _value, $Res Function(_$LearnerReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? learnerId = null,
    Object? name = null,
    Object? lessonsCompleted = null,
    Object? avgScore = null,
    Object? status = null,
    Object? struggleWords = null,
  }) {
    return _then(_$LearnerReportImpl(
      learnerId: null == learnerId
          ? _value.learnerId
          : learnerId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lessonsCompleted: null == lessonsCompleted
          ? _value.lessonsCompleted
          : lessonsCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      avgScore: null == avgScore
          ? _value.avgScore
          : avgScore // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      struggleWords: null == struggleWords
          ? _value._struggleWords
          : struggleWords // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LearnerReportImpl implements _LearnerReport {
  const _$LearnerReportImpl(
      {required this.learnerId,
      required this.name,
      required this.lessonsCompleted,
      required this.avgScore,
      required this.status,
      required final List<String> struggleWords})
      : _struggleWords = struggleWords;

  factory _$LearnerReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$LearnerReportImplFromJson(json);

  @override
  final String learnerId;
  @override
  final String name;
  @override
  final int lessonsCompleted;
  @override
  final double avgScore;
  @override
  final String status;
  final List<String> _struggleWords;
  @override
  List<String> get struggleWords {
    if (_struggleWords is EqualUnmodifiableListView) return _struggleWords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_struggleWords);
  }

  @override
  String toString() {
    return 'LearnerReport(learnerId: $learnerId, name: $name, lessonsCompleted: $lessonsCompleted, avgScore: $avgScore, status: $status, struggleWords: $struggleWords)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LearnerReportImpl &&
            (identical(other.learnerId, learnerId) ||
                other.learnerId == learnerId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lessonsCompleted, lessonsCompleted) ||
                other.lessonsCompleted == lessonsCompleted) &&
            (identical(other.avgScore, avgScore) ||
                other.avgScore == avgScore) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._struggleWords, _struggleWords));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      learnerId,
      name,
      lessonsCompleted,
      avgScore,
      status,
      const DeepCollectionEquality().hash(_struggleWords));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LearnerReportImplCopyWith<_$LearnerReportImpl> get copyWith =>
      __$$LearnerReportImplCopyWithImpl<_$LearnerReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LearnerReportImplToJson(
      this,
    );
  }
}

abstract class _LearnerReport implements LearnerReport {
  const factory _LearnerReport(
      {required final String learnerId,
      required final String name,
      required final int lessonsCompleted,
      required final double avgScore,
      required final String status,
      required final List<String> struggleWords}) = _$LearnerReportImpl;

  factory _LearnerReport.fromJson(Map<String, dynamic> json) =
      _$LearnerReportImpl.fromJson;

  @override
  String get learnerId;
  @override
  String get name;
  @override
  int get lessonsCompleted;
  @override
  double get avgScore;
  @override
  String get status;
  @override
  List<String> get struggleWords;
  @override
  @JsonKey(ignore: true)
  _$$LearnerReportImplCopyWith<_$LearnerReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
