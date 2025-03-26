// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeState {
  bool get dummy;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeStateCopyWith<HomeState> get copyWith =>
      _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeState &&
            (identical(other.dummy, dummy) || other.dummy == dummy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dummy);

  @override
  String toString() {
    return 'HomeState(dummy: $dummy)';
  }
}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) =
      _$HomeStateCopyWithImpl;
  @useResult
  $Res call({bool dummy});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

  /// Create a copy of HomeState
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

class HomeInitial implements HomeState {
  const HomeInitial({this.dummy = false});

  @override
  @JsonKey()
  final bool dummy;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeInitialCopyWith<HomeInitial> get copyWith =>
      _$HomeInitialCopyWithImpl<HomeInitial>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeInitial &&
            (identical(other.dummy, dummy) || other.dummy == dummy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dummy);

  @override
  String toString() {
    return 'HomeState.inital(dummy: $dummy)';
  }
}

/// @nodoc
abstract mixin class $HomeInitialCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory $HomeInitialCopyWith(
          HomeInitial value, $Res Function(HomeInitial) _then) =
      _$HomeInitialCopyWithImpl;
  @override
  @useResult
  $Res call({bool dummy});
}

/// @nodoc
class _$HomeInitialCopyWithImpl<$Res> implements $HomeInitialCopyWith<$Res> {
  _$HomeInitialCopyWithImpl(this._self, this._then);

  final HomeInitial _self;
  final $Res Function(HomeInitial) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? dummy = null,
  }) {
    return _then(HomeInitial(
      dummy: null == dummy
          ? _self.dummy
          : dummy // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class HomeLoading implements HomeState {
  const HomeLoading({this.dummy = false});

  @override
  @JsonKey()
  final bool dummy;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeLoadingCopyWith<HomeLoading> get copyWith =>
      _$HomeLoadingCopyWithImpl<HomeLoading>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeLoading &&
            (identical(other.dummy, dummy) || other.dummy == dummy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dummy);

  @override
  String toString() {
    return 'HomeState.loading(dummy: $dummy)';
  }
}

/// @nodoc
abstract mixin class $HomeLoadingCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory $HomeLoadingCopyWith(
          HomeLoading value, $Res Function(HomeLoading) _then) =
      _$HomeLoadingCopyWithImpl;
  @override
  @useResult
  $Res call({bool dummy});
}

/// @nodoc
class _$HomeLoadingCopyWithImpl<$Res> implements $HomeLoadingCopyWith<$Res> {
  _$HomeLoadingCopyWithImpl(this._self, this._then);

  final HomeLoading _self;
  final $Res Function(HomeLoading) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? dummy = null,
  }) {
    return _then(HomeLoading(
      dummy: null == dummy
          ? _self.dummy
          : dummy // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class HomeSuccess implements HomeState {
  const HomeSuccess({this.dummy = false, required this.role});

  @override
  @JsonKey()
  final bool dummy;
  final UserRole role;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeSuccessCopyWith<HomeSuccess> get copyWith =>
      _$HomeSuccessCopyWithImpl<HomeSuccess>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeSuccess &&
            (identical(other.dummy, dummy) || other.dummy == dummy) &&
            (identical(other.role, role) || other.role == role));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dummy, role);

  @override
  String toString() {
    return 'HomeState.success(dummy: $dummy, role: $role)';
  }
}

/// @nodoc
abstract mixin class $HomeSuccessCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory $HomeSuccessCopyWith(
          HomeSuccess value, $Res Function(HomeSuccess) _then) =
      _$HomeSuccessCopyWithImpl;
  @override
  @useResult
  $Res call({bool dummy, UserRole role});
}

/// @nodoc
class _$HomeSuccessCopyWithImpl<$Res> implements $HomeSuccessCopyWith<$Res> {
  _$HomeSuccessCopyWithImpl(this._self, this._then);

  final HomeSuccess _self;
  final $Res Function(HomeSuccess) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? dummy = null,
    Object? role = null,
  }) {
    return _then(HomeSuccess(
      dummy: null == dummy
          ? _self.dummy
          : dummy // ignore: cast_nullable_to_non_nullable
              as bool,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
    ));
  }
}

/// @nodoc

class HomeFailure implements HomeState {
  const HomeFailure({this.dummy = false, required this.errorMessage});

  @override
  @JsonKey()
  final bool dummy;
  final String errorMessage;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeFailureCopyWith<HomeFailure> get copyWith =>
      _$HomeFailureCopyWithImpl<HomeFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeFailure &&
            (identical(other.dummy, dummy) || other.dummy == dummy) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dummy, errorMessage);

  @override
  String toString() {
    return 'HomeState.failure(dummy: $dummy, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $HomeFailureCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory $HomeFailureCopyWith(
          HomeFailure value, $Res Function(HomeFailure) _then) =
      _$HomeFailureCopyWithImpl;
  @override
  @useResult
  $Res call({bool dummy, String errorMessage});
}

/// @nodoc
class _$HomeFailureCopyWithImpl<$Res> implements $HomeFailureCopyWith<$Res> {
  _$HomeFailureCopyWithImpl(this._self, this._then);

  final HomeFailure _self;
  final $Res Function(HomeFailure) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? dummy = null,
    Object? errorMessage = null,
  }) {
    return _then(HomeFailure(
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
