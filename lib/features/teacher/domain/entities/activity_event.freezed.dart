// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ActivityEvent _$ActivityEventFromJson(Map<String, dynamic> json) {
  return _ActivityEvent.fromJson(json);
}

/// @nodoc
mixin _$ActivityEvent {
  String get id => throw _privateConstructorUsedError;
  String get learnerName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActivityEventCopyWith<ActivityEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityEventCopyWith<$Res> {
  factory $ActivityEventCopyWith(
          ActivityEvent value, $Res Function(ActivityEvent) then) =
      _$ActivityEventCopyWithImpl<$Res, ActivityEvent>;
  @useResult
  $Res call(
      {String id, String learnerName, String description, DateTime timestamp});
}

/// @nodoc
class _$ActivityEventCopyWithImpl<$Res, $Val extends ActivityEvent>
    implements $ActivityEventCopyWith<$Res> {
  _$ActivityEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? learnerName = null,
    Object? description = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      learnerName: null == learnerName
          ? _value.learnerName
          : learnerName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActivityEventImplCopyWith<$Res>
    implements $ActivityEventCopyWith<$Res> {
  factory _$$ActivityEventImplCopyWith(
          _$ActivityEventImpl value, $Res Function(_$ActivityEventImpl) then) =
      __$$ActivityEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String learnerName, String description, DateTime timestamp});
}

/// @nodoc
class __$$ActivityEventImplCopyWithImpl<$Res>
    extends _$ActivityEventCopyWithImpl<$Res, _$ActivityEventImpl>
    implements _$$ActivityEventImplCopyWith<$Res> {
  __$$ActivityEventImplCopyWithImpl(
      _$ActivityEventImpl _value, $Res Function(_$ActivityEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? learnerName = null,
    Object? description = null,
    Object? timestamp = null,
  }) {
    return _then(_$ActivityEventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      learnerName: null == learnerName
          ? _value.learnerName
          : learnerName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActivityEventImpl implements _ActivityEvent {
  const _$ActivityEventImpl(
      {required this.id,
      required this.learnerName,
      required this.description,
      required this.timestamp});

  factory _$ActivityEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivityEventImplFromJson(json);

  @override
  final String id;
  @override
  final String learnerName;
  @override
  final String description;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'ActivityEvent(id: $id, learnerName: $learnerName, description: $description, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.learnerName, learnerName) ||
                other.learnerName == learnerName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, learnerName, description, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityEventImplCopyWith<_$ActivityEventImpl> get copyWith =>
      __$$ActivityEventImplCopyWithImpl<_$ActivityEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivityEventImplToJson(
      this,
    );
  }
}

abstract class _ActivityEvent implements ActivityEvent {
  const factory _ActivityEvent(
      {required final String id,
      required final String learnerName,
      required final String description,
      required final DateTime timestamp}) = _$ActivityEventImpl;

  factory _ActivityEvent.fromJson(Map<String, dynamic> json) =
      _$ActivityEventImpl.fromJson;

  @override
  String get id;
  @override
  String get learnerName;
  @override
  String get description;
  @override
  DateTime get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$ActivityEventImplCopyWith<_$ActivityEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
