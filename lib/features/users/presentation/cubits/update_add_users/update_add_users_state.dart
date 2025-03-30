// // cubits/user_form_state.dart
// abstract class UserFormState {}

// class UserFormInitial extends UserFormState {}

// class UserFormSubmitting extends UserFormState {}

// class UserFormSuccess extends UserFormState {}

// class UserFormError extends UserFormState {
//   final String message;

//   UserFormError(this.message);
// }

//generate state with freezed and sealed

part of 'update_add_users_cubit.dart';

@freezed
sealed class UpdateAddUserState with _$UpdateAddUserState {
  const factory UpdateAddUserState.initial({@Default(false) bool dummy}) = UpdateAddUserInitial;
  const factory UpdateAddUserState.submitting({@Default(false) bool dummy}) = UpdateAddUserLoading;
  const factory UpdateAddUserState.success({@Default(false) bool dummy, required String message}) = UpdateAddUserSuccess;
  const factory UpdateAddUserState.error({@Default(false) bool dummy, required String message}) = UpdateAddUserFailed;
}
