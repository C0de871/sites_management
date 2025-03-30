// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_add_users_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateAddUserState {
  bool get dummy;

  /// Create a copy of UpdateAddUserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateAddUserStateCopyWith<UpdateAddUserState> get copyWith => _$UpdateAddUserStateCopyWithImpl<UpdateAddUserState>(this as UpdateAddUserState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is UpdateAddUserState && (identical(other.dummy, dummy) || other.dummy == dummy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dummy);

  @override
  String toString() {
    return 'UpdateAddUserState(dummy: $dummy)';
  }
}

/// @nodoc
abstract mixin class $UpdateAddUserStateCopyWith<$Res> {
  factory $UpdateAddUserStateCopyWith(UpdateAddUserState value, $Res Function(UpdateAddUserState) _then) = _$UpdateAddUserStateCopyWithImpl;
  @useResult
  $Res call({bool dummy});
}

/// @nodoc
class _$UpdateAddUserStateCopyWithImpl<$Res> implements $UpdateAddUserStateCopyWith<$Res> {
  _$UpdateAddUserStateCopyWithImpl(this._self, this._then);

  final UpdateAddUserState _self;
  final $Res Function(UpdateAddUserState) _then;

  /// Create a copy of UpdateAddUserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dummy = null,
  }) {
    return _then(_self.copyWith(
      dummy: null == dummy
          ? _self.dummy
          : dummy // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class UpdateAddUserInitial implements UpdateAddUserState {
  const UpdateAddUserInitial({this.dummy = false});

  @override
  @JsonKey()
  final bool dummy;

  /// Create a copy of UpdateAddUserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InitialCopyWith<UpdateAddUserInitial> get copyWith => _$InitialCopyWithImpl<UpdateAddUserInitial>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is UpdateAddUserInitial && (identical(other.dummy, dummy) || other.dummy == dummy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dummy);

  @override
  String toString() {
    return 'UpdateAddUserState.initial(dummy: $dummy)';
  }
}

/// @nodoc
abstract mixin class $InitialCopyWith<$Res> implements $UpdateAddUserStateCopyWith<$Res> {
  factory $InitialCopyWith(UpdateAddUserInitial value, $Res Function(UpdateAddUserInitial) _then) = _$InitialCopyWithImpl;
  @override
  @useResult
  $Res call({bool dummy});
}

/// @nodoc
class _$InitialCopyWithImpl<$Res> implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(this._self, this._then);

  final UpdateAddUserInitial _self;
  final $Res Function(UpdateAddUserInitial) _then;

  /// Create a copy of UpdateAddUserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? dummy = null,
  }) {
    return _then(UpdateAddUserInitial(
      dummy: null == dummy
          ? _self.dummy
          : dummy // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class UpdateAddUserLoading implements UpdateAddUserState {
  const UpdateAddUserLoading({this.dummy = false});

  @override
  @JsonKey()
  final bool dummy;

  /// Create a copy of UpdateAddUserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubmittingCopyWith<UpdateAddUserLoading> get copyWith => _$SubmittingCopyWithImpl<UpdateAddUserLoading>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is UpdateAddUserLoading && (identical(other.dummy, dummy) || other.dummy == dummy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dummy);

  @override
  String toString() {
    return 'UpdateAddUserState.submitting(dummy: $dummy)';
  }
}

/// @nodoc
abstract mixin class $SubmittingCopyWith<$Res> implements $UpdateAddUserStateCopyWith<$Res> {
  factory $SubmittingCopyWith(UpdateAddUserLoading value, $Res Function(UpdateAddUserLoading) _then) = _$SubmittingCopyWithImpl;
  @override
  @useResult
  $Res call({bool dummy});
}

/// @nodoc
class _$SubmittingCopyWithImpl<$Res> implements $SubmittingCopyWith<$Res> {
  _$SubmittingCopyWithImpl(this._self, this._then);

  final UpdateAddUserLoading _self;
  final $Res Function(UpdateAddUserLoading) _then;

  /// Create a copy of UpdateAddUserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? dummy = null,
  }) {
    return _then(UpdateAddUserLoading(
      dummy: null == dummy
          ? _self.dummy
          : dummy // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class UpdateAddUserSuccess implements UpdateAddUserState {
  const UpdateAddUserSuccess({this.dummy = false, required this.message});

  @override
  @JsonKey()
  final bool dummy;
  final String message;

  /// Create a copy of UpdateAddUserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SuccessCopyWith<UpdateAddUserSuccess> get copyWith => _$SuccessCopyWithImpl<UpdateAddUserSuccess>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is UpdateAddUserSuccess && (identical(other.dummy, dummy) || other.dummy == dummy) && (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dummy, message);

  @override
  String toString() {
    return 'UpdateAddUserState.success(dummy: $dummy, message: $message)';
  }
}

/// @nodoc
abstract mixin class $SuccessCopyWith<$Res> implements $UpdateAddUserStateCopyWith<$Res> {
  factory $SuccessCopyWith(UpdateAddUserSuccess value, $Res Function(UpdateAddUserSuccess) _then) = _$SuccessCopyWithImpl;
  @override
  @useResult
  $Res call({bool dummy, String message});
}

/// @nodoc
class _$SuccessCopyWithImpl<$Res> implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final UpdateAddUserSuccess _self;
  final $Res Function(UpdateAddUserSuccess) _then;

  /// Create a copy of UpdateAddUserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? dummy = null,
    Object? message = null,
  }) {
    return _then(UpdateAddUserSuccess(
      dummy: null == dummy
          ? _self.dummy
          : dummy // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class UpdateAddUserFailed implements UpdateAddUserState {
  const UpdateAddUserFailed({this.dummy = false, required this.message});

  @override
  @JsonKey()
  final bool dummy;
  final String message;

  /// Create a copy of UpdateAddUserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ErrorCopyWith<UpdateAddUserFailed> get copyWith => _$ErrorCopyWithImpl<UpdateAddUserFailed>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is UpdateAddUserFailed && (identical(other.dummy, dummy) || other.dummy == dummy) && (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dummy, message);

  @override
  String toString() {
    return 'UpdateAddUserState.error(dummy: $dummy, message: $message)';
  }
}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $UpdateAddUserStateCopyWith<$Res> {
  factory $ErrorCopyWith(UpdateAddUserFailed value, $Res Function(UpdateAddUserFailed) _then) = _$ErrorCopyWithImpl;
  @override
  @useResult
  $Res call({bool dummy, String message});
}

/// @nodoc
class _$ErrorCopyWithImpl<$Res> implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final UpdateAddUserFailed _self;
  final $Res Function(UpdateAddUserFailed) _then;

  /// Create a copy of UpdateAddUserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? dummy = null,
    Object? message = null,
  }) {
    return _then(UpdateAddUserFailed(
      dummy: null == dummy
          ? _self.dummy
          : dummy // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
