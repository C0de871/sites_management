// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginState {
  bool get dummy;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginStateCopyWith<LoginState> get copyWith =>
      _$LoginStateCopyWithImpl<LoginState>(this as LoginState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginState &&
            (identical(other.dummy, dummy) || other.dummy == dummy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dummy);

  @override
  String toString() {
    return 'LoginState(dummy: $dummy)';
  }
}

/// @nodoc
abstract mixin class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) _then) =
      _$LoginStateCopyWithImpl;
  @useResult
  $Res call({bool dummy});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res> implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._self, this._then);

  final LoginState _self;
  final $Res Function(LoginState) _then;

  /// Create a copy of LoginState
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

class LoginInitial implements LoginState {
  const LoginInitial({this.dummy = false});

  @override
  @JsonKey()
  final bool dummy;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginInitialCopyWith<LoginInitial> get copyWith =>
      _$LoginInitialCopyWithImpl<LoginInitial>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginInitial &&
            (identical(other.dummy, dummy) || other.dummy == dummy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dummy);

  @override
  String toString() {
    return 'LoginState.inital(dummy: $dummy)';
  }
}

/// @nodoc
abstract mixin class $LoginInitialCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory $LoginInitialCopyWith(
          LoginInitial value, $Res Function(LoginInitial) _then) =
      _$LoginInitialCopyWithImpl;
  @override
  @useResult
  $Res call({bool dummy});
}

/// @nodoc
class _$LoginInitialCopyWithImpl<$Res> implements $LoginInitialCopyWith<$Res> {
  _$LoginInitialCopyWithImpl(this._self, this._then);

  final LoginInitial _self;
  final $Res Function(LoginInitial) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? dummy = null,
  }) {
    return _then(LoginInitial(
      dummy: null == dummy
          ? _self.dummy
          : dummy // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class LoginLoading implements LoginState {
  const LoginLoading({this.dummy = false});

  @override
  @JsonKey()
  final bool dummy;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginLoadingCopyWith<LoginLoading> get copyWith =>
      _$LoginLoadingCopyWithImpl<LoginLoading>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginLoading &&
            (identical(other.dummy, dummy) || other.dummy == dummy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dummy);

  @override
  String toString() {
    return 'LoginState.loading(dummy: $dummy)';
  }
}

/// @nodoc
abstract mixin class $LoginLoadingCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory $LoginLoadingCopyWith(
          LoginLoading value, $Res Function(LoginLoading) _then) =
      _$LoginLoadingCopyWithImpl;
  @override
  @useResult
  $Res call({bool dummy});
}

/// @nodoc
class _$LoginLoadingCopyWithImpl<$Res> implements $LoginLoadingCopyWith<$Res> {
  _$LoginLoadingCopyWithImpl(this._self, this._then);

  final LoginLoading _self;
  final $Res Function(LoginLoading) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? dummy = null,
  }) {
    return _then(LoginLoading(
      dummy: null == dummy
          ? _self.dummy
          : dummy // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class LoginSuccess implements LoginState {
  const LoginSuccess({this.dummy = false, required this.user});

  @override
  @JsonKey()
  final bool dummy;
  final UserEntity user;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginSuccessCopyWith<LoginSuccess> get copyWith =>
      _$LoginSuccessCopyWithImpl<LoginSuccess>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginSuccess &&
            (identical(other.dummy, dummy) || other.dummy == dummy) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dummy, user);

  @override
  String toString() {
    return 'LoginState.success(dummy: $dummy, user: $user)';
  }
}

/// @nodoc
abstract mixin class $LoginSuccessCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory $LoginSuccessCopyWith(
          LoginSuccess value, $Res Function(LoginSuccess) _then) =
      _$LoginSuccessCopyWithImpl;
  @override
  @useResult
  $Res call({bool dummy, UserEntity user});
}

/// @nodoc
class _$LoginSuccessCopyWithImpl<$Res> implements $LoginSuccessCopyWith<$Res> {
  _$LoginSuccessCopyWithImpl(this._self, this._then);

  final LoginSuccess _self;
  final $Res Function(LoginSuccess) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? dummy = null,
    Object? user = null,
  }) {
    return _then(LoginSuccess(
      dummy: null == dummy
          ? _self.dummy
          : dummy // ignore: cast_nullable_to_non_nullable
              as bool,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
    ));
  }
}

/// @nodoc

class LoginFailure implements LoginState {
  const LoginFailure({this.dummy = false, required this.errorMessage});

  @override
  @JsonKey()
  final bool dummy;
  final String errorMessage;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginFailureCopyWith<LoginFailure> get copyWith =>
      _$LoginFailureCopyWithImpl<LoginFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginFailure &&
            (identical(other.dummy, dummy) || other.dummy == dummy) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dummy, errorMessage);

  @override
  String toString() {
    return 'LoginState.failure(dummy: $dummy, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $LoginFailureCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory $LoginFailureCopyWith(
          LoginFailure value, $Res Function(LoginFailure) _then) =
      _$LoginFailureCopyWithImpl;
  @override
  @useResult
  $Res call({bool dummy, String errorMessage});
}

/// @nodoc
class _$LoginFailureCopyWithImpl<$Res> implements $LoginFailureCopyWith<$Res> {
  _$LoginFailureCopyWithImpl(this._self, this._then);

  final LoginFailure _self;
  final $Res Function(LoginFailure) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? dummy = null,
    Object? errorMessage = null,
  }) {
    return _then(LoginFailure(
      dummy: null == dummy
          ? _self.dummy
          : dummy // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
