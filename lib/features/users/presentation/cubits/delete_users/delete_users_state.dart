part of 'delete_users_cubit.dart';

@freezed
class DeleteUserState with _$DeleteUserState {
  const factory DeleteUserState.initial() = DeleteUsersInitial;
  const factory DeleteUserState.inProgress() = DeleteUsersLoading;
  const factory DeleteUserState.success(String message) = DeleteUsersSuccess;
  const factory DeleteUserState.error(String message) = DeleteUsersFailed;
}
