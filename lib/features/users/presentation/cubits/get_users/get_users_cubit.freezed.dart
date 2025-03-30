// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_users_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UsersState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is GetUsersState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UsersState()';
  }
}

/// @nodoc
class $UsersStateCopyWith<$Res> {
  $UsersStateCopyWith(GetUsersState _, $Res Function(GetUsersState) __);
}

/// @nodoc

class GetUsersInitial implements GetUsersState {
  const GetUsersInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is GetUsersInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UsersState.initial()';
  }
}

/// @nodoc

class GetUsersLoading implements GetUsersState {
  const GetUsersLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is GetUsersLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UsersState.loading()';
  }
}

/// @nodoc

class GetUsersLoaded implements GetUsersState {
  const GetUsersLoaded(this.getUserEntity);

  final GetUsersEntity getUserEntity;

  /// Create a copy of UsersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadedCopyWith<GetUsersLoaded> get copyWith => _$LoadedCopyWithImpl<GetUsersLoaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is GetUsersLoaded && (identical(other.getUserEntity, getUserEntity) || other.getUserEntity == getUserEntity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, getUserEntity);

  @override
  String toString() {
    return 'UsersState.loaded(getUserEntity: $getUserEntity)';
  }
}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $UsersStateCopyWith<$Res> {
  factory $LoadedCopyWith(GetUsersLoaded value, $Res Function(GetUsersLoaded) _then) = _$LoadedCopyWithImpl;
  @useResult
  $Res call({GetUsersEntity getUserEntity});
}

/// @nodoc
class _$LoadedCopyWithImpl<$Res> implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final GetUsersLoaded _self;
  final $Res Function(GetUsersLoaded) _then;

  /// Create a copy of UsersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? getUserEntity = null,
  }) {
    return _then(GetUsersLoaded(
      null == getUserEntity
          ? _self.getUserEntity
          : getUserEntity // ignore: cast_nullable_to_non_nullable
              as GetUsersEntity,
    ));
  }
}

/// @nodoc

class GetUsersFailed implements GetUsersState {
  const GetUsersFailed(this.message);

  final String message;

  /// Create a copy of UsersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ErrorCopyWith<GetUsersFailed> get copyWith => _$ErrorCopyWithImpl<GetUsersFailed>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is GetUsersFailed && (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'UsersState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $UsersStateCopyWith<$Res> {
  factory $ErrorCopyWith(GetUsersFailed value, $Res Function(GetUsersFailed) _then) = _$ErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ErrorCopyWithImpl<$Res> implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final GetUsersFailed _self;
  final $Res Function(GetUsersFailed) _then;

  /// Create a copy of UsersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(GetUsersFailed(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
