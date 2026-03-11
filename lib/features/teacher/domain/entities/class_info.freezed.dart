// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'class_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClassInfo _$ClassInfoFromJson(Map<String, dynamic> json) {
  return _ClassInfo.fromJson(json);
}

/// @nodoc
mixin _$ClassInfo {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get grade => throw _privateConstructorUsedError;
  String get section => throw _privateConstructorUsedError;
  int get totalLearners => throw _privateConstructorUsedError;
  int get onTrack => throw _privateConstructorUsedError;
  int get needsHelp => throw _privateConstructorUsedError;
  int get nonReaders => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClassInfoCopyWith<ClassInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClassInfoCopyWith<$Res> {
  factory $ClassInfoCopyWith(ClassInfo value, $Res Function(ClassInfo) then) =
      _$ClassInfoCopyWithImpl<$Res, ClassInfo>;
  @useResult
  $Res call(
      {String id,
      String name,
      int grade,
      String section,
      int totalLearners,
      int onTrack,
      int needsHelp,
      int nonReaders});
}

/// @nodoc
class _$ClassInfoCopyWithImpl<$Res, $Val extends ClassInfo>
    implements $ClassInfoCopyWith<$Res> {
  _$ClassInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? grade = null,
    Object? section = null,
    Object? totalLearners = null,
    Object? onTrack = null,
    Object? needsHelp = null,
    Object? nonReaders = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      totalLearners: null == totalLearners
          ? _value.totalLearners
          : totalLearners // ignore: cast_nullable_to_non_nullable
              as int,
      onTrack: null == onTrack
          ? _value.onTrack
          : onTrack // ignore: cast_nullable_to_non_nullable
              as int,
      needsHelp: null == needsHelp
          ? _value.needsHelp
          : needsHelp // ignore: cast_nullable_to_non_nullable
              as int,
      nonReaders: null == nonReaders
          ? _value.nonReaders
          : nonReaders // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClassInfoImplCopyWith<$Res>
    implements $ClassInfoCopyWith<$Res> {
  factory _$$ClassInfoImplCopyWith(
          _$ClassInfoImpl value, $Res Function(_$ClassInfoImpl) then) =
      __$$ClassInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      int grade,
      String section,
      int totalLearners,
      int onTrack,
      int needsHelp,
      int nonReaders});
}

/// @nodoc
class __$$ClassInfoImplCopyWithImpl<$Res>
    extends _$ClassInfoCopyWithImpl<$Res, _$ClassInfoImpl>
    implements _$$ClassInfoImplCopyWith<$Res> {
  __$$ClassInfoImplCopyWithImpl(
      _$ClassInfoImpl _value, $Res Function(_$ClassInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? grade = null,
    Object? section = null,
    Object? totalLearners = null,
    Object? onTrack = null,
    Object? needsHelp = null,
    Object? nonReaders = null,
  }) {
    return _then(_$ClassInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      totalLearners: null == totalLearners
          ? _value.totalLearners
          : totalLearners // ignore: cast_nullable_to_non_nullable
              as int,
      onTrack: null == onTrack
          ? _value.onTrack
          : onTrack // ignore: cast_nullable_to_non_nullable
              as int,
      needsHelp: null == needsHelp
          ? _value.needsHelp
          : needsHelp // ignore: cast_nullable_to_non_nullable
              as int,
      nonReaders: null == nonReaders
          ? _value.nonReaders
          : nonReaders // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClassInfoImpl implements _ClassInfo {
  const _$ClassInfoImpl(
      {required this.id,
      required this.name,
      required this.grade,
      required this.section,
      required this.totalLearners,
      required this.onTrack,
      required this.needsHelp,
      required this.nonReaders});

  factory _$ClassInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClassInfoImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int grade;
  @override
  final String section;
  @override
  final int totalLearners;
  @override
  final int onTrack;
  @override
  final int needsHelp;
  @override
  final int nonReaders;

  @override
  String toString() {
    return 'ClassInfo(id: $id, name: $name, grade: $grade, section: $section, totalLearners: $totalLearners, onTrack: $onTrack, needsHelp: $needsHelp, nonReaders: $nonReaders)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClassInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.grade, grade) || other.grade == grade) &&
            (identical(other.section, section) || other.section == section) &&
            (identical(other.totalLearners, totalLearners) ||
                other.totalLearners == totalLearners) &&
            (identical(other.onTrack, onTrack) || other.onTrack == onTrack) &&
            (identical(other.needsHelp, needsHelp) ||
                other.needsHelp == needsHelp) &&
            (identical(other.nonReaders, nonReaders) ||
                other.nonReaders == nonReaders));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, grade, section,
      totalLearners, onTrack, needsHelp, nonReaders);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClassInfoImplCopyWith<_$ClassInfoImpl> get copyWith =>
      __$$ClassInfoImplCopyWithImpl<_$ClassInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClassInfoImplToJson(
      this,
    );
  }
}

abstract class _ClassInfo implements ClassInfo {
  const factory _ClassInfo(
      {required final String id,
      required final String name,
      required final int grade,
      required final String section,
      required final int totalLearners,
      required final int onTrack,
      required final int needsHelp,
      required final int nonReaders}) = _$ClassInfoImpl;

  factory _ClassInfo.fromJson(Map<String, dynamic> json) =
      _$ClassInfoImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int get grade;
  @override
  String get section;
  @override
  int get totalLearners;
  @override
  int get onTrack;
  @override
  int get needsHelp;
  @override
  int get nonReaders;
  @override
  @JsonKey(ignore: true)
  _$$ClassInfoImplCopyWith<_$ClassInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
