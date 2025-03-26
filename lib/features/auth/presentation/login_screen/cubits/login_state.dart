part of 'login_cubit.dart';

@freezed
sealed class LoginState with _$LoginState {
  const factory LoginState.inital({
    @Default(false) bool dummy,
  }) = LoginInitial;
  const factory LoginState.loading({
    @Default(false) bool dummy,
  }) = LoginLoading;
  const factory LoginState.success({
    @Default(false) bool dummy,
    required UserEntity user,
  }) = LoginSuccess;
  const factory LoginState.failure({
    @Default(false) bool dummy,
    required String errorMessage,
  }) = LoginFailure;
}
