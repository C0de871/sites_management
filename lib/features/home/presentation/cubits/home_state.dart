// ignore_for_file: constant_identifier_names

part of 'home_cubit.dart';

@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState.inital({
    @Default(false) bool dummy,
  }) = HomeInitial;
  const factory HomeState.loading({
    @Default(false) bool dummy,
  }) = HomeLoading;
  const factory HomeState.success({
    @Default(false) bool dummy,
    required UserRole role,
  }) = HomeSuccess;
  const factory HomeState.failure({
    @Default(false) bool dummy,
    required String errorMessage,
  }) = HomeFailure;
}

enum UserRole {
  MANAGER,
  GUEST,
  WORKER,
  SITE_ADMIN,
  MTN,
}
