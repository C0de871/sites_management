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
  $UpdateAddUserStateCopyWith<UpdateAddUserState> get copyWith =>
      _$UpdateAddUserStateCopyWithImpl<UpdateAddUserState>(
          this as UpdateAddUserState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateAddUserState &&
            (identical(other.dummy, dummy) || other.dummy == dummy));
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
  factory $UpdateAddUserStateCopyWith(
          UpdateAddUserState value, $Res Function(UpdateAddUserState) _then) =
      _$UpdateAddUserStateCopyWithImpl;
  @useResult
  $Res call({bool dummy});
}

/// @nodoc
class _$UpdateAddUserStateCopyWithImpl<$Res>
    implements $UpdateAddUserStateCopyWith<$Res> {
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
  $UpdateAddUserInitialCopyWith<UpdateAddUserInitial> get copyWith =>
      _$UpdateAddUserInitialCopyWithImpl<UpdateAddUserInitial>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateAddUserInitial &&
            (identical(other.dummy, dummy) || other.dummy == dummy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dummy);

  @override
  String toString() {
    return 'UpdateAddUserState.initial(dummy: $dummy)';
  }
}

/// @nodoc
abstract mixin class $UpdateAddUserInitialCopyWith<$Res>
    implements $UpdateAddUserStateCopyWith<$Res> {
  factory $UpdateAddUserInitialCopyWith(UpdateAddUserInitial value,
          $Res Function(UpdateAddUserInitial) _then) =
      _$UpdateAddUserInitialCopyWithImpl;
  @override
  @useResult
  $Res call({bool dummy});
}

/// @nodoc
class _$UpdateAddUserInitialCopyWithImpl<$Res>
    implements $UpdateAddUserInitialCopyWith<$Res> {
  _$UpdateAddUserInitialCopyWithImpl(this._self, this._then);

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
  $UpdateAddUserLoadingCopyWith<UpdateAddUserLoading> get copyWith =>
      _$UpdateAddUserLoadingCopyWithImpl<UpdateAddUserLoading>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateAddUserLoading &&
            (identical(other.dummy, dummy) || other.dummy == dummy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dummy);

  @override
  String toString() {
    return 'UpdateAddUserState.submitting(dummy: $dummy)';
  }
}

/// @nodoc
abstract mixin class $UpdateAddUserLoadingCopyWith<$Res>
    implements $UpdateAddUserStateCopyWith<$Res> {
  factory $UpdateAddUserLoadingCopyWith(UpdateAddUserLoading value,
          $Res Function(UpdateAddUserLoading) _then) =
      _$UpdateAddUserLoadingCopyWithImpl;
  @override
  @useResult
  $Res call({bool dummy});
}

/// @nodoc
class _$UpdateAddUserLoadingCopyWithImpl<$Res>
    implements $UpdateAddUserLoadingCopyWith<$Res> {
  _$UpdateAddUserLoadingCopyWithImpl(this._self, this._then);

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
  $UpdateAddUserSuccessCopyWith<UpdateAddUserSuccess> get copyWith =>
      _$UpdateAddUserSuccessCopyWithImpl<UpdateAddUserSuccess>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateAddUserSuccess &&
            (identical(other.dummy, dummy) || other.dummy == dummy) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dummy, message);

  @override
  String toString() {
    return 'UpdateAddUserState.success(dummy: $dummy, message: $message)';
  }
}

/// @nodoc
abstract mixin class $UpdateAddUserSuccessCopyWith<$Res>
    implements $UpdateAddUserStateCopyWith<$Res> {
  factory $UpdateAddUserSuccessCopyWith(UpdateAddUserSuccess value,
          $Res Function(UpdateAddUserSuccess) _then) =
      _$UpdateAddUserSuccessCopyWithImpl;
  @override
  @useResult
  $Res call({bool dummy, String message});
}

/// @nodoc
class _$UpdateAddUserSuccessCopyWithImpl<$Res>
    implements $UpdateAddUserSuccessCopyWith<$Res> {
  _$UpdateAddUserSuccessCopyWithImpl(this._self, this._then);

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
  $UpdateAddUserFailedCopyWith<UpdateAddUserFailed> get copyWith =>
      _$UpdateAddUserFailedCopyWithImpl<UpdateAddUserFailed>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateAddUserFailed &&
            (identical(other.dummy, dummy) || other.dummy == dummy) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dummy, message);

  @override
  String toString() {
    return 'UpdateAddUserState.error(dummy: $dummy, message: $message)';
  }
}

/// @nodoc
abstract mixin class $UpdateAddUserFailedCopyWith<$Res>
    implements $UpdateAddUserStateCopyWith<$Res> {
  factory $UpdateAddUserFailedCopyWith(
          UpdateAddUserFailed value, $Res Function(UpdateAddUserFailed) _then) =
      _$UpdateAddUserFailedCopyWithImpl;
  @override
  @useResult
  $Res call({bool dummy, String message});
}

/// @nodoc
class _$UpdateAddUserFailedCopyWithImpl<$Res>
    implements $UpdateAddUserFailedCopyWith<$Res> {
  _$UpdateAddUserFailedCopyWithImpl(this._self, this._then);

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
