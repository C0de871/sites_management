// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_users_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeleteUserState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is DeleteUserState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DeleteUserState()';
  }
}

/// @nodoc
class $DeleteUserStateCopyWith<$Res> {
  $DeleteUserStateCopyWith(DeleteUserState _, $Res Function(DeleteUserState) __);
}

/// @nodoc

class DeleteUsersInitial implements DeleteUserState {
  const DeleteUsersInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is DeleteUsersInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DeleteUserState.initial()';
  }
}

/// @nodoc

class DeleteUsersLoading implements DeleteUserState {
  const DeleteUsersLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is DeleteUsersLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DeleteUserState.inProgress()';
  }
}

/// @nodoc

class DeleteUsersSuccess implements DeleteUserState {
  const DeleteUsersSuccess(this.message);

  final String message;

  /// Create a copy of DeleteUserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SuccessCopyWith<DeleteUsersSuccess> get copyWith => _$SuccessCopyWithImpl<DeleteUsersSuccess>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is DeleteUsersSuccess && (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'DeleteUserState.success(message: $message)';
  }
}

/// @nodoc
abstract mixin class $SuccessCopyWith<$Res> implements $DeleteUserStateCopyWith<$Res> {
  factory $SuccessCopyWith(DeleteUsersSuccess value, $Res Function(DeleteUsersSuccess) _then) = _$SuccessCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$SuccessCopyWithImpl<$Res> implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final DeleteUsersSuccess _self;
  final $Res Function(DeleteUsersSuccess) _then;

  /// Create a copy of DeleteUserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(DeleteUsersSuccess(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class DeleteUsersFailed implements DeleteUserState {
  const DeleteUsersFailed(this.message);

  final String message;

  /// Create a copy of DeleteUserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ErrorCopyWith<DeleteUsersFailed> get copyWith => _$ErrorCopyWithImpl<DeleteUsersFailed>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is DeleteUsersFailed && (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'DeleteUserState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $DeleteUserStateCopyWith<$Res> {
  factory $ErrorCopyWith(DeleteUsersFailed value, $Res Function(DeleteUsersFailed) _then) = _$ErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ErrorCopyWithImpl<$Res> implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final DeleteUsersFailed _self;
  final $Res Function(DeleteUsersFailed) _then;

  /// Create a copy of DeleteUserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(DeleteUsersFailed(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
