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
mixin _$GetUsersState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GetUsersState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GetUsersState()';
  }
}

/// @nodoc
class $GetUsersStateCopyWith<$Res> {
  $GetUsersStateCopyWith(GetUsersState _, $Res Function(GetUsersState) __);
}

/// @nodoc

class GetUsersInitial implements GetUsersState {
  const GetUsersInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GetUsersInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GetUsersState.initial()';
  }
}

/// @nodoc

class GetUsersLoading implements GetUsersState {
  const GetUsersLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GetUsersLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GetUsersState.loading()';
  }
}

/// @nodoc

class GetUsersLoaded implements GetUsersState {
  const GetUsersLoaded(this.getUserEntity);

  final GetUsersEntity getUserEntity;

  /// Create a copy of GetUsersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetUsersLoadedCopyWith<GetUsersLoaded> get copyWith =>
      _$GetUsersLoadedCopyWithImpl<GetUsersLoaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetUsersLoaded &&
            (identical(other.getUserEntity, getUserEntity) ||
                other.getUserEntity == getUserEntity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, getUserEntity);

  @override
  String toString() {
    return 'GetUsersState.loaded(getUserEntity: $getUserEntity)';
  }
}

/// @nodoc
abstract mixin class $GetUsersLoadedCopyWith<$Res>
    implements $GetUsersStateCopyWith<$Res> {
  factory $GetUsersLoadedCopyWith(
          GetUsersLoaded value, $Res Function(GetUsersLoaded) _then) =
      _$GetUsersLoadedCopyWithImpl;
  @useResult
  $Res call({GetUsersEntity getUserEntity});
}

/// @nodoc
class _$GetUsersLoadedCopyWithImpl<$Res>
    implements $GetUsersLoadedCopyWith<$Res> {
  _$GetUsersLoadedCopyWithImpl(this._self, this._then);

  final GetUsersLoaded _self;
  final $Res Function(GetUsersLoaded) _then;

  /// Create a copy of GetUsersState
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

  /// Create a copy of GetUsersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetUsersFailedCopyWith<GetUsersFailed> get copyWith =>
      _$GetUsersFailedCopyWithImpl<GetUsersFailed>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetUsersFailed &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'GetUsersState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $GetUsersFailedCopyWith<$Res>
    implements $GetUsersStateCopyWith<$Res> {
  factory $GetUsersFailedCopyWith(
          GetUsersFailed value, $Res Function(GetUsersFailed) _then) =
      _$GetUsersFailedCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$GetUsersFailedCopyWithImpl<$Res>
    implements $GetUsersFailedCopyWith<$Res> {
  _$GetUsersFailedCopyWithImpl(this._self, this._then);

  final GetUsersFailed _self;
  final $Res Function(GetUsersFailed) _then;

  /// Create a copy of GetUsersState
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
